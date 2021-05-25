package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author Awanish kumar singh
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {

        ArrayList<Category> al = new ArrayList<>();

        try {
            String sql = "select * from categories";
            Statement st = con.createStatement();
            ResultSet rs =  st.executeQuery(sql);
            
            while(rs.next()){
                
                int id = rs.getInt("cId");
                String name = rs.getString("name");
                String description = rs.getString("description");
                Category c = new Category(id, name, description);
                al.add(c);
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }

        return al;
    }

}
