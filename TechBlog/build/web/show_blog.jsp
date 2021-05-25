<%-- 
    Document   : show_blog
    Created on : May 26, 2021, 1:31:12 AM
    Author     : Awanish kumar singh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%   
            int pId = Integer.parseInt(request.getParameter("post_id"));
        %>
        <h1>Hello World!<%=   pId %></h1>
    </body>
</html>
