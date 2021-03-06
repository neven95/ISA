package com.websystique.springboot.service;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.websystique.springboot.model.Friends;
import com.websystique.springboot.model.FriendsId;
import com.websystique.springboot.repositories.FriendsRepository;

@Service("FriendsService")
@Transactional
public class FriendsServiceImpl implements FriendsService{

	@Autowired
	private FriendsRepository friendsRepository;
	@Override
	public Friends findById_FriendsId(FriendsId id) {
		// TODO Auto-generated method stub
		return null;
	}
	public void saveFriends(Friends friends) {
		friendsRepository.save(friends);
	}
	
	public void updateFriends(Friends friend){
		saveFriends(friend);
	}
	@Override
	public void deleteFriendsById(FriendsId id) {
		friendsRepository.delete(id);
		
	}

}
