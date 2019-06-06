/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Controllers;

import com.diplom.LK.Services.ChildService;
import com.diplom.LK.Services.CriteriaService;
import com.diplom.LK.Services.GroupService;
import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.Criteria;
import com.diplom.LK.domain.Group;
import com.diplom.LK.domain.Result;
import com.diplom.LK.domain.Teacher;
import com.diplom.LK.domain.User;
import com.diplom.LK.repos.ResultRepo;
import java.util.List;
import java.util.Map;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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

    @Autowired
    CriteriaService criteriaService;

    @Autowired
    ChildService childService;
    
    @Autowired
    ResultRepo resultRepo;

    @GetMapping
    public String getGroupList(@AuthenticationPrincipal User user, Model model) {
        Teacher teacher = user.getTeacher();
        Set<Group> groups = groupService.findByTeacher(teacher);
        model.addAttribute("groups", groups);
        return "groupList";
    }

    @GetMapping("{group}")
    public String getReport(@PathVariable Long group, @AuthenticationPrincipal User user, Model model) {
        Teacher teacher = user.getTeacher();
        Set<Criteria> criterions = criteriaService.findByPosition(teacher.getPosition());
        List<Child> children = childService.findByGroup(groupService.findById(group));
        model.addAttribute("criterions", criterions);
        model.addAttribute("children", children);

        return "groupReport";
    }

    @PostMapping("{group}")
    public void saveReport(@RequestParam Map<String, String> form) {
        Map<String, String> results = form;
        results.remove("_csrf");
        for (Map.Entry<String, String> entry : results.entrySet()) {
            String key = entry.getKey();
            String value = entry.getValue();
            int sep=key.indexOf("_");
            Long childId=Long.parseLong(key.substring(0, sep));
            Long criteriaId=Long.parseLong(key.substring(sep+1));
            Result res = new Result();
            res.setResult(value);
            res.setChild(childService.findById(childId));
            res.setCriteria(criteriaService.findByid(criteriaId));
            resultRepo.save(res);
           

        }

    }
}
