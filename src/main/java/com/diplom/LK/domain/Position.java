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

/**
 *
 * @author Валерия
 */
@Entity
class Position {

    public Position() {
    }
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;

    private String position;
}