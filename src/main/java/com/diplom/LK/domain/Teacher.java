/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.diplom.LK.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Objects;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import org.hibernate.Hibernate;

/**
 *
 * @author Валерия
 */
@Entity
@Table(name = "teachers")
public class Teacher implements Serializable {

    @Id
    @Column(name = "teacher_id")
    private Long id;

    

    public Teacher() {
    }

    private String firstName;

    private String lastName;

    private String patronymic;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "positionId")
    private Position position;

    @ManyToMany(fetch = FetchType.LAZY,
            cascade = {
                CascadeType.PERSIST,
                CascadeType.MERGE
            })
    @JoinTable(name = "teachers_groups",
            joinColumns = {
                @JoinColumn(name = "teacherId")},
            inverseJoinColumns = {
                @JoinColumn(name = "groupId")}
    )
    private Set<Group> groups = new HashSet();
    
    @OneToOne(fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private Group group;
    
    public String getFullName(){
        return lastName+" "+firstName+" "+patronymic;
    }
    
      public Long getId() {
        return id;
    }

    public Group getGroup() {
        return group;
    }

    public void setGroup(Group group) {
        this.group = group;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public void addGroup(Group g) {
        groups.add(g);
    }

   

    public Set<Group> getGroups() {
        return groups;
    }

    public void setGroups(Set<Group> groups) {
        this.groups = groups;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPatronymic() {
        return patronymic;
    }

    public void setPatronymic(String patronymic) {
        this.patronymic = patronymic;
    }

    public Position getPosition() {
       
        return position;
    }

    public void setPosition(Position position) {
        this.position = position;
    }
    @Override
    public int hashCode() {
        int hash = 7;
        hash = 13 * hash + Objects.hashCode(this.id);
        hash = 13 * hash + Objects.hashCode(this.firstName);
        hash = 13 * hash + Objects.hashCode(this.lastName);
        hash = 13 * hash + Objects.hashCode(this.patronymic);
        hash = 13 * hash + Objects.hashCode(this.position);
        hash = 13 * hash + Objects.hashCode(this.groups);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Teacher other = (Teacher) obj;
        if (!Objects.equals(this.firstName, other.firstName)) {
            return false;
        }
        if (!Objects.equals(this.lastName, other.lastName)) {
            return false;
        }
        if (!Objects.equals(this.patronymic, other.patronymic)) {
            return false;
        }
        if (!Objects.equals(this.id, other.id)) {
            return false;
        }
        if (!Objects.equals(this.position, other.position)) {
            return false;
        }
        return Objects.equals(this.groups, other.groups);
    }

}
