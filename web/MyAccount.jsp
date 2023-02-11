<%-- 
    Document   : HomeForm
    Created on : Sep 14, 2018, 12:04:27 PM
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
        <title>My Account Page</title>
    </head>
    <% // Update data
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("updatebtn") != null) {
            es = new eShoppingQuery();
            String val = es.updateAccount(request.getParameter("fname"), request.getParameter("mname"), request.getParameter("lname"), request.getParameter("emailtxt"), request.getParameter("rdo"), request.getParameter("datetxt"), request.getParameter("addresstxt"), request.getParameter("statetxt"), request.getParameter("citytxt"), request.getParameter("pintxt"), request.getParameter("contacttxt"), request.getParameter("sQudrop"), request.getParameter("sAns"));
            out.print(val);
        }
    %>

    <% // Edit data
        String fname = "", mname = "", lname = "", email = "", gender = "", date = "", address = "", state = "", city = "", pin = "", contact = "", sQue = "", sAns = "";
        if (session.getAttribute("email") != null) {
            es = new eShoppingQuery();
            rs = es.editAccount(session.getAttribute("email").toString());
            while (rs.next()) {
                fname = rs.getString("firstName");
                mname = rs.getString("middleName");
                lname = rs.getString("lastName");
                email = rs.getString("emailId");
                gender = rs.getString("gender");
                date = rs.getString("dob");
                address = rs.getString("address");
                state = rs.getString("state");
                city = rs.getString("city");
                pin = rs.getString("zipCode");
                contact = rs.getString("contactNo");
                sQue = rs.getString("sQue");
                sAns = rs.getString("sAns");
            }
        }
    %>

    <% //cancel btn
        if (request.getParameter("cancelbtn") != null) {
            response.sendRedirect("LoginForm.jsp");
        }
    %>

    <body>
                <!--contain start-->
                <div class="contain_change center">
                    <p>My Account :</p>
                    <div class="form-group">
                        <label>First Name</label>
                        <input type="text" id="fname" name="fname" value="<%=fname%>"/>
                    </div>
                    <div class="form-group">
                        <label>Middle Name</label>
                        <input type="text" id="mname" name="mname" value="<%=mname%>"/>
                    </div>
                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" id="lname" name="lname" value="<%=lname%>"/>
                    </div>
                    <div class="form-group">
                        <label>Email Id</label>
                        <input type="text" id="emailtxt" name="emailtxt" value="<%=email%>"/>
                    </div>
                    <div class="form-group">
                        <label>Gender</label>
                        <div class="rdo">
                            <label><input type="radio" id="rdomale" <% if (gender.equals("Male")) {
                                    out.print("checked");
                                } %> name="rdo" value="Male" />Male</label>
                            <label><input type="radio" id="rdofemale"  <% if (gender.equals("Female")) {
                                    out.print("checked");
                                }%> name="rdo" value="Female" />Female</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label>Dob</label>
                        <input type="text" id="datetxt" name="datetxt" value="<%=date%>"/>
                    </div>
                    <div class="form-group">
                        <label>Address</label>
                        <input type="text" id="addresstxt" name="addresstxt" value="<%=address%>"/>
                    </div>
                    <div class="form-group">
                        <label>City</label>
                        <input type="text" id="citytxt" name="citytxt" value="<%=city%>"/>
                    </div>
                    <div class="form-group">
                        <label>State</label>
                        <input type="text" id="statetxt" name="statetxt" value="<%=state%>"/>
                    </div>
                    <div class="form-group">
                        <label>Contact No</label>
                        <input type="text" id="contacttxt" name="contacttxt" value="<%=contact%>"/>
                    </div>
                    <div class="form-group">
                        <label>Pin Code</label>
                        <input type="text" id="pintxt" name="pintxt" value="<%=pin%>"/>
                    </div>
                    <div class="form-group">
                        <label>Security Question</label> <select id="sQudrop" name="sQudrop" value="<%=sQue%>">
                            <option>---Select Question---</option>
                            <option value="What is nick name?" <% if (sQue.equals("What is nick name?")) {
                                    out.print("selected");
                                } %>>What is nick name?</option>
                            <option value="What is your first school?" <% if (sQue.equals("What is your first school?")) {
                                    out.print("selected");
                                } %>>What is your first school?</option>
                            <option value="What is your first college?" <% if (sQue.equals("What is your first college?")) {
                                    out.print("selected");
                                } %>>What is your first college?</option>
                            <option value="What is your first teacher name?" <% if (sQue.equals("What is your first teacher name?")) {
                                    out.print("selected");
                                }%>>What is your first teacher name?</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label>Security Answer</label>
                        <input type="text" id="sAns" name="sAns" value="<%=sAns%>"/></label>
                    </div>
                    <div class="forget_btn">
                        <input type="submit" id="updatebtn" name="updatebtn" value="Update"/>
                        <input type="submit" id="cancelbtn" name="cancelbtn" value="Cancel"/>
                    </div>
                </div>
                <!--contain close-->
    </body>
</html>
