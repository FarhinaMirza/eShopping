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
        <title>Product Page</title>
    </head>

    <% // product insert data and update data
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("submitbtn") != null) {
            if (request.getParameter("id") != null) {
                es = new eShoppingQuery();
                String val = es.updateProduct(request.getParameter("id"), request.getParameter("departmentdrop"), request.getParameter("categorydrop"), request.getParameter("companydrop"), request.getParameter("nametxt"), request.getParameter("sizetxt"), request.getParameter("pOldprize"), request.getParameter("pNewprize"), request.getParameter("colortxt"), request.getParameter("qty"), request.getParameter("pdestxt"), request.getParameter("imgtxt"));
                out.print(val);
                out.print("<script>window.location.href='admin_masterpage.jsp?page=admin_productForm.jsp';</script>");
            } else {
                es = new eShoppingQuery();
                String val = es.productInsert(request.getParameter("departmentdrop"), request.getParameter("categorydrop"), request.getParameter("companydrop"), request.getParameter("nametxt"), request.getParameter("sizetxt"), request.getParameter("pOldprize"), request.getParameter("pNewprize"), request.getParameter("colortxt"), request.getParameter("qty"), request.getParameter("pdestxt"), request.getParameter("imgtxt"));
                out.print(val);
            }
        }
    %>

    <% // Edit data
        String dept = "", category = "", company = "", name = "", size = "", oPrize = "", nPrize = "", color = "", qty = "", desc = "", img = "";
        if (request.getParameter("id") != null) {
            es = new eShoppingQuery();
            rs = es.editProduct(request.getParameter("id"));
            while (rs.next()) {
                dept = rs.getString("pDepart");
                category = rs.getString("pCategory");
                company = rs.getString("pCompany");
                name = rs.getString("pName");
                size = rs.getString("pSize");
                oPrize = rs.getString("pOldprize");
                nPrize = rs.getString("pNewprize");
                color = rs.getString("pColor");
                qty = rs.getString("pQty");
                desc = rs.getString("pDescription");
                img = rs.getString("pImg");
            }
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
            <p>Product :</p>
            <div class="product_contain center clear">
                <div class="login_content_left">
                    <div class="admin_form-group">
                        <label>Product Department</label> 
                        <select id="departmentdrop" name="departmentdrop">
                            <% // fill drop in database
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
                        <label>Product Category</label> 
                        <select id="categorydrop" name="categorydrop">
                            <%
                                es = new eShoppingQuery();
                                rs = es.categoryData();
                                while (rs.next()) {%>
                            <option value="<%=rs.getString("category")%>"<%if (category.equals(rs.getString("category"))) {
                                    out.print("Selected");
                                }%>><%=rs.getString("category")%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="admin_form-group">
                        <label>Product Company</label> 
                        <select id="companydrop" name="companydrop">
                            <%
                                es = new eShoppingQuery();
                                rs = es.companyData();
                                while (rs.next()) {%>
                            <option value="<%=rs.getString("companyName")%>"<%if (company.equals(rs.getString("companyName"))) {
                                    out.print("Selected");
                                }%>><%=rs.getString("companyName")%></option>
                            <%}%>
                        </select>
                    </div>
                    <div class="admin_form-group">
                        <label>Product Name</label> 
                        <input type="text" required id="nametxt" name="nametxt" value="<%=name%>" required/>
                    </div>
                    <div class="admin_form-group">
                        <label>Product Size</label> 
                        <input type="text" id="sizetxt" name="sizetxt" value="<%=size%>" required/>
                    </div>
                    <div class="admin_form-group">
                        <label>Product Old prize</label> 
                        <input type="text" id="pOldprize" name="pOldprize" value="<%=oPrize%>" required/>
                    </div>
                    <div class="admin_form-group">
                        <label>Product New prize</label> 
                        <input type="text" id="pNewprize" name="pNewprize" value="<%=nPrize%>" required/>
                    </div>
                    <div class="admin_form-group">
                        <label>Product Color</label> 
                        <input type="text" id="colortxt" name="colortxt" value="<%=color%>" required/>
                    </div>
                    <div class="admin_form-group">
                        <label>Product Quantity</label> 
                        <input type="text" id="qty" name="qty" value="<%=qty%>" required/>
                    </div>
                    <div class="admin_form-group">
                        <label>Product Description</label> 
                        <input type="text" id="pdestxt" name="pdestxt" value="<%=desc%>" required/>
                    </div>
                    <div class="admin_form-group">
                        <label>Product Images</label>
                        <input type="text" id="imgtxt" name="imgtxt" value="<%=img%>" required/>
                    </div>
                    <div class="forget_btn">
                        <input type="submit" id="submitbtn" name="submitbtn" value="Submit"/>
                        <input type="submit" id="cancelbtn" name="cancelbtn" value="Cancel"/>
                    </div>
                </div>
                <div class="login1_content_right">
                    <img src="img/img9.png" alt=""/>
                </div>
            </div> <br> <br>
            <table class="grid_center" cellpadding="1" cellspacing="1" align="center" border="1">
                <tr>
                    <th>
                    </th>
                    <th>
                    </th>
                    <th>
                        P_Id
                    </th>
                    <th>
                        Department
                    </th>
                    <th>
                        Category
                    </th>
                    <th>
                        Company
                    </th>
                    <th>
                        P_Name
                    </th>
                    <th>
                        Size
                    </th>
                    <th>
                        Oldprize
                    </th>
                    <th>
                        Newprize
                    </th>
                    <th>
                        Color
                    </th>
                    <th>
                        Qty
                    </th>
                    <th>
                        Description
                    </th>
                    <th>
                        Images
                    </th>
                </tr>
                <%  es = new eShoppingQuery();
                    rs = es.productData();
                    while (rs.next()) {
                %>
                <tr>
                    <td>
                        <a href="admin_masterpage.jsp?page=admin_productForm.jsp&id=<%=rs.getString("pId")%>">Edit</a>
                    </td>
                    <td>
                        <a href="admin_masterpage.jsp?page=admin_productForm.jsp&idDelete=<%=rs.getString("pId")%>">Delete</a>
                    </td>
                    <td>
                        <%=rs.getString("pId")%>
                    </td>
                    <td>
                        <%=rs.getString("pDepart")%>
                    </td>
                    <td>
                        <%=rs.getString("pCategory")%>
                    </td>
                    <td>
                        <%=rs.getString("pCompany")%>
                    </td>
                    <td>
                        <%=rs.getString("pName")%>
                    </td>
                    <td>
                        <%=rs.getString("pSize")%>
                    </td>
                    <td>
                        <%=rs.getString("pOldprize")%>
                    </td>
                    <td>
                        <%=rs.getString("pNewprize")%>
                    </td>
                    <td>
                        <%=rs.getString("pColor")%>
                    </td>
                    <td>
                        <%=rs.getString("pQty")%>
                    </td>
                    <td>
                        <%=rs.getString("pDescription")%>
                    </td>
                    <td>
                        <img src="img/<%=rs.getString("pImg")%>" height="90" width="90" />
                    </td>
                </tr>
                <%}%>
            </table>
            <br> <br>
        </div>
        <!--contain close-->
    </body>
</html>
