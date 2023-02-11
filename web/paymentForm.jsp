<%-- 
    Document   : paymentForm
    Created on : Oct 23, 2018, 11:40:16 AM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Payment Page</title>
    </head>
    <% // order session destroy
        if (session.getAttribute("orderNo") != null) {
                session.setAttribute("orderNo", null);
            }
    %>
    
    <% // Edit btn data
        if (request.getParameter("billingbtn")!=null) {
                out.print("<script>window.location.href='masterpage.jsp?page=shippingForm.jsp';</script>");
            }
    %>
   
    <% // email data
        eShoppingQuery es;
        ResultSet rs;
        String email="";
        if (session.getAttribute("email")!=null) {
                es = new eShoppingQuery();
                rs=es.editAccount(session.getAttribute("email").toString());
                while(rs.next()){
                    email=rs.getString("emailId");
                }
            }
    %>
    
    <% // total prize data
        String fTotal="";
        if (session.getAttribute("finalTotal")!=null) {
                fTotal= session.getAttribute("finalTotal").toString();
                //out.print("<script>alert('hello')</script>");
            }
    %>
    
    <% // shipping data
        String name="",mobileNo="",address="";
        if (session.getAttribute("rId")!=null) {
                es= new eShoppingQuery();
                rs=es.shippingData();
                while(rs.next()){
                    name=rs.getString("customerName");
                    mobileNo=rs.getString("mobileNo");
                    address=rs.getString("address");
                }
            }
    %>
    <body>
        <!--contain start-->
        <div class="admin_contain center clear">
            <p style="color: green;">Payment Mode</p>
            <!--payment left start-->
            <div class="payment_left">
                <div class="payment_left1">
                    <p><a>Pay Via Credit Card</a>For all Major Credit Cards</p>
                    <img src="img/visa.jpg" alt=""/>
                    <img src="img/jcb.png" alt=""/>
                    <img src="img/netbank.png" alt=""/>
                    <img src="img/paypal_credit.png" alt=""/>
                </div>
                <div class="payment_left1">
                    <p><a>Cheque/DD/Direct Cash</a>For all Major Debit Cards</p>
                    <img src="img/visa.jpg" alt=""/>
                    <img src="img/mastercard.png" alt=""/>
                    <img src="img/americanexpress.jpg" alt=""/>
                    <img src="img/Discover-credit-card-logo.jpg" alt=""/>
                </div>
                <div class="payment_left1">
                    <p>
                        <a href="masterpage.jsp?page=invoiceForm.jsp&shipid=<%if(request.getParameter("shipid") != null){out.print(request.getParameter("shipid"));}%>&payment=Cash on Delivery">Cash on Delivery</a></p>
                </div>
            </div>
            <!--payment left close-->
            <!--payment right start-->
            <div class="payment_right">
                <p>Shipping Address</p>
                <span>Name : <label><%=name%></label></span>
                <span>Email : <label><%=email%></label></span>
                <span>Mobile No : <label><%=mobileNo%></label></span>
                <span>Address : <label><%=address%></label></span>
                <span>Total Amount : <label><%=fTotal%></label></span>
            </div>
            <div class="payment_right">
                <p>Billing/Sender Address <input type="submit" id="billingbtn" name="billingbtn" value="Edit"/></p>
                <span>Email : <label><%=email%></label></span>
                <span>Mobile No : <label><%=mobileNo%></label></span>
            </div>
            <!--payment right close-->
        </div>
        <!--contain close-->
    </body>
</html>
