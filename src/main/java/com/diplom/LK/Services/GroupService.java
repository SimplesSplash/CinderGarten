/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Services;

import com.diplom.LK.domain.Group;
import com.diplom.LK.domain.Teacher;
import com.diplom.LK.repos.GroupRepo;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Валерия
 */
@Service
public class GroupService {
    
    @Autowired
    GroupRepo groupRepo;
    
     public Group findById(Long id) {
       return groupRepo.getOne(id);
    }
    
    public Set<Group> findByTeacher(Teacher teacher){
        Set<Group> groups=teacher.getGroups();
        if(null!=teacher.getGroup()){
             groups.add(teacher.getGroup());
        }
       
        return groups;
        
    }
}
