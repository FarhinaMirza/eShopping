<%-- 
    Document   : admin_homepage
    Created on : Oct 2, 2018, 11:41:35 AM
    Author     : FARHEENA
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin home Page</title>
    </head>
    <body>
        <div>
            <h1 style="display: inline-block; width: 150px;">Welcome</h1>
            <label style="display: inline-block; width: 250px; font-size: larger; font-weight: bold; margin-left: 15px; color: blue;">
                <% //welcome page
                if (session.getAttribute("email") != null) {
                    out.print(session.getAttribute("email").toString());
                } else {
                    out.print("error");
                }

                    %>
            </label>
        </div>
    </body>
</html>
