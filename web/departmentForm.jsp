<%-- 
    Document   : departmentForm
    Created on : Oct 3, 2018, 11:04:44 AM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Department Page</title>
    </head>
    <body>
        <div class="admin_contain center">
            <p>Department :</p>
            <div class="contain_row clear">
                <% eShoppingQuery es = new eShoppingQuery();
                    ResultSet rs = es.departmentData();
                    while (rs.next()) {
                %>
                <div class="cbox">
                    <img src="img/<%=rs.getString("img")%>"/>
                    <p><a href="masterpage.jsp?page=womenCategory.jsp&dept=<%=rs.getString("department")%>"><%=rs.getString("department")%></a></p>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>