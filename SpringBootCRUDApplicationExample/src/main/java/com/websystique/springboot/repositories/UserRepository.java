package com.websystique.springboot.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.websystique.springboot.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

    User findByFirstName(String firstName);
    
    @Query("SELECT u FROM User u where LOWER(u.username) = LOWER(:username)")
    public User queryUsername(@Param("username") String username);
    
    @Query("SELECT u FROM User u where LOWER(u.email) = LOWER(:email)")
    public User queryEmail(@Param("email") String email);
    
    public User findByConfirmationToken(String confirmationToken);
}
