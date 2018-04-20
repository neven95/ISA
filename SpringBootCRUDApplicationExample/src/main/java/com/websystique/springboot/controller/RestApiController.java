package com.websystique.springboot.controller;

import java.util.List;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.util.UriComponentsBuilder;

import com.websystique.springboot.model.LoginForm;
//import com.nulabinc.zxcvbn.Strength;
//import com.nulabinc.zxcvbn.Zxcvbn;
import com.websystique.springboot.model.User;
import com.websystique.springboot.service.EmailService;
import com.websystique.springboot.service.UserService;
import com.websystique.springboot.util.CustomErrorType;

import javassist.bytecode.StackMap.Writer;

@RestController
@RequestMapping("/api")
public class RestApiController {

	public static final Logger logger = LoggerFactory.getLogger(RestApiController.class);

	
	private UserService userService; //Service which will do all data retrieval/manipulation work
	
	
//	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	private EmailService emailService;
	
	@Autowired
    public RestApiController( UserService userService, EmailService emailService) {
      
     // this.bCryptPasswordEncoder = bCryptPasswordEncoder;
      this.userService = userService;
      this.emailService = emailService;
    }
	
	// -------------------Retrieve All Users---------------------------------------------

	@RequestMapping(value = "/user/", method = RequestMethod.GET)
	public ResponseEntity<List<User>> listAllUsers() {
		List<User> users = userService.findAllUsers();
		if (users.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
			// You many decide to return HttpStatus.NOT_FOUND
		}
		return new ResponseEntity<List<User>>(users, HttpStatus.OK);
	}
	
	// ------- Authenticate user when loging in
	
	@RequestMapping(value = "/authenticate/{username}", method = RequestMethod.POST)
	public ResponseEntity<?> getLoginUser(@PathVariable("username") String username,Writer writer,@RequestBody LoginForm loginForm) {
		System.out.println("************* usao je i poslao username: " + username);
		//Enumeration<String> atributi =  request.getAttributeNames();
		System.out.println(loginForm);
		
		/*if (users.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
			// You many decide to return HttpStatus.NOT_FOUND
		}*/
		User user = userService.findByUsername(loginForm.getUsername());
		if(user == null){
			return new ResponseEntity(new CustomErrorType("User with username " +  loginForm.getUsername()
					+ " not found"), HttpStatus.NOT_FOUND);
		}else if(!user.getPassword().equals(loginForm.getPassword())){
			return new ResponseEntity(new CustomErrorType("Wrong password for user with username: " +  loginForm.getUsername()
			), HttpStatus.NOT_FOUND);
		}else if(user.isEnabled() == false){
			return new ResponseEntity(new CustomErrorType("User with username " +  loginForm.getUsername()
			+	"not found"	), HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<String>(user.getType(), HttpStatus.OK);
	}

	// -------------------Retrieve Single User------------------------------------------

	@RequestMapping(value = "/user/{username}", method = RequestMethod.GET)
	public ResponseEntity<?> getUser(@PathVariable("username") String username) {
		logger.info("Fetching User with username {}", username);
		User user = userService.findByUsername(username);
		if (user == null) {
			logger.error("User with username {} not found.", username);
			return new ResponseEntity(new CustomErrorType("User with username " + username 
					+ " not found"), HttpStatus.NOT_FOUND);
		}
		return new ResponseEntity<User>(user, HttpStatus.OK);
	}

	// -------------------Create a User-------------------------------------------

	@RequestMapping(value = "/user/", method = RequestMethod.POST)
	public ResponseEntity<?> createUser(@RequestBody User user, UriComponentsBuilder ucBuilder) {
		logger.info("Creating User : {}", user);
		System.out.println(user);
		if (userService.isUserExist(user)) {
			logger.error("Unable to create. A User with username {} already exist", user.getUsername());
			return new ResponseEntity(new CustomErrorType("Unable to create. A User with username " + 
			user.getUsername() + " already exist."),HttpStatus.CONFLICT);
		}
		
	//	Zxcvbn passwordCheck = new Zxcvbn();
		//Strength strength = passwordCheck.measure(user.getPassword());
		/*if(strength.getScore() < 3){
			return new ResponseEntity(new CustomErrorType("Your password is too weak.  Choose a stronger one."),HttpStatus.);
		}*/
		
		user.setEnabled(false);
		user.setConfirmationToken(UUID.randomUUID().toString());
		userService.saveUser(user);
		
		String appUrl = "http://localhost:8080/SpringBootCRUDApp/api";
		
		SimpleMailMessage registrationEmail = new SimpleMailMessage();
		registrationEmail.setTo(user.getEmail());
		registrationEmail.setSubject("Registration Confirmation");
		registrationEmail.setText("To confirm your e-mail address, please click the link below:\n"
				+ appUrl + "/confirm/" + user.getConfirmationToken());
		registrationEmail.setFrom("noreply@domain.com");
		
		emailService.sendEmail(registrationEmail);
		
		HttpHeaders headers = new HttpHeaders();
		headers.setLocation(ucBuilder.path("/api/user/{id}").buildAndExpand(user.getId()).toUri());
		return new ResponseEntity<String>(headers, HttpStatus.CREATED);
	}
	
	@RequestMapping(value = "/confirm/{token}", method = RequestMethod.GET)
	public RedirectView confirmUser(@PathVariable("token") String token, RedirectAttributes redirectAttributes){
		User user = userService.findByConfirmationToken(token);
		System.out.println("Usao u confirm************************************" + user);
		//logger.info("Activating user profile with id {}.", user.getId());
		if(user == null){
			HttpHeaders responseHeaders = new HttpHeaders();
			responseHeaders.set("MyResponseHeader", "MyValue");
			
			RedirectView redirectView = new RedirectView();
		    redirectView.setUrl("http://localhost:8080/SpringBootCRUDApp/#!/badToken");
		    System.out.println("Usao u metodu i saljem ga na uri:http://localhost:8080/SpringBootCRUDApp/badToken"  );
		    return redirectView;
		}
		
		user.setEnabled(true);
		userService.saveUser(user);
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.set("MyResponseHeader", "MyValue");
		
		RedirectView redirectView = new RedirectView();
	    redirectView.setUrl("http://localhost:8080/SpringBootCRUDApp/#!/success");
	    System.out.println("Usao u metodu i saljem ga na uri:http://localhost:8080/SpringBootCRUDApp/success"  );
	    return redirectView;
	}
	// ------------------- Update a User ------------------------------------------------

	@RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
	public ResponseEntity<?> updateUser(@PathVariable("id") long id, @RequestBody User user) {
		logger.info("Updating User with id {}", id);

		User currentUser = userService.findById(id);

		if (currentUser == null) {
			logger.error("Unable to update. User with id {} not found.", id);
			return new ResponseEntity(new CustomErrorType("Unable to upate. User with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}else if(!currentUser.getUsername().equals(user.getUsername())){
			if(!currentUser.getEmail().equals(user.getEmail())){
				User temp = userService.findByUsername(user.getUsername());
				User temp1 = userService.findByEmail(user.getEmail());
				if((temp != null) && (temp1 != null)){
					return new ResponseEntity(new CustomErrorType("Unable to upate. User with username " + user.getUsername() +", and email "+ user.getEmail() + ", already exists."),
							HttpStatus.CONFLICT);
				}
			}
			User temp = userService.findByUsername(user.getUsername());
			if(temp != null){
				return new ResponseEntity(new CustomErrorType("Unable to upate. User with username " + user.getUsername() + " already exists."),
						HttpStatus.CONFLICT);
			}
		}else if(!currentUser.getEmail().equals(user.getEmail())){
			User temp = userService.findByEmail(user.getEmail());
			if(temp != null){
				return new ResponseEntity(new CustomErrorType("Unable to upate. User with email " + user.getEmail() + " already exists."),
						HttpStatus.CONFLICT);
			}
		}
		
		
		currentUser.setCity(user.getCity());
		currentUser.setEmail(user.getEmail());
		currentUser.setFirstName(user.getFirstName());
		currentUser.setLastName(user.getLastName());
		currentUser.setPhoneNumber(user.getPhoneNumber());
		currentUser.setUsername(user.getUsername());
		currentUser.setPassword(user.getPassword());
		currentUser.setType(user.getType());
		System.out.println(user);
		System.out.println(currentUser);
		userService.updateUser(currentUser);
		return new ResponseEntity<User>(currentUser, HttpStatus.OK);
	}

	// ------------------- Delete a User-----------------------------------------

	@RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
	public ResponseEntity<?> deleteUser(@PathVariable("id") long id) {
		logger.info("Fetching & Deleting User with id {}", id);

		User user = userService.findById(id);
		if (user == null) {
			logger.error("Unable to delete. User with id {} not found.", id);
			return new ResponseEntity(new CustomErrorType("Unable to delete. User with id " + id + " not found."),
					HttpStatus.NOT_FOUND);
		}
		userService.deleteUserById(id);
		return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
	}

	// ------------------- Delete All Users-----------------------------

	@RequestMapping(value = "/user/", method = RequestMethod.DELETE)
	public ResponseEntity<User> deleteAllUsers() {
		logger.info("Deleting All Users");

		userService.deleteAllUsers();
		return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
	}

}