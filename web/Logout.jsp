<%-- 
    Document   : Logout
    Created on : Oct 1, 2018, 11:45:22 AM
    Author     : FARHEENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout Page</title>
    </head>
    <%
        session.removeAttribute("name");
        session.removeAttribute("email");
        out.print("<script>window.location.href='masterpage.jsp?page=LoginForm1.jsp';</script>");
    %>
    <body>
    </body>
</html>
