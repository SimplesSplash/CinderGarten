/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Controllers;

import com.diplom.LK.Services.ChildService;
import com.diplom.LK.Services.CriteriaService;
import com.diplom.LK.Services.ResultService;
import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.Criteria;
import com.diplom.LK.domain.Result;
import com.diplom.LK.domain.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author alex1
 */
@Controller
@PreAuthorize("hasAuthority('CHILD')")
@RequestMapping("/childReports")
public class ChildsReportController {
    
    @Autowired
    ResultService resultService;
    
    @Autowired
    ChildService childService;
    
    @Autowired
    CriteriaService criteriaService;
    
    @GetMapping
    public String getReport(@AuthenticationPrincipal User user,Model model){
        
        Child child=childService.findById(user.getId());
        
        List<Criteria> criterions = criteriaService.findAll();
        
        List<Result> results = resultService.findByChild(child);
        
        model.addAttribute("childName", child.getFullName());
        model.addAttribute("criterions", criterions);
        model.addAttribute("results", results);
        
        return "ChildReport";
    }
}
