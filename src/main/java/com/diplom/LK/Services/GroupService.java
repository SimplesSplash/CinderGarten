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
import org.hibernate.Hibernate;
import org.springframework.stereotype.Service;

/**
 *
 * @author Валерия
 */
@Service
public class GroupService {
    
    GroupRepo groupRepo;
    
    public Set<Group> findByTeacher(Teacher teacher){
        Hibernate.initialize(teacher.getGroups());
        return teacher.getGroups();
        
    }
}
