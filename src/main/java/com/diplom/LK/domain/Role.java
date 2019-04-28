/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.domain;

import org.springframework.security.core.GrantedAuthority;

/**
 *
 * @author Валерия
 */
public enum Role implements GrantedAuthority{
     ADMIN, TEACHER, CHILD;

    @Override
    public String getAuthority() {
        return name();
    }
    
}
