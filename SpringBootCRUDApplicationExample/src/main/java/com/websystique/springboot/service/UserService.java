package com.websystique.springboot.service;


import com.websystique.springboot.model.User;

import java.util.List;

public interface UserService {
	
	User findById(Long id);

	User findByName(String ime);

	void saveUser(User user);

	void updateUser(User user);

	void deleteUserById(Long id);

	void deleteAllUsers();

	List<User> findAllUsers();

	boolean isUserExist(User user);
	
	public User findByEmail(String email);
	
	public User findByConfirmationToken(String confirmationToken);
	
	public User findByUsername(String username);
}