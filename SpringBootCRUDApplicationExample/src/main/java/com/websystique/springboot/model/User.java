package com.websystique.springboot.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIdentityInfo;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;

@Entity
@Table(name="korisnik")
@JsonIdentityInfo(generator=ObjectIdGenerators.IntSequenceGenerator.class,property="@id", scope = User.class)
public class User implements Serializable{

	@Id
	@GeneratedValue(strategy= GenerationType.IDENTITY)
	@Column(name="id")
	private Long id;
	
	@JsonIgnoreProperties("friendsOf")
	@ManyToMany(fetch = FetchType.LAZY,cascade={CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.DETACH,CascadeType.REFRESH})
	@JoinTable(
			name="prijatelji1",
			joinColumns=@JoinColumn(name="id_prijatelja1"),
			inverseJoinColumns=@JoinColumn(name="id_prijatelja2")
			)
	private List<User> friends;
	
	@JsonIgnoreProperties("friends")
	@ManyToMany(fetch = FetchType.LAZY,cascade={CascadeType.PERSIST, CascadeType.MERGE,
			CascadeType.DETACH,CascadeType.REFRESH})
	@JoinTable(
			name="prijatelji1",
			joinColumns=@JoinColumn(name="id_prijatelja2"),
			inverseJoinColumns=@JoinColumn(name="id_prijatelja1")
			)
	private List<User> friendsOf;
	
	public List<User> getFriendsOf() {
		return friendsOf;
	}

	public void setFriendsOf(List<User> friendsOf) {
		this.friendsOf = friendsOf;
	}

	public List<User> getFriends() {
		return friends;
	}

	public void setFriends(List<User> friends) {
		this.friends = friends;
	}

	@Column(name="ime")
	private String firstName;

	@Column(name="prezime")
	private String lastName;

	@Column(name="email")
	private String email;

	@Column(name="password")
	private String password;
	
	@Column(name="grad")
	private String city;
	
	@Column(name="tip")
	private String type;
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public String getConfirmationToken() {
		return confirmationToken;
	}

	public void setConfirmationToken(String confirmationToken) {
		this.confirmationToken = confirmationToken;
	}

	@Column(name="tel")
	private String phoneNumber;
	
	@Column(name="username")
	private String username;
	
	@Column(name="enabled")
	private boolean enabled;
	
	@Column(name = "confirmation_token")
	private String confirmationToken;
	
public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
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

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	/*
	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		User user = (User) o;

		if (Double.compare(user.salary, salary) != 0) return false;
		if (id != null ? !id.equals(user.id) : user.id != null) return false;
		if (name != null ? !name.equals(user.name) : user.name != null) return false;
		return age != null ? age.equals(user.age) : user.age == null;
	}

	@Override
	public int hashCode() {
		int result;
		long temp;
		result = id != null ? id.hashCode() : 0;
		result = 31 * result + (name != null ? name.hashCode() : 0);
		result = 31 * result + (age != null ? age.hashCode() : 0);
		temp = Double.doubleToLongBits(salary);
		result = 31 * result + (int) (temp ^ (temp >>> 32));
		return result;
	}

	

*/
	public void addStudent(User theUser){
		if(friends == null){
			friends = new ArrayList<>();
		}
		friends.add(theUser);
	}
	public User(){
		
	}
	
	public User(String ime, String prezime, String email, String password, String phoneNumber, String username, String city, String type) {
	super();
	this.firstName = ime;
	this.lastName = prezime;
	this.email = email;
	this.password = password;
	this.phoneNumber = phoneNumber;
	this.username = username;
	this.city = city;
	this.type = type;
}

	

	@Override
	public String toString() {
		return "User [firstName=" + firstName + ", lastName=" + lastName + ", email=" + email + ", password=" + password
				+ ", phoneNumber=" + phoneNumber + ", username=" + username + ", enabled=" + enabled
				+ ", confirmationToken=" + confirmationToken + ", city=" + city +", type="+ type + "]";
	}

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
	
}
