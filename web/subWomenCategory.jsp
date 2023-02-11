<%-- 
    Document   : subWomenCategory
    Created on : Oct 4, 2018, 11:48:52 AM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sub Women Category Page</title>
    </head>
    <body>
        <div class="admin_contain center">
            <p>Women :</p>
            <div class="contain_row clear">
                <%  eShoppingQuery es = new eShoppingQuery();
                    ResultSet rs = es.subProductCategory(request.getParameter("cate"));
                    while (rs.next()) {
                %>
                <div class="cbox">
                    <a href="masterpage.jsp?page=productDetails.jsp&id=<%=rs.getString("pId")%>"><img src="img/<%=rs.getString("pImg")%>"/></a>
                    <p> Name : <a><%=rs.getString("pCategory")%></a></p>
                    <p>Company Name : <a><%=rs.getString("pCompany")%></a></p>
                    <p>Old_Prize : <a><%=rs.getString("pOldprize")%></a> RS/.</p>
                    <p>New_Prize : <a><%=rs.getString("pNewprize")%></a> RS/. Only</p>
                </div>
                <%}%>
            </div>
        </div>
    </body>
</html>
