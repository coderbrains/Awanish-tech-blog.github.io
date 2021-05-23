package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

    public User getUserbyEmailandPasswod(String email, String password) {
        User user = null;
        String sql = "select * from user where email = ? and password = ?";
        try {
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            System.out.print(st);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("Id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDatetime(rs.getTimestamp("Registration_Date"));
                user.setProfile(rs.getString("profile"));
            }

        } catch (Exception e) {

            e.printStackTrace();

        }

        return user;
    }

}
