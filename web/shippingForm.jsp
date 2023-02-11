<%-- 
    Document   : shippingForm
    Created on : Oct 16, 2018, 11:25:06 AM
    Author     : FARHEENA
--%>
<%@page import="java.util.Random"%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shipping Page</title>
    </head>
    <% // Shipping insert data
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("savebtn")!=null) {
                es = new eShoppingQuery();
                String var = es.shippingInsert(request.getParameter("nametxt"), Integer.parseInt(session.getAttribute("rId").toString()), request.getParameter("addresstxt"), request.getParameter("contacttxt"), request.getParameter("citydrop"), request.getParameter("statedrop"), request.getParameter("pintxt"));
                //out.print(var);
                String s[] = var.split(",");
                //out.print(s[0]+"<br>"+s[1]);
                if (s[1].equals("0")) {
                        out.print("<script>alert('"+s[0]+"')</script>");
                    }
                else
                {
                    out.print("<script>alert('"+s[0].toString()+"') ;window.location.href='masterpage.jsp?page=paymentForm.jsp&shipid="+s[1]+"';</script>");
                }
            }
    %>
    
    
    <% // email data
        String email="";
        if (session.getAttribute("email")!=null) {
                es = new eShoppingQuery();
                rs=es.editAccount(session.getAttribute("email").toString());
                while(rs.next()){
                    email=rs.getString("emailId");
                }
            }
    %>
    <body>
        <!--contain start-->
        <div class="shipping center clear">
            <!--shipping left start-->
            <div class="shipping_left">
                <p>Your Billing Details <span>(As per your credit Card/Bank Account)</span></p>
                <div class="form-group">
                    <label>Your Name</label>
                    <input type="text" id="nametxt" name="nametxt" required/>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" id="addresstxt" name="addresstxt" required/>
                </div>
                <div class="form-group">
                    <label>Mobile No</label>
                    <input type="text" id="contacttxt" name="contacttxt" required/>
                </div>
                <div class="form-group">
                    <label>City</label>
                    <select id="citydrop" name="citydrop">
                        <option>---Select Country---</option>
                        <option value="Modasa">Modasa</option>
                        <option value="Himmatnagar">Himmatnagar</option>
                        <option value="Ahmedabad">Ahmedabad</option>
                        <option value="Gandhinagar">Gandhinagar</option>
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
                    <label>Pin Code</label>
                    <input type="text" id="pintxt" name="pintxt" required/>
                </div>
            </div>
            <!--shipping left close-->
            <!--shipping right start-->
            <div class="shipping_right">
                <p>Shipping Delivery Address <span>
                        <input type="checkbox" id="checkbtn" name="checkbtn" onchange="fillbillingClick()"/>Same as Billing Address</span> </p>
                <div class="form-group">
                    <label>Recipient Email</label>
                    <input type="text" id="remailtxt" name="remailtxt" value="<%=email%>"/>
                </div>
                <div class="form-group">
                    <label>Recipient Name</label>
                    <input type="text" id="rnametxt" name="rnametxt"/>
                </div>
                <div class="form-group">
                    <label>Address</label>
                    <input type="text" id="raddresstxt" name="raddresstxt"/>
                </div>
                <div class="form-group">
                    <label>Mobile No</label>
                    <input type="text" id="rcontacttxt" name="rcontacttxt"/>
                </div>
                <div class="form-group">
                    <label>City</label>
                    <select id="rcitydrop" name="rcitydrop">
                        <option>---Select Country---</option>
                        <option value="Modasa">Modasa</option>
                        <option value="Himmatnagar">Himmatnagar</option>
                        <option value="Ahmedabad">Ahmedabad</option>
                        <option value="Gandhinagar">Gandhinagar</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>State</label>
                    <select id="rstatedrop" name="rstatedrop">
                        <option>---Select State---</option>
                        <option value="Gujarat">Gujarat</option>
                        <option value="Goa">Goa</option>
                        <option value="Uttar Pradesh">Uttar Pradesh</option>
                        <option value="Bihar">Bihar</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Pin Code</label>
                    <input type="text" id="rpincodetxt" name="rpincodetxt"/>
                </div>
            </div>
            <!--shipping right close-->
        </div>
        <div class="shipping_footer center">
            <h2>Delivery Preferences <i>(Optional)</i></h2>
            <h4>Approximate Date Of Delivery</h4>
            <label><input type="checkbox" id="checkbtnfooter" name="checkbtnfooter"/> At the earliest</label>
           <span>Flowers & Cakes in India (selected locations) : 24 hours. other products in major Indian cities 
               & metros : 3-5 working days, Remote & International deliveries : 7-10 working days.</span>
            <p>Time Assurance is only possible for Products from fixed time Delivery category. There is a definite transit period of delivery for other product.
            We still try our best to meet delivery preferences.</p>
            <input type="submit" id="savebtn" name="savebtn" value="SAVE & CONTINUE"/>
        </div>
        <!--contain close-->
        <script type="text/javascript">
            function fillbillingClick(){
                if (checkbtn.checked == true) {
                    rnametxt.value=nametxt.value;
                    raddresstxt.value=addresstxt.value;
                    rcontacttxt.value=contacttxt.value;
                    rcitydrop.value=citydrop.value;
                    rstatedrop.value=statedrop.value;
                    rpincodetxt.value=pintxt.value;
            }
        }
        </script>
    </body>
</html>
