<%-- 
    Document   : productDetails
    Created on : Oct 4, 2018, 1:49:03 PM
    Author     : FARHEENA
--%>
<%@page import="java.util.*"%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Details Page</title>
    </head>
    <% // Add to cart insert data
        eShoppingQuery es;
        ResultSet rs;
        int n = 0;
        if (request.getParameter("addcartbtn") != null) {
            es = new eShoppingQuery();
            if (session.getAttribute("cart") != null) {
                n = Integer.parseInt(session.getAttribute("cart").toString());
                session.setAttribute("cart", n);
            } else {
                Random r = new  Random();
                n = r.nextInt(900000)+100000;
                session.setAttribute("cart", n);
            }
            String val = es.cartInsert(n, request.getParameter("id"), request.getParameter("txtnum"));
            out.print(val);
            out.print("<script>window.location.href='masterpage.jsp?page=cartForm.jsp';</script>");
        }
    %>
    <body>
        <div class="admin_contain center">
            <p>Product Details :</p>
            <div class="contain_box center clear">
                <%  es = new eShoppingQuery();
                    rs = es.productDetails(request.getParameter("id"));
                    while (rs.next()) {
                %>
                <div class="left">
                    <img src="img/<%=rs.getString("pImg")%>"/>
                </div>
                <div class="right">
                    <p style="color: green; font-size: larger; font-weight: bold;"><a><%=rs.getString("pCompany")%>  <%=rs.getString("pName")%></a> New Pattern</p>
                    <p>Old Prize : <strike><a style="color: red;"><%=rs.getString("pOldprize")%></a></strike> RS/-</p>
                    <p>New Prize : <a style="font-size: x-large; color: green; font-weight: bold;"> RS- <label id="lblprize"><%=rs.getString("pNewprize")%></label> /-</a> <span style="color: darksalmon">With free shiping </span> </p>
                    <p>(Prices are inclusive of all taxes)</p>
                    <p style="font-weight: bold;">Product Description</p>
                    <p>Product Department <a  style="color: brown; font-weight: bold;"><%=rs.getString("pDepart")%></a> Company <a style="color: brown; font-weight: bold;"><%=rs.getString("pCompany")%></a></p>
                    <p>Category <a style="color: brown; font-weight: bold;"><%=rs.getString("pCategory")%></a>  Size  <a style="color: brown; font-weight: bold;"><%=rs.getString("pSize")%></a></p>
                    <p style="font-weight: bold;">Delivery in 7-8 Working Days<br><br> Pay Cash On Delivery</p>
                    <p><span style="font-weight: bold;">Warranty Period</span> : 6 months against manufacturing defects </p>
                    <p style="font-weight: bold;">Availibility : <span style="color: green; font-size: x-large;">IN STOCK</span></p>
                    <p style="font-weight: bold;"> Description : <a style="color: green;"><%=rs.getString("pDescription")%></a></p>
                    <p style="font-weight: bold;">Quntity : <input type="number" onclick="txtClick()" id="txtnum" name="txtnum" value="1" min="1" max="100" style="width: 100px; height: 25px; color: green;"/></p>
                    <p style="font-weight: bold;">Total Prize : <label style="color: green;" id="lblnum" onchange="txtClick()"></label></p>
                    <div class="forget_btn">
                        <input type="submit" id="addcartbtn" name="addcartbtn" value="Add to Cart"/>
                        <a href="masterpage.jsp?page=subWomenCategory.jsp&cate=<%=rs.getString("pCategory")%>"><< Back</a>
                    </div>
                </div>
                <%}%>
            </div>
        </div>
        <script src="jquery-3.2.1.min.js" type="text/javascript"></script>
        <script type="text/javascript">
                        function txtClick() {
                            lblnum.innerHTML = (parseInt(txtnum.value) * parseInt(lblprize.innerHTML)).toString();
                        }
        </script>
    </body>
</html>
