<%-- 
    Document   : forgetpass
    Created on : Sep 13, 2018, 12:18:59 PM
    Author     : FARHEENA
--%>
<%
    int display = 0;
%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forget Password Page</title>
        <link href="eShoppingSite.css" rel="stylesheet" type="text/css"/>
    </head>
    <%// forget data
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("clickbtn") != null) {
            es = new eShoppingQuery();
            rs = es.forgetpass(request.getParameter("mailtxt"), request.getParameter("sQudrop"), request.getParameter("sAnstxt"));
            if (rs.next()) {
                session.setAttribute("mail", request.getParameter("mailtxt").trim());
                //out.print("<script>alert('change forget pass...')</script>");
                display=1;
            } else {
                out.print("<script>alert('Invalid Id...')</script>");
                display=0;
            }
        }
    %>

    <% //back button
        if (request.getParameter("backbtn") != null) {
            response.sendRedirect("LoginForm.jsp");
        }
    %>
    
    <% //cancel button
        if (request.getParameter("cancelbtn") != null) {
            response.sendRedirect("LoginForm.jsp");
        }
    %>
    
    <% //update change pass
        if (request.getParameter("okbtn")!=null) {
                es =new eShoppingQuery();
                String val = es.forgetupdatepass(session.getAttribute("mail").toString(), request.getParameter("newpasstxt"),request.getParameter("confpastxt"));
                out.print(val);
            }
    %>
    <body>
                <!--contain start-->
                <div class="login_header center clear">
                    <p>Welcome to Login Form :</p>
                    <input type="submit" id="backbtn" name="backbtn" value="Back"/>
                </div>
                <div style="display: <% if (display == 0) {
                        out.print("block");
                    } else {
                        out.print("none");
                    }%>">
                    <div class="forget_content center">
                        <p>Forget Password ?..</p>
                        <div class="form-group">
                            <label>Email Id</label>
                            <input type="text" id="mailtxt" name="mailtxt" required/>
                        </div>
                        <div class="form-group">
                            <label>Security Question</label>
                            <select id="sQudrop" name="sQudrop">
                                <option>---Select Question---</option>
                                <option value="What is nick name?">What is nick name?</option>
                                <option value="What is your first school?">What is your first school?</option>
                                <option value="What is your first college?">What is your first college?</option>
                                <option value="What is your first teacher name?">What is your first teacher name?</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>Security Answer</label>
                            <input type="text" id="sAnstxt" name="sAnstxt" required/>
                        </div>
                        <div class="forget_btn">
                            <input type="submit" id="clickbtn" name="clickbtn" value="Click Here"/>
                            <input type="submit" id="cancelbtn" name="cancelbtn" value="Cancel"/>
                        </div>
                    </div>
                </div>
                <div style="display: <% if (display == 1) {
                             out.print("block");
                         } else {
                             out.print("none");
                         }%>">
                    <div class="forget_content center">
                        <p>Forget Password ?..</p>
                        <div class="form-group">
                            <label>New Password</label>
                            <input type="text" id="newpasstxt" name="newpasstxt"/>
                        </div>
                         <div class="form-group">
                            <label>Confirm Password</label>
                            <input type="text" id="confpastxt" name="confpastxt"/>
                        </div>
                        <div class="login_btn">   
                            <input type="submit" id="okbtn" name="okbtn" value="Ok"/>
                        </div>
                    </div>
                </div>
                <!--contain close-->
    </body>
</html>
