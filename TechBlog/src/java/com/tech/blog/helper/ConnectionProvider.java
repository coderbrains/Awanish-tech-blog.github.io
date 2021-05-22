package com.tech.blog.helper;
/**
 * @author Awanish kumar singh
 */
import java.sql.*;
public class ConnectionProvider {
    
    private static Connection con;
    
    public static Connection getConnection(){
        
        try{
            
            if(con== null){
                String url = "jdbc:mysql://localhost:3306/TechBlog";
                String username = "root";
                String password = "Awanish@7765";
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection(url,username,password);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return con;
    }
    
    
}
