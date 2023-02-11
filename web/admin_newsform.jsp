<%-- 
    Document   : AboutUs
    Created on : Sep 13, 2018, 10:15:18 AM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>News Page</title>
    </head>
    <% // update btn
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("updatebtn")!=null) {
                es =new eShoppingQuery();
                String val=es.insertNews(request.getParameter("newstxt"));
                out.print(val);
        }
    %>
    
    <% //cancel btn
        if (request.getParameter("cancelbtn")!=null) {
                response.sendRedirect("admin_masterpage.jsp?page=AdminForm.jsp");
            }
    %>
    <body>  
                <!--contain start-->
                <div class="admin_contain center">
                    <p>Latest News :</p>
                    <div class="admin_box center">
                        <p>Latest News :</p>
                        <label>News :</label><input type="text" id="newstxt" name="newstxt" required/><br>
                        <div class="forget_btn">   
                        <input type="submit" id="updatebtn" name="updatebtn" value="Update"/>
                        <input type="submit" id="cancelbtn" name="cancelbtn" value="cancel"/>
                    </div>
                    </div>
                </div>
                <!--contain close-->
    </body>
</html>
