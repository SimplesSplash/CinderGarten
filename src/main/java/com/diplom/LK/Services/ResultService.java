/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.Services;

import com.diplom.LK.domain.Child;
import com.diplom.LK.domain.Result;
import com.diplom.LK.repos.ResultRepo;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author alex1
 */
@Service
public class ResultService {
    
    @Autowired
    ResultRepo resultRepo;
    
    public List<Result> findByChild(Child c){
        return resultRepo.findByChild(c);
    }
    
    public void save(Result res){
        resultRepo.save(res);
    }
}
