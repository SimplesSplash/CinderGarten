/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.repos;

import com.diplom.LK.domain.Group;
import java.util.Set;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Валерия
 */
public interface GroupRepo extends JpaRepository<Group, Long>{
    Set<Group> findByName(String name);
    
    Set<Group> findByTutor(String tutor);
    
    
    
}
