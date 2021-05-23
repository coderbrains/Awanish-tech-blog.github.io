package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;

/**
 * @author Awanish kumar singh
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean saveUser(User user) {

        boolean found = false;
        try {

            String sql = "insert into  user(name,email,password,gender,about)"
                    + "values(?,?,?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setString(4, user.getGender());
            st.setString(5, user.getAbout());
            st.executeUpdate();
            
            found = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return found;
    }
}
