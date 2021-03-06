package com.websystique.springboot.controller;

import java.util.ArrayList;
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

import com.websystique.springboot.model.Friends;
import com.websystique.springboot.model.FriendsDTO;
import com.websystique.springboot.model.FriendsId;
import com.websystique.springboot.model.LoginForm;
//import com.nulabinc.zxcvbn.Strength;
//import com.nulabinc.zxcvbn.Zxcvbn;
import com.websystique.springboot.model.User;
import com.websystique.springboot.model.UserDTO;
import com.websystique.springboot.repositories.FriendsRepository;
import com.websystique.springboot.service.EmailService;
import com.websystique.springboot.service.FriendsService;
import com.websystique.springboot.service.UserService;
import com.websystique.springboot.util.CustomErrorType;

import javassist.bytecode.StackMap.Writer;

@RestController
@RequestMapping("/api")
public class RestApiController {

	public static final Logger logger = LoggerFactory.getLogger(RestApiController.class);

	
	private UserService userService; //Service which will do all data retrieval/manipulation work
	
	private FriendsService friendsService;
//	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	
	private EmailService emailService;
	
	@Autowired
    public RestApiController( UserService userService, EmailService emailService, FriendsService friendsService) {
      
     // this.bCryptPasswordEncoder = bCryptPasswordEncoder;
      this.userService = userService;
      this.emailService = emailService;
      this.friendsService = friendsService;
	}
	
	// -------------------Retrieve All Users---------------------------------------------

	@RequestMapping(value = "/user/", method = RequestMethod.GET)
	public ResponseEntity<List<UserDTO>> listAllUsers() {
		List<User> users = userService.findAllUsers();
		
		if (users.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
			// You many decide to return HttpStatus.NOT_FOUND
		}
		List<UserDTO> usersDTO = UserDTO.parsUserDTOList(users);
		return new ResponseEntity<List<UserDTO>>(usersDTO, HttpStatus.OK);
	}
	
	// ------- Authenticate user when loging in
	
	@RequestMapping(value = "/authenticate/{username}", method = RequestMethod.POST)
	public ResponseEntity<?> getLoginUser(@PathVariable("username") String username,Writer writer,@RequestBody LoginForm loginForm) {
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
		UserDTO userDTO = UserDTO.parseUsertoDTO(user);
		return new ResponseEntity<String>(user.getType(), HttpStatus.OK);
	}

	//-------------------Retrieve user's search result----------------------------------------
	@RequestMapping(value = "/searchFriends/{searchValue}", method = RequestMethod.GET)
	public ResponseEntity<?> getSearchFriends(@PathVariable("searchValue") String searchValue) {
		List<User> users = userService.findBySearchValue(searchValue);
		if (users.isEmpty()) {
			return new ResponseEntity(HttpStatus.NO_CONTENT);
			// You many decide to return HttpStatus.NOT_FOUND
		}
		List<UserDTO> usersDTO = new ArrayList<>();
		
		//System.out.println(users.getUsername());
		for(User user : users){
			if(user.isEnabled())
			usersDTO.add(UserDTO.parseUsertoDTO(user));
		}
		return new ResponseEntity<List<UserDTO>>(usersDTO, HttpStatus.OK);
	}
	
	//-------------------Retrieve user's friends----------------------------------------
	@RequestMapping(value = "/friendsList/{username}", method = RequestMethod.GET)
	public ResponseEntity<?> getFriendsList(@PathVariable("username") String username) {
		User user = userService.findByUsername(username);
		if (user == null) {
			logger.error("User with username {} not found.", username);
			return new ResponseEntity(new CustomErrorType("User with username " + username 
					+ " not found"), HttpStatus.NOT_FOUND);
		}
		List<UserDTO> usersDTO = new ArrayList<>();
		for(Friends friends : user.getPersons()){
			if(friends.getFriendshipDate()){
				usersDTO.add(UserDTO.parseUsertoDTO(friends.getFriends()));
			}
		}
		for(Friends friends : user.getFriends()){
			if(friends.getFriendshipDate()){
				usersDTO.add(UserDTO.parseUsertoDTO(friends.getPersons()));
			}
		}
		
		return new ResponseEntity<List<UserDTO>>(usersDTO, HttpStatus.OK);

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
		List<FriendsDTO> friendsDTO = new ArrayList<>();
		
		for(Friends friends : user.getPersons()){
			if(friends.getFriendshipDate()){
				friendsDTO.add(new FriendsDTO(friends.getFriends().getId(), friends.getFriendshipDate(),
						"accepted"));
			}else{
				friendsDTO.add(new FriendsDTO(friends.getFriends().getId(), friends.getFriendshipDate(),
						"requested"));
			}
				
		}
		for(Friends friends : user.getFriends()){
			if(friends.getFriendshipDate()){
				friendsDTO.add(new FriendsDTO(friends.getPersons().getId(),friends.getFriendshipDate(),
						"accepted"));
			}else{
				friendsDTO.add(new FriendsDTO(friends.getPersons().getId(),friends.getFriendshipDate(),
						"received"));
			}
				
		}
		UserDTO userDTO = UserDTO.parseUsertoDTO(user);
		userDTO.setFriends(friendsDTO);
		return new ResponseEntity<UserDTO>(userDTO, HttpStatus.OK);
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
	// ------------------- Add friend ------------------------------------------------
	@RequestMapping(value="/addFriend/{usersId}/{friendsId}", method=RequestMethod.POST)
	public ResponseEntity<?> addFriend(@PathVariable("friendsId") long friendsId, @PathVariable("usersId") String usersId){
		
		User friend = userService.findById(friendsId);
		if(friend == null){
			return new ResponseEntity(new CustomErrorType("Unable to upate. User with id " + friendsId + " not found."),
					HttpStatus.NOT_FOUND);
		}
		User user = userService.findByUsername(usersId);
		if(user == null){
			return new ResponseEntity(new CustomErrorType("Unable to upate. User with id " + usersId + " not found."),
					HttpStatus.NOT_FOUND);
		}
		if(user.getId() == friend.getId()){
			return new ResponseEntity(new CustomErrorType("Unable to upate. User with id " + usersId + ", same username."),
					HttpStatus.CONFLICT);
		}
		for(Friends friends : user.getPersons()){
			//System.out.println("Friends:"+friends.getFriends());
			//System.out.println("Persons:"+friends.getPersons());
			if(friends.getFriends().getId() == friend.getId()){
				return new ResponseEntity(new CustomErrorType("Unable to upate. User with id " + usersId + ", already have friends with username"
						+ friend.getUsername()+ "."),
						HttpStatus.CONFLICT);
			}
			
		}
		for(Friends friends : user.getFriends()){
			System.out.println("Friends:"+friends.getFriends());
			System.out.println("Persons:"+friends.getPersons());
			if(friends.getPersons().getId() == friend.getId()){
				return new ResponseEntity(new CustomErrorType("Unable to upate. User with id " + usersId + ", already have friends with username"
						+ friend.getUsername()+ "."),
						HttpStatus.CONFLICT);
			}
		}
		System.out.println("Ime prijatelja" + friend.getLastName());
		FriendsId key = new FriendsId(user.getId(), friend.getId());
		Friends friends = new Friends(key, friend,user, false);
		friendsService.updateFriends(friends);
		//user.getFriends().add(new Friends());
		return new ResponseEntity<UserDTO>(UserDTO.parseUsertoDTO(friend), HttpStatus.OK);
	}
	
	//--------------------Refuse frend's request----------------------------------------
	@RequestMapping(value="/refuse/{username}/{friendsId}", method=RequestMethod.DELETE)
	public ResponseEntity<?> refuseFriend(@PathVariable("friendsId") long friendsId, @PathVariable("username") String username){
		User user = userService.findByUsername(username);
		User friend = userService.findById(friendsId);
		Friends friends = new Friends(new FriendsId(friend.getId(),user.getId()),user, friend);
		
		System.out.println(friends + "  *********************************************");
		if (user == null || friends == null) {
			logger.error("Unable to delete. Friends with id {} not found.", friends.getId());
			return new ResponseEntity(new CustomErrorType("Unable to delete. User with id " + friends.getId() + " not found."),
					HttpStatus.NOT_FOUND);
		}
		friendsService.deleteFriendsById(friends.getId());
		return new ResponseEntity<User>(HttpStatus.NO_CONTENT);
	}
	//--------------------Accept request-------------------------------------------------
	@RequestMapping(value="/accept/{username}/{friendsId}", method=RequestMethod.PUT)
	public ResponseEntity<?> acceptFriend(@PathVariable("username") String username, @PathVariable("friendsId") long friendsId){
		User user = userService.findByUsername(username);
		User friend = userService.findById(friendsId);
		Friends friends = new Friends(new FriendsId(friend.getId(),user.getId()),user, friend);
		friends.setFriendshipDate(true);
		System.out.println(friends + "  *********************************************");
		if (user == null || friends == null) {
			logger.error("Unable to accept. Friends with id {} not found.", friends.getId());
			return new ResponseEntity(new CustomErrorType("Unable to delete. User with id " + friends.getId() + " not found."),
					HttpStatus.NOT_FOUND);
		}
		friendsService.updateFriends(friends);
		return new ResponseEntity<UserDTO>( HttpStatus.OK);
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
		return new ResponseEntity<UserDTO>(UserDTO.parseUsertoDTO(currentUser), HttpStatus.OK);
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