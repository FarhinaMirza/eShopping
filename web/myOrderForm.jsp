<%-- 
    Document   : myOrderForm
    Created on : Dec 11, 2018, 12:47:16 PM
    Author     : Hp
--%>
<%@page import="mypackage.eShoppingQuery" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
    </head>
    <body>
        <!--contain start-->
        <div class="admin_contain center clear">
            <p style="color: green;">Your Order</p>
            <table class="grid_center" cellpadding="1" cellspacing="1" align="center" border="1">
                <tr>
                    <th>
                        Order Id
                    </th>
                    <th>
                        Order No
                    </th>
                    <th>
                        Payment Status
                    </th>
                </tr>
                <%  eShoppingQuery es = new eShoppingQuery();
                    ResultSet rs = es.orderData();
                    while (rs.next()) {
                %>
                <tr>
                    <td>
                        <%=rs.getString("oId")%>
                    </td>
                    <td>
                        <a href="masterpage.jsp?page=invoiceDetailsForm.jsp&orderId=<%=rs.getString("oId")%>"><%=rs.getString("invoiveNo")%></a>
                    </td>
                    <td>
                        <%=rs.getString("paymentStatus")%>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
