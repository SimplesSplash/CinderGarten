/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.repos;

import java.util.Set;
import com.diplom.LK.domain.Criteria;
import com.diplom.LK.domain.Position;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author Валерия
 */
public interface CriteriaRepo extends JpaRepository<Criteria, Long>{
    Set<Criteria> findByCriteria(String criteria);
    
    Set<Criteria> findByPosition(Position position);
}
