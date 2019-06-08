/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Controllers;

import com.diplom.LK.Services.ChildService;
import com.diplom.LK.Services.GroupService;
import com.diplom.LK.Services.TeacherService;
import com.diplom.LK.Services.UserService;
import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.Position;
import com.diplom.LK.domain.Role;
import com.diplom.LK.domain.Teacher;
import com.diplom.LK.domain.User;
import com.diplom.LK.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

/**
 *
 * @author alex1
 */
@Controller
public class MainController {

    @Autowired
    ChildService childService;

    @Autowired
    UserRepo userRepo;

    @Autowired
    TeacherService teacherService;
    
    @Autowired
    GroupService groupService;
            
    @Autowired
    UserService userService;

    public PasswordEncoder getEnc() {
        return enc;
    }
    @Autowired
    public void setEnc(@Lazy PasswordEncoder enc) {
        this.enc = enc;
    }
    

    PasswordEncoder enc;

    @GetMapping("/")
    public String getUser(@AuthenticationPrincipal User user, Model model) {
        if (user.getRoles().contains(Role.TEACHER)) {
            Teacher teacher=user.getTeacher();
            Position pos=teacher.getPosition();
//            Hibernate.initialize(pos);
            model.addAttribute("teacher", user.getTeacher());
            model.addAttribute("position", pos);
        } else {
            if(user.getRoles().contains(Role.CHILD)){
                model.addAttribute("child", user.getChild());
                model.addAttribute("group", user.getChild().getGroup());
                Teacher tutor = teacherService.fingTutorByChild(user.getId());
                model.addAttribute("tutor", tutor);
            }
        }

        return "main";
    }

    @GetMapping("/createUser")
    public String crUser(){
        
        return "createUser";
    }
    
    @PostMapping("/createUser")
    public void createUser(String username, String firstName, String lastName,
                            String patronymic){
        User usr= new User();
        usr.setUsername(username);
        usr.setPassword(enc.encode("1"));
        usr.setActive(true);
        usr.setRole(Role.CHILD);
        
        Child child = new Child();
        child.setFirstName(firstName);
        child.setLastName(lastName);
        child.setPatronymic(patronymic);
        child.setGroup(groupService.findById(Long.parseLong("1")));
        
      
        userService.save(usr);
        usr= (User) userService.loadUserByUsername(username);
        child.setId(usr.getId());
        usr.setChild(child);

         userService.save(usr);
    }
}
