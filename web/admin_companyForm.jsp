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
        <title>Company Page</title>
    </head>
    <% // company insert data and update data
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("submitbtn") != null) {
            if (request.getParameter("id") != null) {
                es=new eShoppingQuery();
                String val=es.updateCompany(request.getParameter("id"),request.getParameter("departmentdrop"), request.getParameter("categorydrop"), request.getParameter("companytxt"));
                out.print(val);
                out.print("<script>window.location.href='admin_masterpage.jsp?page=admin_companyForm.jsp';</script>");
            } else {
                es = new eShoppingQuery();
                String val = es.companyInsert(request.getParameter("departmentdrop"), request.getParameter("categorydrop"), request.getParameter("companytxt"));
                out.print(val);
            }
        }
    %>

    <% // Edit data
        String dept = "", category = "", cName = "";
        if (request.getParameter("id") != null) {
            es = new eShoppingQuery();
            rs = es.editCompany(request.getParameter("id"));
            while (rs.next()) {
                dept = rs.getString("department");
                category = rs.getString("category");
                cName = rs.getString("companyName");
            }
        }
    %>

    <% // Delete data
        if (request.getParameter("idDelete")!=null) {
                es=new eShoppingQuery();
                String val=es.deleteCompany(request.getParameter("idDelete"));
                out.print(val);
                out.print("<script>window.location.href='admin_masterpage.jsp?page=admin_companyForm.jsp';</script>");
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
            <p>Company :</p>
            <div class="login_content center clear">
                <div class="login_content_left">
                    <div class="admin_form-group">
                        <label>Department</label> 
                        <select id="departmentdrop" name="departmentdrop">
                            <% // department
                                es = new eShoppingQuery();
                                rs = es.departmentData();
                                while (rs.next()) {%>  
                            <option value="<%=rs.getString("department")%>"<%if (dept.equals(rs.getString("department"))) {
                                    out.print("Selected");
                                }%>><%=rs.getString("department")%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="admin_form-group">
                        <label>Category</label>
                        <select id="categorydrop" name="categorydrop">
                            <% // department
                                es = new eShoppingQuery();
                                rs = es.categoryData();
                                while (rs.next()) {%>  
                            <option value="<%=rs.getString("category")%>"<% if (category.equals(rs.getString("category"))) {
                                    out.print("Selected");
                                }%>><%=rs.getString("category")%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="admin_form-group">
                        <label>Company Name</label>
                        <input type="text" id="companytxt" name="companytxt" value="<%=cName%>" required/>
                    </div>
                    <div class="forget_btn">
                        <input type="submit" id="submitbtn" name="submitbtn" value="Submit"/>
                        <input type="submit" id="cancelbtn" name="cancelbtn" value="Cancel"/>
                    </div>
                </div>
                <div class="login1_content_right">
                    <img src="img/img8.png" alt=""/>
                </div>
            </div> <br> <br>
            <table class="grid_center" cellpadding="1" cellspacing="1" align="center" border="1">
                <tr>
                    <th>
                    </th>
                    <th>
                    </th>
                    <th>
                        Company Id
                    </th>
                    <th>
                        Department
                    </th>
                    <th>
                        Category
                    </th>
                    <th>
                        Campany_name
                    </th>
                </tr>
                <%  es = new eShoppingQuery();
                    rs = es.companyData();
                    while (rs.next()) {
                %>
                <tr>
                    <td>
                        <a href="admin_masterpage.jsp?page=admin_companyForm.jsp&id=<%=rs.getString("cId")%>">Edit</a>
                    </td>
                    <td>
                        <a href="admin_masterpage.jsp?page=admin_companyForm.jsp&idDelete=<%=rs.getString("cId")%>">Delete</a>
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
                        <%=rs.getString("companyName")%>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
        <!--contain close-->
    </body>
</html>
