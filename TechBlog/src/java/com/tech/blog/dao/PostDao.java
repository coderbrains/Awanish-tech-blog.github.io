package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import java.sql.*;
import java.util.ArrayList;
import com.tech.blog.entities.Post;
import java.util.List;
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
    
    
    public boolean savePost(Post post){
        boolean status = false;
        
        try{
            
            String sql = "insert into posts(pTitle, pContent, pCode, pPic, catId, userId)values(?,?,?,?,?,?)";
            PreparedStatement st = con.prepareStatement(sql);
            st.setString(1, post.getpTitle());
            st.setString(2, post.getpContent());
            st.setString(3, post.getpCode());
            st.setString(4, post.getpPic());
            st.setInt(5, post.getCatId());
            st.setInt(6, post.getUserId());
            st.executeUpdate();
            status = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return status;
    }
    
    
    
    
    //getting all posts from database
    public List<Post> getAllPost(){
        
        List<Post>  list = new ArrayList<>();
        
        try{
            
            String sql = "select * from posts order by pId desc";
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                int pId = rs.getInt("pId");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String ppic = rs.getString("pPic");
                Timestamp pTime = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");
                int userId = rs.getInt("userId");
                
                Post post = new Post(pId, pTitle, pContent, pCode, ppic, pTime ,catId, userId);
                
                list.add(post);
                
            }
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    //getting all posts by category id....
    
    public List<Post> getAllPostByCatId(int catId){
        
        List<Post> list = new ArrayList<>();
        
        try{
            
            String sql = "select * from posts where catId = " + catId ;
            Statement st = con.createStatement();
            ResultSet rs = st.executeQuery(sql);
            
            while(rs.next()){
                int pId = rs.getInt("pId");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String ppic = rs.getString("pPic");
                Timestamp pTime = rs.getTimestamp("pDate");
                int userId = rs.getInt("userId");
                
                Post post = new Post(pId, pTitle, pContent, pCode, ppic, pTime ,catId, userId);
                
                list.add(post);
                
            }
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        return list;
    }
    
    
    public Post getPostbyId(int id){
        Post p = null;
        
        try{
            
            String sql = "select * from posts where pId = " + id;
            Statement s = con.createStatement();
            ResultSet rs = s.executeQuery(sql);
            
            while(rs.next()){
                
                int pId = rs.getInt("pId");
                String pTitle = rs.getString("pTitle");
                String pContent = rs.getString("pContent");
                String pCode = rs.getString("pCode");
                String ppic = rs.getString("pPic");
                Timestamp pTime = rs.getTimestamp("pDate");
                int catId = rs.getInt("catId");
                int userId = rs.getInt("userId");
                
              p = new Post(pId, pTitle, pContent, pCode, ppic, pTime ,catId, userId);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return p;
    }
    
    
    

}
