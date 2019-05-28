/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Services;

import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.Group;
import com.diplom.LK.domain.User;
import com.diplom.LK.repos.ChildRepo;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;
import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Валерия
 */
@Service
public class ChildService {
    
    @Autowired
    ChildRepo childRepo;
    
    @Autowired
    UserService userService;
    
    public List<Child> findByGroup(int groupId){
        return childRepo.findByGroup(groupId);
    }
    
     public List<Child> findByTutor(Long userId) {
        List<Child> children=new ArrayList<Child>();
        try{
            User user=userService.findById(userId);
            Hibernate.initialize(user.getTeacher().getGroup());
        children = childRepo.findByGroup(user.
                                        getTeacher().
                                        getGroup().getId().intValue());
        
        }catch(Exception e){
            return null;
        }
        
        return children;
    }
     
     public List<Child> findByTeacher(Long userId) {
         List<Child> children =new ArrayList<Child>();
          try{
         User user = userService.findById(userId);
         Hibernate.initialize(user.getTeacher().getGroups());
         Set<Group> teacherGroups = user.getTeacher().getGroups();
         for(Group group : teacherGroups){
             List<Child> childrenByGroup = childRepo.findByGroup(group.getId().intValue());
             children.addAll(childrenByGroup);
         }
         }catch(Exception e){
             
            return null;
        }
         return children;
     }
     public List<Child> findAviableRecipients(Long user){
         List<Child> aviableRecipients=new ArrayList<>();
         List<Child> childrenByTutor = findByTutor(user);
         List<Child> childrenByTeacher =findByTeacher(user);

            if (childrenByTutor != null && !childrenByTutor.isEmpty()) {
                aviableRecipients.addAll(childrenByTutor);
            }

            if (childrenByTeacher != null && !childrenByTeacher.isEmpty()) {
                aviableRecipients.addAll(childrenByTeacher);
            }
        return aviableRecipients;        
     }
     
}
