package com.websystique.springboot.service;

import com.websystique.springboot.model.Friends;
import com.websystique.springboot.model.FriendsId;

public interface FriendsService {
	public Friends findById_FriendsId(FriendsId id);
	public void updateFriends(Friends friend);
	void deleteFriendsById(FriendsId id);
}
