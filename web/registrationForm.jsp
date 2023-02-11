<%-- 
    Document   : registration
    Created on : Sep 10, 2018, 12:07:54 PM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page</title>
    </head>
    <% // insert registration data
        eShoppingQuery es; 
        ResultSet rs;
        if (request.getParameter("registerbtn")!=null) {
            if (request.getParameter("checkbtn")!=null) {
                es=new eShoppingQuery();
                String val=es.registrationInsert(request.getParameter("fname"), request.getParameter("mname"), request.getParameter("lname"),request.getParameter("mailtxt"),request.getParameter("passtxt"),request.getParameter("confpastxt"),request.getParameter("rdo"),request.getParameter("datetxt"),request.getParameter("addresstxt"),request.getParameter("coundrop"),request.getParameter("statedrop"), request.getParameter("citydrop"),request.getParameter("pintxt"),request.getParameter("contacttxt"),request.getParameter("sQudrop"),request.getParameter("sAnstxt"));
                out.print(val);
            }
            else{
                out.print("<script>alert('please select the condition...')</script>");
            }
        }
    %>
    <body>
                <!--contain start-->
                <div class="contain clear">
                    <div class="contain_left clear">
                        <div class="contain_left1">
                            <div><p>Register Here :</p></div>
                            <div class="form-group">
                                <label>First Name</label>
                                <input type="text" id="fname" name="fname" required/>
                            </div>
                            <div class="form-group">
                                <label>Middle Name</label>
                                <input type="text" id="mname" name="mname" required/>
                            </div>
                            <div class="form-group">
                                <label>Last Name</label>
                                <input type="text" id="lname" name="lname" required/>
                            </div>
                            <div class="form-group">
                                <label>Email Id</label>
                                <input type="text" id="mailtxt" name="mailtxt" required/>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input type="password" id="passtxt" name="passtxt" required/>
                            </div>
                            <div class="form-group">
                                <label>Confirm Password</label>
                                <input type="password" id="confpastxt" name="confpastxt" required/>
                            </div>
                            <div class="form-group">
                                <label>Gender</label>
                                <div class="rdo">
                                    <label><input type="radio" id="rdomale" name="rdo" value="Male"/>Male</label>
                                    <label><input type="radio" id="rdofemale" name="rdo" value="Female"/>Female</label>
                                </div>    
                            </div>
                            <div class="form-group">
                                <label>DOB</label>
                                <input type="text" id="datetxt" name="datetxt" required/>
                            </div>
                            <div class="form-group">
                                <label>Address</label>
                                <input type="text" id="addresstxt" name="addresstxt" required/>
                            </div>
                            <div class="form-group">
                                <label>Country</label>
                                <select id="coundrop" name="coundrop">
                                    <option>---Select Country---</option>
                                    <option value="India">India</option>
                                    <option value="UKA">UKA</option>
                                    <option value="Saudi Arabia">Saudi Arabia</option>
                                    <option value="USA">USA</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>State</label>
                                <select id="statedrop" name="statedrop">
                                    <option>---Select State---</option>
                                    <option value="Gujarat">Gujarat</option>
                                    <option value="Goa">Goa</option>
                                    <option value="Uttar Pradesh">Uttar Pradesh</option>
                                    <option value="Bihar">Bihar</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>City</label>
                                <select id="citydrop" name="citydrop">
                                    <option>---Select City---</option>
                                    <option value="Modasa">Modasa</option>
                                    <option value="Himmatnagar">Himmatnagar</option>
                                    <option value="Ahmedabad">Ahmedabad</option>
                                    <option value="Gandhinagar">Gandhinagar</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Pin Code</label>
                                <input type="text" id="pintxt" name="pintxt" required/>
                            </div>
                            <div class="form-group">
                                <label>Contact</label>
                                <input type="text" id="contacttxt" name="contacttxt" required/>
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
                        </div>
                        <div class="contain_left2">
                            <img src="img/img3.png" alt=""/>
                        </div>
                    </div>
                    <div class="contain_right">
                       <img src="img/img4.png" alt=""/>
                    </div>
                </div>
                <!--contain close-->
                <div class="contain_footer center">
                    <div>
                        <label>
                            <input type="checkbox" id="checkbtn" name="checkbtn"/>
                            <label>I have Read and accepted the terms of user of e-shop.com</label>
                        </label>
                    </div>
                    <div class="btn_footer">
                        <input type="submit" id="registerbtn" name="registerbtn" value="Register>>"/>
                    </div>
                </div>
        <br> <br> <br> <br>
    </body>
</html>
