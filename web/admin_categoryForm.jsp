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
        <title>Category Page</title>
    </head>

    <% // category insert data and update data
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("submitbtn") != null) {
            if (request.getParameter("id") != null) {
                es = new eShoppingQuery();
                String val = es.updateCategory(request.getParameter("id"), request.getParameter("departmentdrop"), request.getParameter("categorytxt"), request.getParameter("imgtxt"));
                out.print(val);
                out.print("<script>window.location.href='admin_masterpage.jsp?page=admin_categoryForm.jsp';</script>");
            } else {
                es = new eShoppingQuery();
                String val = es.categoryInsert(request.getParameter("departmentdrop"), request.getParameter("categorytxt"), request.getParameter("imgtxt"));
                out.print(val);
            }
        }
    %>

    <% // Edit data
        String dept = "", category = "", img = "";
        if (request.getParameter("id") != null) {
            es = new eShoppingQuery();
            rs = es.editCategory(request.getParameter("id"));
            while (rs.next()) {
                dept = rs.getString("department");
                category = rs.getString("category");
                img = rs.getString("img");
            }
        }
    %>

    <% // Delete data
        if (request.getParameter("idDelete") != null) {
            es = new eShoppingQuery();
            String val = es.deleteCategory(request.getParameter("idDelete"));
            out.print(val);
            out.print("<script>window.location.href='admin_masterpage.jsp?page=admin_categoryForm.jsp';</script>");
        }
    %>

    <% //cancel btn
        if (request.getParameter("cancelbtn") != null) {
            response.sendRedirect("admin_masterpage.jsp?page=AdminForm.jsp");
        }
    %>

    <body>    
        <!--contain start-->
        <div class="admin_contain center">
            <p>Category :</p>
            <div class="login_content center clear">
                <div class="login_content_left">
                    <div class="admin_form-group">
                        <label>Department</label> 
                        <select id="departmentdrop" name="departmentdrop">
                            <% // fill drop in database
                                es = new eShoppingQuery();
                                rs = es.departmentData();
                                while (rs.next()) {%>  
                            <option value="<%=rs.getString("department")%>"<%if (dept.equals(rs.getString("department"))) {
                                    out.print("selected");
                                }%>><%=rs.getString("department")%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="admin_form-group">
                        <label>Category</label>
                        <input type="text" id="categorytxt" name="categorytxt" value="<%=category%>" required/>
                    </div>
                    <div class="admin_form-group">
                        <label>Pro Images</label>
                        <input type="text" id="imgtxt" name="imgtxt" value="<%=img%>" required/>
                    </div>
                    <div class="forget_btn">
                        <input type="submit" id="submitbtn" name="submitbtn" value="Submit"/>
                        <input type="submit" id="cancelbtn" name="cancelbtn" value="Cancel"/>
                    </div>
                </div>
                <div class="login1_content_right">
                    <img src="img/img7.png" alt=""/>
                </div>
            </div> <br> <br>
            <table class="grid_center" cellpadding="1" cellspacing="1" align="center" border="1">
                <tr>
                    <th>
                    </th>
                    <th>
                    </th>
                    <th>
                        Category Id
                    </th>
                    <th>
                        Department
                    </th>
                    <th>
                        Category
                    </th>
                    <th>
                        Images
                    </th>
                </tr>
                <%  es = new eShoppingQuery();
                    rs = es.categoryData();
                    while (rs.next()) {
                %>
                <tr>
                    <td>
                        <a href="admin_masterpage.jsp?page=admin_categoryForm.jsp&id=<%=rs.getString("cId")%>">Edit</a>
                    </td>
                    <td>
                        <a href="admin_masterpage.jsp?page=admin_categoryForm.jsp&idDelete=<%=rs.getString("cId")%>">Delete</a>
                    </td>
                    <td>
                        <%=rs.getString("cId")%>
                    </td>
                    <td>
                        <%=rs.getString("department")%>
                    </td>
                    <td>
                        <%=rs.getString("category")%>
                    </td>
                    <td>
                        <img src="img/<%=rs.getString("img")%>" height="90" width="90"/>
                    </td>
                </tr>
                <%}%>
            </table>
            <br> <br> <br>
        </div>
        <!--contain close-->
    </body>
</html>
