package com.tech.blog.entities;

import java.sql.Timestamp;

/*
 * @author Awanish kumar singh
 */
public class User {
  
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private Timestamp datetime;
    private String about;

    public User(String name, String email, String password, String gender, Timestamp datetime, String about) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.datetime = datetime;
        this.about = about;
    }

    //Default constructor
    public User() {
        
    }

    public User(int id, String name, String email, String password, String gender, Timestamp datetime, String about) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.datetime = datetime;
        this.about = about;
    }
    
    //Getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }
    
    
    
    
    
    
    
    
    
    
    
    
}