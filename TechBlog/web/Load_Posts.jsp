
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<div class="container-fluid">
    
    <div class="row">
        
        <%
            PostDao postdao = new PostDao(ConnectionProvider.getConnection());
            List<Post> al = postdao.getAllPost();
            
            for(Post p : al){
                
            
            %>
            
            <div class="col-md-6 mt-4">
                <div class="card">
                    
                    <div class="card-body">
                        <img class="card-img-top image-fluid" src="Blog_pics/<%= p.getpPic()  %>" alt="Image not uploaded by the author">
                        <h3 class="display"><%=  p.getpTitle() %></h3>
                        <p><%=  p.getpContent() %></p>
                        <h4>Some code related to the article-</h4>
                        <p><%=  p.getpCode() %></p>
                        
                    </div>
                    
                    
                </div>
                
            </div>
            
            <%
        }
            
            %>
    
        
        
        
        
    </div>
    
    
</div>