
<%@page import="com.tech.blog.entities.User"%>
<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>


<div>

    <div class="row">

        <%
            User user = (User)session.getAttribute("currentuser");
            PostDao postdao = new PostDao(ConnectionProvider.getConnection());

            int cid = Integer.parseInt(request.getParameter("catId"));
            List<Post> al;
            Thread.sleep(1000);
            if (cid == 0) {
                al = postdao.getAllPost();
            } else {
                al = postdao.getAllPostByCatId(cid);
            }

            if (al.size() == 0) {
                out.println("<h3 class = 'display-3 text-center'>No Post available in this category...  </h3>");
            }

            for (Post p : al) {

                String s = p.getpContent();
                s = s.substring(0, Math.min(s.length(), 50));
                s = s + "...";


        %>

        <div class="col-md-6 mt-4">
            <div class="card">

                <!--<div class="card-header primary-background"></div>-->

                <div class="card-body">
                    <img class="card-img-top" style="max-width: 100px;max-height: 100px;" src="Blog_pics/<%= p.getpPic()%>" alt="Image not uploaded by the author">
                    <h5 class="display"><%= p.getpTitle()%></h5>
                    <p><%=  s%></p>

                </div>

                <div class="card-footer text-center primary-background">

                    <%
                        LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection());
                    %>

                    <a href="#!" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span  class="like-counter"><%= likeDao.countLike(p.getpId())%></span></a>
                    <a href="show_blog.jsp?post_id=<%=  p.getpId()%>" class="btn btn-outline-light btn-sm">Read more..</a>
                    <a href="#!" class="btn btn-outline-light btn-sm"><span class="fa fa-commenting-o">20</span></a>

                </div>


            </div>

        </div>

        <%
            }

        %>





    </div>


</div>