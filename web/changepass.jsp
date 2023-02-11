<%-- 
    Document   : HomeForm
    Created on : Sep 14, 2018, 12:04:27 PM
    Author     : FARHEENA
--%>

<%
    int display = 0;
%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password Page</title>
    </head>
    <% // change pass data
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("savebtn") != null) {
            es = new eShoppingQuery();
            String val = es.changepass(session.getAttribute("email").toString(), request.getParameter("passtxt"), request.getParameter("newpasstxt"), request.getParameter("confpasstxt"));
            out.print(val);
        }
    %>

    <% //cancel btn
        if (request.getParameter("cancelbtn") != null) {
            response.sendRedirect("LoginForm.jsp");
        }
    %>
    <body>
        <form method="post" action="changepass.jsp">
            <!--contain start-->
            <div class="forget_content center">
                <p>Change Password ?..</p>
                <div class="form-group">
                    <label>Old Password</label>
                    <input type="password" id="passtxt" name="passtxt" required/>
                </div>
                <div class="form-group">
                    <label>New Password</label>
                    <input type="password" id="newpasstxt" name="newpasstxt" required/>
                </div>
                <div class="form-group">
                    <label>Confirm Password</label>
                    <input type="password" id="confpasstxt" name="confpasstxt" required/>
                </div>
                <div class="forget_btn">
                    <input type="submit" id="savebtn" name="savebtn" value="Save"/>
                    <input type="submit" id="cancelbtn" name="cancelbtn" value="Cancel"/>
                </div>
            </div>
            <!--contain close-->
        </div>
    </form>
</body>
</html>
