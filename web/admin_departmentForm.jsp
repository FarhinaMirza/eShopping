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
        <title>Department Page</title>
    </head>

    <% // department insert data and update data
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("submitbtn") != null) {
            if (request.getParameter("id") != null) {
                es = new eShoppingQuery();
                String val = es.updateDepartment(request.getParameter("id"), request.getParameter("departmenttxt"), request.getParameter("imgtxt"));
                out.print(val);
                out.print("<script>window.location.href='admin_masterpage.jsp?page=admin_departmentForm.jsp';</script>");
            } else {
                es = new eShoppingQuery();
                String val = es.departmentInsert(request.getParameter("departmenttxt"), request.getParameter("imgtxt"));
                out.print(val);
            }
        }
    %>

    <% // edit data
        String dept = "", image = "";
        if (request.getParameter("id") != null) {
            es = new eShoppingQuery();
            rs = es.editDepartment(request.getParameter("id"));
            while (rs.next()) {
                dept = rs.getString("department");
                image = rs.getString("img");
            }
        }
    %>

    <% // delete data
        if (request.getParameter("idDelete") != null) {
            es = new eShoppingQuery();
            String val = es.deleteDepartment(request.getParameter("idDelete"));
            out.print(val);
            response.sendRedirect("admin_masterpage.jsp?page=admin_departmentForm.jsp");
        }
    %>

    <% //cancel btn
        if (request.getParameter("cancelbtn") != null) {
            response.sendRedirect("AdminForm.jsp");
        }
    %>

    <body>   
        <!--contain start-->
        <div class="admin_contain center">
            <p>Department :</p>
            <div class="login_content center clear">
                <div class="login_content_left">
                    <div class="admin_form-group">
                        <label>Department</label> 
                        <input type="text" id="departmenttxt" name="departmenttxt" value="<%=dept%>" required/>
                    </div>
                    <div class="admin_form-group">
                        <label>Images</label>
                        <input type="text" id="imgtxt" name="imgtxt" value="<%=image%>" required/>
                    </div>
                    <div class="forget_btn">
                        <input type="submit" id="submitbtn" name="submitbtn" value="Submit"/>
                        <input type="submit" id="cancelbtn" name="cancelbtn" value="Cancel"/>
                    </div>
                </div>
                <div class="login1_content_right">
                    <img src="img/img6.png" alt=""/>
                </div>
            </div> <br> <br>
            <table class="grid_center" cellpadding="1" cellspacing="1" align="center" border="1">
                <tr>
                    <th>
                    </th>
                    <th>
                    </th>
                    <th>
                        Department Id
                    </th>
                    <th>
                        Department
                    </th>
                    <th>
                        Images
                    </th>
                </tr>
                <%  // show data
                    es = new eShoppingQuery();
                    rs = es.departmentData();
                    while (rs.next()) {
                %>
                <tr>
                    <td>
                        <a href=admin_masterpage.jsp?page=admin_departmentForm.jsp&id=<%=rs.getString("dId")%>>Edit</a>
                    </td>
                    <td>
                        <a href="admin_masterpage.jsp?page=admin_departmentForm.jsp&idDelete=<%=rs.getString("dId")%>">Delete</a>
                    </td>
                    <td>
                        <%=rs.getString("dId")%>
                    </td>
                    <td>
                        <%=rs.getString("department")%>
                    </td>
                    <td>
                        <img src="img/<%=rs.getString("img")%>" height="90" width="90" />
                    </td>
                </tr>
                <%}%>
            </table>
            <br> <br> <br>
        </div>
        <!--contain close-->    
    </body>
</html>
