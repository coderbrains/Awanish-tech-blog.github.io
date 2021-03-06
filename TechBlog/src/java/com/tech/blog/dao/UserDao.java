package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 * @author Awanish kumar singh
 */
public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean updateUser(User user){
        boolean f = false;
        try{
            
            String sql = "UPDATE user SET name = ?, email = ?, password = ?,about = ?,profile = ? WHERE id = ?";
            PreparedStatement st = con.prepareStatement(sql);
            
            st.setString(1, user.getName());
            st.setString(2, user.getEmail());
            st.setString(3, user.getPassword());
            st.setString(4, user.getAbout());
            st.setString(5, user.getProfile());
            st.setInt(6, user.getId());
            
            
            st.executeUpdate();
            f = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
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

    public User getUserById(int userId)
    {
        User user = null;
        
        try{
            
            String sql = "select * from user where Id = " + userId;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
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
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return user;
    }


}
