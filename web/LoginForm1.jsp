<%-- 
    Document   : LoginForm1
    Created on : Sep 13, 2018, 2:51:02 PM
    Author     : FARHEENA
--%>
<%
    //int display = 0;
%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <% //login data
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("loginbtn") != null) {
          //  if (request.getParameter("")!=null) {
            es = new eShoppingQuery();
            rs = es.LoginForm(request.getParameter("emailtxt"), request.getParameter("passtxt"));
            if (rs.next()) {
                //String n= rs.getString("fname");
                session.setAttribute("rId", rs.getString("rId"));
                session.setAttribute("name", rs.getString("firstName"));
                session.setAttribute("email", request.getParameter("emailtxt").trim());
                out.print("<script>window.location.href='masterpage.jsp?page=HomeForm.jsp';</script>");
                //response.sendRedirect("masterpage?page=HomeForm.jsp");
                // display=1;
                //out.print("<script>alert('Successfully Login...')</script>");
            }
            else {
                out.print("<script>alert('Invalid Id or Password...')</script>");
                //display=0;
            }
        }
//            else{
//                out.print("<script>alert('Please fill data...')</script>");
//            }
//        }
    %>

    <% //back button
        if (request.getParameter("backbtn") != null) {
            //response.sendRedirect("masterpage.jsp?page=LoginForm.jsp");
            out.print("<script>window.location.href='masterpage.jsp?page=LoginForm.jsp';</script>");
        }
    %>
    <body>
                <!--contain start-->
                <div class="login_header center clear">
                    <p>Welcome to Login Form :</p>
                    <input type="submit" id="backbtn" name="backbtn" value="Back"/>
                </div>
                <div class="login_content center clear">
                    <div class="login_content_left">
                        <p>What is Your Email address ?..</p>
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
                        </div>
                    </div>
                    <div class="login1_content_right">
                        <img src="img/lockley.png" alt=""/>
                    </div>
                </div>
                <!--contain close-->
            </div>
    </body>
</html>
