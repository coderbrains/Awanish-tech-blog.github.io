/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Awanish kumar singh
 */
public class LikeDao {
    
        Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
        
    public boolean insertLike(int pid, int uid){
        
        boolean status = false;
        
        try{
            
            String sql = "insert into liked(postid, userid)values(?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, pid);
            st.setInt(2, pid);
            st.executeUpdate();
            status = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return status;
    }

    
    public int countLike(int pId)
    {
        int count = 0;
        
        try{
            
            String sql = "select count(*) from liked where postid = " + pId;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            if(rs.next()){
                count = rs.getInt("count(*)");
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return count;
    }
    
    
    public boolean likeStatus(int userid, int postid)
    {
        boolean status = false;
        
        try{
            
            String sql = "select * from liked where userid = ? and postid = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, userid);
            st.setInt(2, postid);
            
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                status = true;
            }
                       
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return status;
    }
    
        
    public boolean dislike(int userid, int postid){
        boolean dis = false;
        
        
        
        try{
            
            String sql = "delete from liked where userid = ? and postid = ?";
            PreparedStatement st = con.prepareStatement(sql);
            st.setInt(1, userid);
            st.setInt(2, postid);
            
            st.executeUpdate();
            dis = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
       return dis; 
    }
}
