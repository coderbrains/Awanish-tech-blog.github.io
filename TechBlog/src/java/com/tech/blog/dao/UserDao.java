package com.tech.blog.dao;

import java.sql.Connection;

/**
 * @author Awanish kumar singh
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    
}
