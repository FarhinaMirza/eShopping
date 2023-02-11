<%-- 
    Document   : feedbackForm
    Created on : Sep 14, 2018, 11:18:56 AM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback Page</title>
    </head>
    <% //feedback data
        eShoppingQuery es;
        if (request.getParameter("submitbtn") != null) {
            es = new eShoppingQuery();
            String val = es.feedbackInsert(request.getParameter("nametxt"), request.getParameter("mailtxt"), request.getParameter("contacttxt"), request.getParameter("commenttxt"));
            out.print(val);
        }
    %>

    <% //cancel button
        if (request.getParameter("cancelbtn") != null) {
            response.sendRedirect("LoginForm.jsp");
        }
    %>
    <body>
        <!--contain start-->
        <div class="login_header center clear">
            <p>Feedback :</p>
        </div>
        <div class="forget_content center">
            <label>Name :<input type="text" id="nametxt" name="nametxt"/></label><br>
            <label>Email Id :<input type="text" id="mailtxt" name="mailtxt"/></label><br>
            <label>Contact No :<input type="text" id="contacttxt" name="contacttxt"/></label><br>
            <label>Comment :<input type="text" id="commenttxt" name="commenttxt"/></label>
            <div class="forget_btn">
                <input type="submit" id="submitbtn" name="submitbtn" value="Submit"/>
                <input type="submit" id="cancelbtn" name="cancelbtn" value="Cancel"/>
            </div>
        </div>
        <!--contain close-->
    </body>
</html>
