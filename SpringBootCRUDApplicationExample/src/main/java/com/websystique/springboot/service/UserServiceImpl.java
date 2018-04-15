package com.websystique.springboot.service;

import java.util.List;

import com.websystique.springboot.model.User;
import com.websystique.springboot.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



@Service("UserService")
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserRepository userRepository;

	public User findById(Long id) {
		return userRepository.findOne(id);
	}

	public User findByName(String firstName) {
		return userRepository.findByFirstName(firstName);
	}
	
	public void saveUser(User user) {
		userRepository.save(user);
	}

	public void updateUser(User user){
		saveUser(user);
	}

	public void deleteUserById(Long id){
		userRepository.delete(id);
	}

	public void deleteAllUsers(){
		userRepository.deleteAll();
	}

	public List<User> findAllUsers(){
		return userRepository.findAll();
	}

	public boolean isUserExist(User user) {
		return (findByUsername(user.getUsername()) != null) || (findByEmail(user.getEmail()) != null);
	}
	
	//my methods
	
	public User findByUsername(String username){
		return userRepository.queryUsername(username);
	}
	public User findByEmail(String email){
		return userRepository.queryEmail(email);
	}
	
	public User findByConfirmationToken(String confirmationToken) {
		return userRepository.findByConfirmationToken(confirmationToken);
	}

}
