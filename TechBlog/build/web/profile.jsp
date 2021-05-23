<%-- 
    Document   : profile
    Created on : May 24, 2021, 12:44:34 AM
    Author     : Awanish kumar singh
--%>

<%@page import="com.tech.blog.entities.User"%>
<%
    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        response.sendRedirect("Login_Page.jsp");
    }
%>


<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%= user.getName() %>
    </body>
</html>
