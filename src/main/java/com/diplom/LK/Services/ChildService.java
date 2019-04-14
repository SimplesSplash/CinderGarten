/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Services;

import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.User;
import com.diplom.LK.repos.ChildRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Валерия
 */
public class ChildService {
    
    @Autowired
    ChildRepo childRepo;
    
    @Autowired
    UserService userService;
    
     public List<Child> findByTutor(Long userId) {
        List<Child> aviableRecipients;
        User user=userService.findById(userId);
        aviableRecipients = childRepo.findByGroup(user.
                getTeacher().
                getGroup().
                getId());
        return aviableRecipients;
    }
}
