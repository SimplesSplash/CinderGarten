/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.repos;

import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.Group;
import java.util.List;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Валерия
 */
@Repository
public interface ChildRepo  extends CrudRepository<Child, Integer>{
    
    List<Child> findByGroup(Group group);
}
