package com.websystique.springboot.model;

import java.util.ArrayList;
import java.util.List;

public class UserDTO {
	private Long id;
	/*private List<UserDTO> friends;
	private List<UserDTO> friendsOf;*/
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private String city;
	private String type;
	private String username;
	private String phoneNumber;
	private List<FriendsDTO> friends;
	
	public List<FriendsDTO> getFriends() {
		return friends;
	}
	public void setFriends(List<FriendsDTO> friends) {
		this.friends = friends;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	/*public List<UserDTO> getFriends() {
		return friends;
	}
	public void setFriends(List<UserDTO> friends) {
		this.friends = friends;
	}*/
	/*public List<User> getFriendsOf() {
		return friendsOf;
	}*/
	/*public void setFriendsOf(List<UserDTO> friendsOf) {
		this.friendsOf = friendsOf;
	}*/
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public UserDTO(Long id, String firstName, String lastName,
			String email, String password, String city, String type, String username, String phoneNumber) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.city = city;
		this.type = type;
		this.username = username;
		this.phoneNumber = phoneNumber;
	}
	public UserDTO() {
		// TODO Auto-generated constructor stub
	}
	public static UserDTO parseUsertoDTO(User user){
		UserDTO userDTO = new UserDTO();
		userDTO.id = user.getId();
		userDTO.firstName = user.getFirstName();
		userDTO.lastName = user.getLastName();
		userDTO.email = user.getEmail();
		userDTO.password = user.getPassword();
		userDTO.city = user.getCity();
		userDTO.type = user.getType();
		userDTO.username = user.getUsername();
		userDTO.phoneNumber = user.getPhoneNumber();
		return userDTO;
	}
	public static List<UserDTO> parsUserDTOList(List<User> users){
		List<UserDTO> usersDTO = new ArrayList<>();
		for(User user : users){
			usersDTO.add(parseUsertoDTO(user));
		}
		return usersDTO;
		
	}
}
