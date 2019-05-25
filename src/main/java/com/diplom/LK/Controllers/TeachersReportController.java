/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Controllers;

import com.diplom.LK.Services.GroupService;
import com.diplom.LK.domain.Group;
import com.diplom.LK.domain.Teacher;
import com.diplom.LK.domain.User;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author Валерия
 */
@Controller
@RequestMapping("/reports")
@PreAuthorize("hasAuthority('TEACHER')")
public class TeachersReportController {
    
    @Autowired
    GroupService groupService;
    
    @GetMapping
    public String getGroupList(@AuthenticationPrincipal User user,Model model){
        Teacher teacher=user.getTeacher();
        Set<Group> groups=groupService.findByTeacher(teacher);
        model.addAttribute("groups", groups);
        return "groupReport";
    }
}
