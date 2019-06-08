/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Services;

import com.diplom.LK.domain.User;
import com.diplom.LK.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author Валерия
 */
@Service
public class UserService implements UserDetailsService{
    @Autowired
    private UserRepo userRepo;
   
    public User findById(Long id) {
       return userRepo.getOne(id);
    }
    
    public void save(User u){
        userRepo.save(u);
    }
    public Long getCount(){
        return userRepo.count();
        
    }
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
         User user=userRepo.findByUsername(username);
        if(user==null){
            throw new UsernameNotFoundException("Такого пользователя не существует");
        }
        return user;

    }
    
}
