/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tech.blog.servlets;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Awanish kumar singh
 */
@MultipartConfig
public class Editservlet extends HttpServlet {

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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Editservlet</title>");
            out.println("</head>");
            out.println("<body>");
            
            String name = request.getParameter("user_name");
            String email = request.getParameter("user_email");
            String password = request.getParameter("user_password");
            String about = request.getParameter("user_about");
            Part part = request.getPart("profile_pic");
            String imagename = part.getSubmittedFileName();
            
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentuser");
            
            user.setEmail(email);
            user.setName(name);
            user.setPassword(password);
            user.setAbout(about);
            String oldpic = user.getProfile();
            if(imagename != null){
                user.setProfile(imagename);
                
            }else{
                user.setProfile(oldpic);
            }            
            
            
            
            UserDao userdao = new UserDao(ConnectionProvider.getConnection());
            
            if (userdao.updateUser(user)) {
                
                String path = request.getRealPath("/") + "pics" + File.separator + user.getProfile();
                String pathold = request.getRealPath("/") + "pics" + File.separator + oldpic;
                
                if (!oldpic.equals("Default.png")) {
                    Helper.deleteFile(pathold);
                }
                
                Helper.saveFile(part.getInputStream(), path);
                
                Message msg = new Message("Profile page updated successfully..", "success", "alert-success");
                session.setAttribute("msg", msg);
                
            } else {
                
                Message msg = new Message("Profile page not updated successfully..", "error", "alert-danger");
                session.setAttribute("msg", msg);
                
            }
            
            response.sendRedirect("profile.jsp");

//            session.removeAttribute("currentuser");
//            response.sendRedirect("Login_Page.jsp");
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
