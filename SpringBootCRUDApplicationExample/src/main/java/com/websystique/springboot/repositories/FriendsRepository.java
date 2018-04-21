package com.websystique.springboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.websystique.springboot.model.Friends;
import com.websystique.springboot.model.FriendsId;

@Repository
public interface FriendsRepository extends JpaRepository<Friends, FriendsId>{

}
