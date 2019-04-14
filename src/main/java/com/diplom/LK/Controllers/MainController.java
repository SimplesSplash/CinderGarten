/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Controllers;

import com.diplom.LK.domain.Role;
import com.diplom.LK.domain.User;
import com.diplom.LK.repos.ChildRepo;
import com.diplom.LK.repos.TeacherRepo;
import com.diplom.LK.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 *
 * @author alex1
 */
@Controller
public class MainController {

    @Autowired
    ChildRepo childRepo;

    @Autowired
    UserRepo userRepo;

    @Autowired
    TeacherRepo teacherRepo;

    @GetMapping("/")
    public String getUser(@AuthenticationPrincipal User user, Model model) {
        if (user.getRoles().contains(Role.TEACHER)) {
            model.addAttribute("teacher", user.getTeacher());
            
        } else {
            if(user.getRoles().contains(Role.CHILD)){
                model.addAttribute("child", user.getChild());
            }
        }

        return "main";
    }

}