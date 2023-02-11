<%-- 
    Document   : admin_OrderList
    Created on : Nov 15, 2018, 12:08:10 PM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order List Page</title>
    </head>
    <% // Search Date from order data
        eShoppingQuery es;
        ResultSet rs;
        //String dat1 = "";
        //String dat2 = "";
        if (request.getParameter("searchbtn") != null) {

            //dat1=request.getParameter("txt1");
            //dat2=request.getParameter("txt2");
            session.setAttribute("date1", request.getParameter("txt1"));
            session.setAttribute("date2", request.getParameter("txt2"));
            //out.print( "<script>alert('"+dat1+"')</script>");
            //out.print( "<script>alert('"+dat2+"')</script>");
        }
    %>
    <body>
        <div class="admin_box center">
            <p>Search Order Data</p>
            <div class="form-group">
                <label>Start Date</label>
                <input type="date" name="txt1" id="txt1"/>
            </div>
            <div class="form-group">
                <label>End Date</label>
                <input type="date" name="txt2" id="txt2"/>
            </div>
            <div class="forget_btn">
                <input type="submit" name="searchbtn" id="searchbtn" value="Search Data"/>
            </div>
        </div>
        <table class="grid_center" cellpadding="1" cellspacing="1" align="center" border="1">
            <tr>
                <th>
                    Order Id
                </th>
                <th>
                    Invoice No
                </th>
                <th>
                    Qty
                </th>
                <th>
                    Amount
                </th>
                <th>
                    Discount
                </th>
                <th>
                    Net Amount
                </th>
                <th>
                    Order Status
                </th>
                <th>
                    Payment Status
                </th>
                <th>
                    Payment Type
                </th>
                <th>
                    Date
                </th>
            </tr>
            <%  es = new eShoppingQuery();
                if (session.getAttribute("date1") != null && session.getAttribute("date2") != null) {
                    rs = es.SearchDate_orderData(session.getAttribute("date1").toString(), session.getAttribute("date2").toString());
                } else {
                    rs = es.orderData();
                }
                while (rs.next()) {
            %>
            <tr>
                <td>
                    <%=rs.getString("oId")%>
                </td>
                <td>
                    <%=rs.getString("invoiveNo")%>
                </td>
                <td>
                    <%=rs.getString("totalQty")%>
                </td>
                <td>
                    <%=rs.getString("totalAmount")%>
                </td>
                <td>
                    <%=rs.getString("discount")%>
                </td>
                <td>
                    <%=rs.getString("netAmount")%>
                </td>
                <td>
                    <%=rs.getString("orderStatus")%>
                </td>
                <td>
                    <%=rs.getString("paymentStatus")%>
                </td>
                <td>
                    <%=rs.getString("paymentType")%>
                </td>
                <td>
                    <%=rs.getString("oDate")%>
                </td>
            </tr>
            <%}%>
        </table>
    </body>
</html>
