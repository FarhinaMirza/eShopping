<%-- 
    Document   : invoiceDetailsForm
    Created on : Dec 11, 2018, 1:48:05 PM
    Author     : Hp
--%>
<%@page import="mypackage.eShoppingQuery" %>
<%@page import="java.sql.*;" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Invoice Details Page</title>
    </head>
    <body>
        <div class="admin_contain center clear">
            <p style="color: green;">Your Order</p>
            <table class="grid_center" cellpadding="1" cellspacing="1" align="center" border="1">
                <tr>
                    <th>
                        Image
                    </th>
                    <th>
                        Name
                    </th>
                    <th>
                        Qty
                    </th>
                    <th>
                        Size
                    </th>
                    <th>
                        Color
                    </th>
                    <th>
                        Prize
                    </th>
                    <th>
                        Total Amount
                    </th>
                    <th>
                        Payment Details
                    </th>
                </tr>
                <%  eShoppingQuery es = new eShoppingQuery();
                    ResultSet rs = es.innerJoinOrderDetailsToProductData(request.getParameter("orderId"));
                    while (rs.next()) {
                %>
                <tr>
                    <td>
                        <img src="img/<%=rs.getString("pImg")%>"/>
                    </td>
                    <td>
                        <%=rs.getString("pName")%>
                    </td>
                    <td>
                        <%=rs.getString("oQty")%>
                    </td>
                    <td>
                        <%=rs.getString("pSize")%>
                    </td>
                    <td>
                        <%=rs.getString("pColor")%>
                    </td>
                    <td>
                        <%=rs.getString("pPrize")%>
                    </td>
                    <td>
                        <%=rs.getString("pAmount")%>
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
