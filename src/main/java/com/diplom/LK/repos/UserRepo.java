/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.repos;

import com.diplom.LK.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Валерия
 */
public interface UserRepo extends JpaRepository<User, Long> {
    User findByUsername(String username);

  
}
