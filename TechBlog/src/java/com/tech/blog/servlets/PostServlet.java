/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.PostDao;
import com.tech.blog.entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import com.tech.blog.entities.*;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;

/**
 *
 * @author Awanish kumar singh
 */

@MultipartConfig
public class PostServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            
            int cId = Integer.parseInt(request.getParameter("cId")); 
            String  t = request.getParameter("pTitle");
            String content = request.getParameter("pContent");
            String code = request.getParameter("pCode");
            Part part = request.getPart("pPic");
            String imageName = part.getSubmittedFileName();
            
            
            
            //getting user id....
            
            HttpSession session  = request.getSession();
            User user = (User)session.getAttribute("currentuser");
            
            int userId = user.getId();
            
            Post p = new Post(t, content, code, imageName, cId, userId);
            
            PostDao postDao = new PostDao(ConnectionProvider.getConnection());
            if(postDao.savePost(p)){
                
                String path = request.getRealPath("/") + "Blog_pics" + File.separator + part.getSubmittedFileName();
                Helper.saveFile(part.getInputStream(), path);
                out.println("success");
                
                
            }else{
                out.println("sorry ! something went wrong.");
            }
        
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
