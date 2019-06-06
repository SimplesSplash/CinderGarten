/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Services;

import com.diplom.LK.domain.Criteria;
import com.diplom.LK.domain.Position;
import com.diplom.LK.repos.CriteriaRepo;
import java.util.List;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author alex1
 */
@Service
public class CriteriaService {
    
    @Autowired
    CriteriaRepo criteriaRepo;
    
    public List<Criteria> findAll(){
        return criteriaRepo.findAll();
    }
    
    public Criteria findByid(Long id){
      return  criteriaRepo.getOne(id);
    }
    
    public Set<Criteria> findByCriteria(String criteria){
        return criteriaRepo.findByCriteria(criteria);
    }
    public Set<Criteria> findByPosition(Position position){
        return criteriaRepo.findByPosition(position);
    }
}
