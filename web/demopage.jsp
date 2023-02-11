<%-- 
    Document   : demopage
    Created on : Oct 8, 2018, 12:36:13 PM
    Author     : FARHEENA
--%>

<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Demo Page</title>
    </head>
    <body>
        <form method="post" action="demopage.jsp">
        <%
            String n="";
            if (request.getParameter("btn1") != null) {
                Random r = new Random();
                n = (r.nextInt(900000) + 100000)+"";
            }
        %>

        <input type="text" id="txt1" name="txt1" value="<%=n%>"/>
        <input type="submit" id="btn1" name="btn1" value="random"/>
        </form>
    </body>
</html>
