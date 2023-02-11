<%-- 
    Document   : admin_masterpage
    Created on : Oct 2, 2018, 11:04:43 AM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Master Page</title>
        <link href="eShoppingSite.css" rel="stylesheet" type="text/css"/>
        <link href="fontawesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        <form method="post" action="admin_masterpage.jsp<%
            if (request.getParameter("page") != null) {
                out.print("?page=" + request.getParameter("page"));
            } else {
                out.print("?page=admin_homepage.jsp");
            }
            if (request.getParameter("id") != null) {
                out.print("&id=" + request.getParameter("id"));
            }
              %>">
            <div class="main">
                <!--header start-->
                <div class="header center">
                    <ul>
                        <li><img src="img/eshop.png" alt=""/></li>
                        <li>
                            <div class="admin_header clear">
                                <ul>
                                    <li><a><h3 style="color: yellow">Welcome</h3><label style="color: yellow"><% //welcome page
                                        if (session.getAttribute("email") != null) {
                                            out.print(session.getAttribute("email").toString());
                                        } else {
                                            out.print("error");
                                        }%></label></a></li>
                                    <li><a href="AdminForm.jsp">Sign In</a></li>
                                    <li><a href="AdminForm.jsp">Sign Out</a></li>
                                </ul>
                            </div>
                        </li>
                        <li><img src="img/img2.png" alt=""/></li>
                    </ul>
                </div>
                <!--header close-->
                <!--menu start-->
                <div class="admin_menu center clear">
                    <ul>
                        <li><a href="admin_masterpage.jsp?page=admin_homepage.jsp">Home</a></li>
                        <li><a href="">Products Master<i class="fa fa-angle-right"></i></a>
                            <ul class="submenu">
                                <li>
                                    <a href="admin_masterpage.jsp?page=admin_newsform.jsp">Upload News</a>
                                </li>
                                <li>
                                    <a href="admin_masterpage.jsp?page=admin_productForm.jsp">Product Form</a>
                                </li>
                                <li>
                                    <a href="admin_masterpage.jsp?page=admin_departmentForm.jsp">Department Master</a>
                                </li>
                                <li>
                                    <a href="admin_masterpage.jsp?page=admin_categoryForm.jsp">Category Master</a>
                                </li>
                                <li>
                                    <a href="admin_masterpage.jsp?page=admin_companyForm.jsp">Company Master</a>
                                </li>
                            </ul>
                        </li>
                        <li><a href="#">Member Detail</a></li>
                        <li><a href="admin_masterpage.jsp?page=admin_OrderList.jsp">Order Detail</a></li>
                        <li><a href="#">Feedback Detail</a></li>
                        <li><a href="#">Report</a></li> 
                        <li><a href="#">Help</a></li> 
                    </ul>
                </div>
                <!--menu close-->
                <!--contain start-->
                <div class="admin_contain center">
                    <%
                        if (request.getParameter("page") != null) {
                    %>
                    <jsp:include page="<%=request.getParameter("page")%>"></jsp:include>
                    <%
                    } else {
                    %>
                    <jsp:include page="admin_newsform.jsp"></jsp:include>
                    <%
                        }
                    %>
                </div>
                <!--contain close-->
            </div>
        </form>
    </body>
</html>
