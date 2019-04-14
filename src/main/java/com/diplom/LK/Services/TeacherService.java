/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Services;

import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.Teacher;
import com.diplom.LK.repos.TeacherRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author Валерия
 */
public class TeacherService {
    @Autowired
    TeacherRepo teacherRepo;
    
    @Autowired
    UserService userService;
    
    public Teacher fingTutorByChild(Long childId){
        Child child = userService.findById(childId).getChild();
        return child.getGroup().getTutor();
    }
    
    public List<Teacher> fingTeachersByChild(Long childId){
        Child child = userService.findById(childId).getChild();
        return (List<Teacher>) child.getGroup().getTeachers();
    }
    
}
