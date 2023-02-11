<%-- 
    Document   : AdminForm
    Created on : Sep 17, 2018, 1:19:38 PM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Login Page</title>
        <link href="eShoppingSite.css" rel="stylesheet" type="text/css"/>
    </head>
    <% //Login btn
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("loginbtn") != null) {
            es = new eShoppingQuery();
            rs = es.adminLogin(request.getParameter("emailtxt"), request.getParameter("passtxt"));
            if (rs.next()) {
                session.setAttribute("email", request.getParameter("emailtxt").trim());
                response.sendRedirect("admin_masterpage.jsp?page=admin_homepage.jsp");
            } else {
                out.print("<script>alert('Please enter valid Id or Password...')</script>");
            }
        }
    %>
    <body>
        <form method="post" action="AdminForm.jsp">
            <div class="login_content center clear">
                <div class="login_content_left">
                    <p>Welcome to Administration</p>
                    <div class="admin_form-group">
                        <label>Email Id</label>
                        <input type="text" id="emailtxt" name="emailtxt" required/>
                    </div>
                    <div class="admin_form-group">
                        <label>Password</label>
                        <input type="password" id="passtxt" name="passtxt" required/>
                    </div>
                    <div class="login_btn">
                        <input type="submit" id="loginbtn" name="loginbtn" value="Login"/>
                        <a href="masterpage.jsp?page=LoginForm.jsp">Go to Client</a>
                    </div>
                </div>
                <div class="login1_content_right">
                    <img src="img/lockley.png" alt=""/>
                </div>
            </div>
        </form>
    </body>
</html>
