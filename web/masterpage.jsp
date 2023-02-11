<%-- 
    Document   : registration
    Created on : Sep 10, 2018, 12:07:54 PM
    Author     : FARHEENA
--%>

<%
    int display = 0;
    if (session.getAttribute("name") != null) {
        display = 1;
    } else {
        display = 0;
    }
%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Master Page</title>
        <link href="eShoppingSite.css" rel="stylesheet" type="text/css"/>
        <link href="fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
        <link href="Responsive.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form method="post" action="masterpage.jsp<%
            if (request.getParameter("page") != null) {
                out.print("?page=" + request.getParameter("page"));
            } else {
                out.print("?page=HomeForm.jsp");
            }
            if (request.getParameter("id") != null) {
                out.print("&id=" + request.getParameter("id"));
            }
              %>" >
            <div class="main">
                <!--header start-->
                <div class="header center">
                    <ul>
                        <li><img src="img/eshop.png" alt=""/></li>
                        <li><img src="img/img1.png" alt=""/></li>
                        <li> 
                            <div style="display: <% if (display == 1) {
                                    out.print("block");
                                } else {
                                    out.print("none");
                                }%>">
                                <div>
                                    <div class="header_change clear">
                                        <ul>
                                            <li><a><h3 style="color: yellow">Welcome</h3><label style="color: yellow"><% //welcome page
                                                if (session.getAttribute("name") != null) {
                                                    out.print(session.getAttribute("name").toString());
                                                } else {
                                                    out.print("error");
                                                }
                                                            %></label></a></li>
                                            <li><a href="masterpage.jsp?page=changepass.jsp">Change Password</a></li>
                                            <li><a href="masterpage.jsp?page=Logout.jsp">Sign Out</a></li>
                                        </ul>
                                    </div>
                                    <div class="header_change clear">
                                        <ul>
                                            <li><a href="masterpage.jsp?page=MyAccount.jsp">My Account</a></li>
                                            <li><a href="masterpage.jsp?page=cartForm.jsp">Viewcart</a></li>
                                            <li><a href="masterpage.jsp?page=invoiceForm.jsp">My Invoice</a></li>
                                            <li><a href="masterpage.jsp?page=myOrderForm.jsp">My Order</a></li>
                                        </ul>
                                    </div>
                                    <div class="header1 clear">
                                        <ul>
                                            <li><input type="text" id="searchtxt" name="searchtxt" placeholder="Search"/></li>
                                            <li><span><input type="submit" id="searchbtn" name="searchbtn" value="Search"/></span></li>
                                        </ul> 
                                    </div>
                                </div>
                            </div>
                            <div style="display: <% if (display == 0) {
                                    out.print("block");
                                } else {
                                    out.print("none");
                                }%>">
                                <div class="header1 clear">
                                    <ul>
                                        <li><a href="AdminForm.jsp">Admin</a></li>
                                        <li><a href="masterpage.jsp?page=LoginForm.jsp">Sign In</a></li>
                                        <li><a href="masterpage.jsp?page=registrationForm.jsp">Registration</a></li>
                                    </ul>
                                </div>
                                <div class="header1 clear">
                                    <ul>
                                        <li><input type="text" id="searchtxt" name="searchtxt" placeholder="Search"/></li>
                                        <li><span><input type="submit" id="searchbtn" name="searchbtn" value="Search"/></span></li>
                                    </ul> 
                                </div>
                            </div>
                        </li>
                        <li><img src="img/img2.png" alt=""/></li>
                    </ul>
                </div>
                <!--header close-->
                <!--menu start-->
                <div class="menu center clear">
                    <ul>
                        <li><a href="masterpage.jsp?page=HomeForm.jsp">Home</a></li>
                        <li><a href="masterpage.jsp?page=admin_productForm.jsp">Products<i class="fa fa-angle-right"></i></a>
                            <ul class="submenu">
                                <li>
                                    <a href="masterpage.jsp?page=departmentForm.jsp">Department</a>
                                </li>
                            </ul>
                        </li>
                        <li><a href="masterpage.jsp?page=AboutUs.jsp">About Us</a></li>
                        <li><a href="masterpage.jsp?page=contactUs.jsp">Contact Us</a></li>
                        <li><a href="masterpage.jsp?page=feedbackForm.jsp">Feedback</a></li>
                        <li><a href="#">May We Help</a></li>   
                    </ul>
                </div>
                <!--menu close-->
                <!--scroll label start-->
                <%
                    String n = "";
                    eShoppingQuery es = new eShoppingQuery();
                    ResultSet rs = es.news();
                    while (rs.next()) {
                        n += rs.getString("news") + " | ";
                    }
                %>

                <div class="center">
                    <marquee scrollamount="10" behavior="scroll" onmouseover="this.stop()" onmouseout="this.start()">
                        <label style="font-weight: bold; font-size: larger;">
                            <%=n%>
                        </label>
                    </marquee>
                </div>
                <!--scroll label close-->
                <!--contain start-->
                <div class="about_Box clear center">
                    <%
                        if (request.getParameter("page") != null) {
                    %>
                    <jsp:include page="<%=request.getParameter("page")%>"></jsp:include>
                    <%
                    } else {
                    %>
                    <jsp:include page="HomeForm.jsp"></jsp:include>
                    <%
                        }
                    %>
                </div>
                <!--contain close-->
                <div class="footer center clear">
                    <div>
                        <img src="img/footer1.png" alt=""/>
                    </div>
                    <div class="footer_left">
                        <ul class="clear">
                            <li><a>About Us</a>
                                <div class="footer_menu"><a>About e-shop</a></div>
                                <div class="footer_menu"><a>About Network</a></div>
                                <div class="footer_menu"><a>Terms of Use</a></div>
                                <div class="footer_menu"><a>feedback</a></div>
                            </li>
                            <li><a>Customer Service</a>
                                <div class="footer_menu"><a>My Account</a></div>
                                <div class="footer_menu"><a>Order Status</a></div>
                                <div class="footer_menu"><a>Contact Us</a></div>
                                <div class="footer_menu"><a>How to Shop</a></div>
                            </li>
                            <li><a>Shopping with Us</a>
                                <div class="footer_menu"><a>Track Order</a></div>
                                <div class="footer_menu"><a>Payment Option</a></div>
                            </li>
                            <li><a>Browse Products</a>
                                <div class="footer_menu"><a>Apparel & Accessories Gift & Flowers</a></div>
                                <div class="footer_menu"><a>jewellery & Watches Kids & Baby</a></div>
                                <div class="footer_menu"><a>Health & Beauty Help</a></div>
                            </li>
                        </ul>
                        <div>
                            <p>&copy; 2018 e-shop. All Rights reserved. Brand logos & other trademarks, and certain used on www.e-shop.com are the Property of their respective owners. This Website is designed by <span style="color: blue; font-weight: bold;">Farheena mirza.</span></p>
                        </div>
                    </div>
                    <div class="footer_right">
                        <img src="img/footer2.png" alt=""/>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
