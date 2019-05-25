/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Services;

import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.Teacher;
import com.diplom.LK.repos.TeacherRepo;
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
public class TeacherService {
    @Autowired
    TeacherRepo teacherRepo;
    
    @Autowired
    UserService userService;
    
    public Teacher fingTutorByChild(Long childId){
        Child child = userService.findById(childId).getChild();
        Hibernate.initialize(child.getGroup().getTutor());
        return child.getGroup().getTutor();
    }
    
    public Set<Teacher> fingTeachersByChild(Long childId){
        Child child = userService.findById(childId).getChild();
        Hibernate.initialize(child.getGroup().getTeachers());
        return   child.getGroup().getTeachers();
    }
    
    public List<Teacher> findAviableRecipients(Long user){
        List<Teacher> aviableRecipients = new ArrayList<Teacher>();
        Set<Teacher> teachers = fingTeachersByChild(user);
            Teacher tutor = fingTutorByChild(user);

            if (teachers != null && !teachers.isEmpty()) {
                aviableRecipients.addAll(teachers);
            }

            if (tutor != null) {
                aviableRecipients.add(tutor);
            }
        return aviableRecipients;    
    }
    
}
