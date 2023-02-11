<%-- 
    Document   : invoiceForm
    Created on : Oct 24, 2018, 11:50:44 AM
    Author     : FARHEENA
--%>
<%@page import="java.util.*;" %>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order Page</title>
    </head>
    <% // insert order data and random order number generated
        eShoppingQuery es;
        ResultSet rs;
        int n = 0;
        String netTotal = "", fTotal = "", fQty = "", fDisc = "", tPayment = "";
        String uniqId = session.getAttribute("cart").toString();
        if (request.getParameter("payment") != null) {
            fTotal = session.getAttribute("finalTotal").toString();
            netTotal = session.getAttribute("finalNetPrice").toString();
            fDisc = session.getAttribute("finalDiscount").toString();
            fQty = session.getAttribute("finalQty").toString();
            tPayment = request.getParameter("payment").toString();
            es = new eShoppingQuery();
            if (session.getAttribute("orderNo") != null) {
                n = Integer.parseInt(session.getAttribute("orderNo").toString());
                session.setAttribute("orderNo", n);
            } else {
                Random r = new Random();
                n = r.nextInt(600000) + 100000;
                session.setAttribute("orderNo", n);
            }
            int rid = Integer.parseInt(session.getAttribute("rId").toString());
            String sId = request.getParameter("shipid");
            String val = es.orderInsert(rid, sId, String.valueOf(n), fQty, fTotal, "0", fDisc, netTotal, "Generated", "Paid", tPayment);
            String orderId = es.orderDataMaxId();
            //get data for Order Details 
            String amount = "";
            es = new eShoppingQuery();
            rs = es.innerJoinCartToProductData(uniqId);
            while (rs.next()) {
                amount = (Integer.parseInt(rs.getString("pNewprize")) * Integer.parseInt(rs.getString("qty"))) + "";
                String val1 = es.orderDetailsInsert(orderId, rs.getString("pId"), rs.getString("pNewprize"), rs.getString("qty"), amount);
            }
            es = new eShoppingQuery();
            String val2 = es.deleteCartUnique(uniqId);
            out.print(val);
        }
    %> 

    <% // shipping data
        String name = "", mobileNo = "", address = "", city = "", state = "", code = "", date = "";
        if (session.getAttribute("rId") != null) {
            es = new eShoppingQuery();
            rs = es.shippingData();
            while (rs.next()) {
                name = rs.getString("customerName");
                mobileNo = rs.getString("mobileNo");
                address = rs.getString("address");
                city = rs.getString("city");
                state = rs.getString("state");
                code = rs.getString("pincode");
                date = rs.getString("sdate");
            }
        }
    %>

    <body>
        <!--contain start-->
        <div class="admin_contain center">
            <div class="invoice_title">
                <span>Invoice</span>

                <label><%=n%> <small>Order no</small></label>
            </div>
            <div class="invoice_header">
                <div class="row">
                    <div class="col-6">
                        <div class="col_left">
                            <strong><h4>Billing To :</h4></strong>
                            <label><%=name%></label>
                            <label><%=address%></label>
                            <label><%=mobileNo%></label>
                            <label><%=city%></label>
                            <label><%=state%></label>
                            <label><%=code%></label>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="col_right">
                            <strong><h4>Shipping To :</h4></strong>
                            <label><%=name%></label>
                            <label><%=address%></label>
                            <label><%=mobileNo%></label>
                            <label><%=city%></label>
                            <label><%=state%></label>
                            <label><%=code%></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="invoice_header1">
                <div class="row">
                    <div class="col-6">
                        <strong><h4>Payment Method :</h4></strong>
                        <label><%=request.getParameter("payment")%></label>
                    </div>
                    <div class="col-6">
                        <div class="col_right">
                            <strong><h4>Order Date :</h4></strong>
                            <label><%=date%></label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="Order_table">
                <p>Order Summary</p>
                <!--                <div class="table_body">
                                    <table>
                                        <tr>
                                            <th class="text_left">
                                                Product Name
                                            </th>
                                            <th class="text_center">
                                                Price
                                            </th>
                                            <th class="text_center">
                                                Quentity
                                            </th>
                                            <th class="text_right">
                                                Total
                                            </th>
                                        </tr>
                                    </table>
                                </div>-->
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
                    </tr>
                    <%  es = new eShoppingQuery();
                        rs = es.innerJoinOrderDetailsToProductData("14");
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
                    </tr>
                    <%}%>
                </table>
                <div class="row">
                    <div class="col-6">
                    </div>
                    <div class="col-6 total_prize">
                        <span>Total Qty <label><%=fQty%></label></span>
                        <span>Subtotal <label><%=fTotal%></label></span>
                        <span>Discount <label><%=fDisc%></label></span>
                        <span>Total <label><%=netTotal%></label></span>
                    </div>
                </div>
            </div>
        </div>
        <!--contain close-->
    </body>
</html>
