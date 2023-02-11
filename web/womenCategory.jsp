<%-- 
    Document   : womenCategory
    Created on : Oct 3, 2018, 1:55:16 PM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Women Category Page</title>
    </head>
    <body>
        <div class="admin_contain center">
            <p>Women :</p>
            <div class="contain_row clear">
                <%  eShoppingQuery es = new eShoppingQuery();
                    ResultSet rs = es.subcategoryData(request.getParameter("dept"));
                    while (rs.next()) {
                %>
                <div class="cbox">
                    <img src="img/<%=rs.getString("img")%>"/>
                    <p><a href="masterpage.jsp?page=subWomenCategory.jsp&cate=<%=rs.getString("category")%>"><%=rs.getString("category")%></a></p>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
