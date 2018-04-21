package com.websystique.springboot.model;

public class FriendsDTO {
	long friendsKey;
	boolean accepted;
	String sent;
	public String getSent() {
		return sent;
	}
	public void setSent(String sent) {
		this.sent = sent;
	}
	public long getFriendsKey() {
		return friendsKey;
	}
	public void setFriendsKey(long friendsKey) {
		this.friendsKey = friendsKey;
	}
	public boolean isAccepted() {
		return accepted;
	}
	public void setAccepted(boolean accepted) {
		this.accepted = accepted;
	}
	public FriendsDTO(long friendsKey, boolean accepted, String sent) {
		super();
		this.friendsKey = friendsKey;
		this.accepted = accepted;
		this.sent = sent;
	}
	public FriendsDTO(){
		
	}
	public static FriendsDTO parseFriendsToDTO(Friends friends){
		FriendsDTO friendsDTO = new FriendsDTO();
		friendsDTO.friendsKey=friends.getFriends().getId();
		friendsDTO.setAccepted(friends.getFriendshipDate());
		return friendsDTO;
	}
	
	
	
}
