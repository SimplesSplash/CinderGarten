/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.repos;

import com.diplom.LK.domain.Message;
import com.diplom.LK.domain.User;
import java.util.List;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author Валерия
 */
public interface MessageRepo extends CrudRepository<Message, Long>{
    public List<Message> findBySender(User sender);
    public List<Message> findByRecipient(User recipient);
}
