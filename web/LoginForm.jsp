<%-- 
    Document   : LoginForm
    Created on : Sep 13, 2018, 11:48:29 AM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <% // Login Form
        ResultSet rs;
        eShoppingQuery es;
        if (request.getParameter("btn1") != null) {
            // if (request.getParameter(v)!=null) {
            String v = request.getParameter("rdo");
            if (v.equals("rdo1")) {
                // response.sendRedirect("masterpage.jsp?page=LoginForm1.jsp");
                out.print("<script>window.location.href='masterpage.jsp?page=LoginForm1.jsp';</script>");
            } else if (v.equals("rdo2")) {
                // response.sendRedirect("masterpage.jsp?page=registrationForm.jsp");
                out.print("<script>window.location.href='masterpage.jsp?page=registrationForm.jsp';</script>");
            } else if (v.equals("rdo3")) {
                // response.sendRedirect("masterpage.jsp?page=forgetpass.jsp");
                out.print("<script>window.location.href='masterpage.jsp?page=forgetpass.jsp';</script>");
            } else {
                out.print("<script>alert('Please choose Option...')</script>");
            }
        }
//        else{
//                out.print("<script>alert('Please fill data...')</script>");
//            }
//        }
%>


    <body>
        <!--contain start-->
        <div class="login_header center clear">
            <p>Welcome to Login Form :</p>
            <input type="submit" id="btn2" name="btn2" value="Back"/>
        </div>
        <div class="login_content center clear">
            <div class="login_content_left">
                <p>You have a Password ?..</p>
                <label><input type="radio" id="rdo1" value="rdo1" name="rdo"/>Yes, I have a Password.</label><br>
                <label><input type="radio" id="rdo2" value="rdo2" name="rdo"/>No I am new User ? </label><br>
                <label><input type="radio" id="rdo3" value="rdo3" name="rdo"/>Forget Password ? </label><br>
                <div class="login_btn">
                    <input type="submit" id="btn1" name="btn1" value="Click Here"/>
                </div>
            </div>
            <div class="login_content_right">
                <img src="img/loginkey.png" alt=""/>
            </div>
        </div>
        <!--contain close-->
    </body>
</html>
