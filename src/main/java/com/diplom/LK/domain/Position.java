/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author Валерия
 */
@Entity
@Table(name = "positions")
public class Position {
     @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String position;

    public Position() {
    }

    @Override
    public String toString() {
        return "Position{" + "id=" + id + ", name=" + position + '}';
    }
    
    

    public Long getId() {
        return id;
    }

   
    public String getPosition() {
        return position;
    }

    public void setPosition(String position) {
        this.position = position;
    }
   
}
