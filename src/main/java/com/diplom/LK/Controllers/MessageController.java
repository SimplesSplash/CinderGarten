/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Controllers;

import com.diplom.LK.Services.ChildService;
import com.diplom.LK.Services.TeacherService;
import com.diplom.LK.Services.UserService;
import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.Message;
import com.diplom.LK.domain.Role;
import com.diplom.LK.domain.Teacher;
import com.diplom.LK.domain.User;
import com.diplom.LK.repos.MessageRepo;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Валерия
 */
@Controller
@PreAuthorize("hasAnyAuthority('TEACHER','CHILD')")
public class MessageController {

    @Autowired
    MessageRepo messageRepo;

    @Autowired
    ChildService childService;

    @Autowired
    TeacherService teacherService;

    @Autowired
    UserService userService;

    @GetMapping("/messages")
    public String getMessages(@AuthenticationPrincipal User user, Model model) {
      
        Iterable<Message> messagesFrom = messageRepo.findBySender(user);
        Iterable<Message> messagesTo = messageRepo.findByRecipient(user);

        if (user.getRoles().contains(Role.TEACHER)) {
            List<Child> aviableRecipients = childService.findAviableRecipients(user.getId());
            
            model.addAttribute("aviableRecipients", aviableRecipients);
        } else {
            List<Teacher> aviableRecipients = teacherService.findAviableRecipients(user.getId());
            

            model.addAttribute("aviableRecipients", aviableRecipients);
        }

        model.addAttribute("messagesFrom", messagesFrom);
        model.addAttribute("messagesTo", messagesTo);

        return "messages";
    }

    @PostMapping("/messages")
    public String sendMessage(@AuthenticationPrincipal User user,
            @RequestParam String recipient,
            @RequestParam String messageText
    ) {

        User recipientUser = userService.findById(Long.parseLong(recipient));
        if (recipientUser != null) {
            Message message = new Message();
            message.setSender(user);

            message.setRecipient(recipientUser);
            message.setText(messageText);
            message.setSendingDate(Calendar.getInstance().getTime());
            messageRepo.save(message);
        }

        return "redirect:/messages";
    }
}
