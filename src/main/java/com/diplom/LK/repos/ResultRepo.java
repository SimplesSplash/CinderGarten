/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.repos;

import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.Result;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 *
 * @author alex1
 */
@Repository
public interface ResultRepo extends JpaRepository<Result, Long>{
    
    public List<Result> findByChild(Child c);
}
