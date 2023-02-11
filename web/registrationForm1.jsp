<%-- 
    Document   : registrationForm
    Created on : Sep 7, 2018, 10:19:42 PM
    Author     : FARHEENA
--%>
<%@page import="mypackage.eShoppingQuery" %>
<%@page import="java.sql.*;"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
    <head runat="server">
        <title></title>
        <style type="text/css">
            .auto-style1 {
                width: 1170px;
            }
            .auto-style2 {
                width: 1000px;
                height: 120px;

            }
            .auto-style3 {
                width: 1000px;
                height: 40px;

            }
            .auto-style4 {
                width: 1000px;
                height: 785px;
                background-color: #66FF99;
            }
            .auto-style5 {
                width: 970px;
                height: 100px;

            }
            .auto-style6 {
                width: 1000px;
                height: 200px;

            }
            .auto-style7 {
                width: 1000px;
                height: 120px;
                background-color: #000;
            }
            .auto-style8 {
                width: 218px;
                height: 119px;
            }
            .auto-style9 {
                width: 164px;
                height: 120px;
            }
            .auto-style10 {
                width: 100px;
                height: 118px;
            }
            .auto-style11 {
                width: 120px;
                height: 120px;
                background-color: #000;
            }
            .auto-style12 {
                width: 100%;
                height: 120px;
                background-color: #000;
            }
            .auto-style13 {
                width: 100%;
                height: 60px;
                background-color: #000;
            }
            .auto-style14 {
                font-size: medium;
                font-weight: bold;
            }
            .auto-style15 {
                font-size: medium;
                font-weight: bold;
                color: #FFCC00;
            }
            .auto-style16 {
                width: 976px;
                height: 100px;
            }
            .auto-style17 {
                width: 100%;
                height: 785px;

            }
            .auto-style18 {
                width: 100%;
                height: 200px;

            }
            .auto-style19 {
                width: 206px;
                height: 206px;
            }
            .auto-style20 {
                width: 100%;
                height: 785px;

            }
            .auto-style21 {
                font-size: xx-large;
                color: #0000FF;
            }
            .auto-style22 {
                width: 1000px;
                height: 40px;

            }
            .auto-style23 {
                background-color: #66FF99;
            }
            .auto-style24 {
                width: 244px;
                height: 186px;
            }
            .auto-style25 {
                color: #FFFFFF;
                font-size: large;
                background-color: #000000;
            }
            .auto-style26 {
                color: #FFFFFF;
                font-size: x-large;
                text-align: center;
                font-weight: bold;
                background-color: #000000;
            }
            .auto-style27 {
                color: #FF9900;
                font-size: medium;
                font-weight: bold;
                background-color: #000000;
            }
            .auto-style28 {
                color: #FF9900;
                font-size: large;
                height: 33px;
                background-color: #000000;
            }
            .auto-style29 {
                color: #FF9900;
                font-size: medium;
                height: 33px;
                font-weight: bold;
                background-color: #000000;
            }
            .auto-style30 {
                color: #FFFFFF;
                font-size: x-small;
                background-color: #000000;
                padding-left: 10px;
            }
        </style>
    </head>
    <body>
        <form id="form1" runat="server">

            <table align="center" cellpadding="0" cellspacing="0" class="auto-style1">
                <tr>
                    <td>
                        <table align="center" cellpadding="0" cellspacing="0" class="auto-style2">
                            <tr>
                                <td>
                                    <table align="center" cellpadding="0" cellspacing="0" class="auto-style7">
                                        <tr>
                                            <td height="120" width="200">
                                                <img alt="" class="auto-style8" src="Web Pages/img/eshop.png" /></td>
                                            <td height="120" width="165">
                                                <img alt="" class="auto-style9" src="img/img1.png" /></td>
                                            <td height="120" width="415">
                                                <table align="center" cellpadding="0" cellspacing="0" class="auto-style12">
                                                    <tr>
                                                        <td height="60" width="415">
                                                            <table cellpadding="0" cellspacing="0" class="auto-style13">
                                                                <tr>
                                                                    <td align="center" height="60px" valign="middle" width="200px">
                                                                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="White">Admin</asp:HyperLink>
                                                                    </td>
                                                                    <td align="center" height="60px" valign="middle" width="200px">
                                                                        <asp:HyperLink ID="HyperLink3" runat="server" Font-Bold="True" Font-Size="Medium" ForeColor="White">Sign In</asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="60" valign="middle" width="415">
                                                            <input type="text" id="txt1" name="txt1" style= "height:30px; width:350px;"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td height="120" width="120">
                                                <table align="center" cellpadding="0" cellspacing="0" class="auto-style11">
                                                    <tr>
                                                        <td align="center" valign="middle">
                                                            <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" ForeColor="White">Registration</asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" valign="middle">
                                                            <asp:Button ID="Button1" runat="server" BackColor="#FF9900" Font-Bold="True" Font-Size="Medium" ForeColor="White" Text="Search" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td height="120" width="100">
                                                <img alt="" class="auto-style10" src="img/img2.png" /></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table align="center" cellpadding="0" cellspacing="0" class="auto-style3">
                            <tr>
                                <td align="center" valign="middle" width="166" bgcolor="#006666" class="auto-style14">
                                    <asp:HyperLink ID="HyperLink4" runat="server" CssClass="auto-style15">Home</asp:HyperLink>
                                </td>
                                <td align="center" valign="middle" width="166" bgcolor="#006666">
                                    <asp:HyperLink ID="HyperLink5" runat="server" CssClass="auto-style15">Products</asp:HyperLink>
                                </td>
                                <td align="center" valign="middle" width="166" bgcolor="#006666" class="auto-style15">About Us</td>
                                <td align="center" valign="middle" width="166" bgcolor="#006666" class="auto-style15">Contact Us</td>
                                <td align="center" valign="middle" width="166" bgcolor="#006666" class="auto-style15">Feedback</td>
                                <td align="center" valign="middle" width="166" bgcolor="#006666" class="auto-style15">May We Help</td>
                            </tr>
                        </table>
                        <table align="center" cellpadding="0" cellspacing="0" class="auto-style4">
                            <tr>
                                <td align="left" valign="top" width="700">
                                    <table cellspacing="0" class="auto-style17">
                                        <tr>
                                            <td width="500" align="left" valign="top">
                                                <table cellpadding="0" cellspacing="0" class="auto-style20">
                                                    <tr>
                                                        <td align="center" class="auto-style21" colspan="2" height="46" valign="middle"><strong>Register Here : </strong></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">First Name :</td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="fntxt" name="fntxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Middle Name :</td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="mntxt" name="mntxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Last Name :</td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="lntxt" name="lntxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Email Id : </td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="mailtxt" name="mailtxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Password :</td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="passtxt" name="passtxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Retype Password : </td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="confpastxt" name="confpastxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Gender : </td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <label><input type="radio" id="rdo" name="rdo"/>Male</label>
                                                            <label><input type="radio" id="rdo" name="rdo"/>Female</label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Dob : </td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="datetxt" name="datetxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Address : </td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="addresstxt" name="addresstxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Country :</td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <select id="countxt" name="countxt" style="width:200px; height: 20px;">
                                                                <option>---Select Country---</option>
                                                                <option value="India">India</option>
                                                                <option value="UKA">UKA</option>
                                                                <option value="Saudi Arabia">Saudi Arabia</option>
                                                                <option value="USA">USA</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">State : </td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <select id="statetxt" name="statetxt" style="width:200px; height: 20px;">
                                                                <option>---Select Country---</option>
                                                                <option value="Gujarat">Gujarat</option>
                                                                <option value="Goa">Goa</option>
                                                                <option value="Uttar Pradesh">Uttar Pradesh</option>
                                                                <option value="Bihar">Bihar</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">City : </td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <select id="citytxt" name="citytxt" style="width:200px; height: 20px;">
                                                                <option>---Select Country---</option>
                                                                <option value="Modasa">Modasa</option>
                                                                <option value="Himmatnagar">Himmatnagar</option>
                                                                <option value="Ahmedabad">Ahmedabad</option>
                                                                <option value="Gandhinagar">Gandhinagar</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Pin Code : </td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="pintxt" name="pintxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Contact No : </td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="contacttxt" name="contacttxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Security Question :</td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <select id="sQudrop" name="sQudrop" style="width:200px; height: 20px;">
                                                                <option>---Select Country---</option>
                                                                <option value="What is nick name?">What is nick name?</option>
                                                                <option value="What is your first school?">What is your first school?</option>
                                                                <option value="What is your first college?">What is your first college?</option>
                                                                <option value="What is your first teacher name?">What is your first teacher name?</option>
                                                            </select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" height="46" valign="middle" width="200">Security Answer : </td>
                                                        <td align="center" height="46" valign="middle" width="300">
                                                            <input type="text" id="sAnstxt" name="sAnstxt" style="height: 20px; width: 200px;"/>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left" valign="top" width="200">
                                                <table align="center" cellpadding="0" cellspacing="0" class="auto-style18">
                                                    <tr>
                                                        <td>
                                                            <img alt="" class="auto-style19" src="img/img3.png" /></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="300" style="border-left-style: solid; border-left-width: 1px; border-left-color: #000000;">&nbsp;</td>
                            </tr>
                        </table>
                        <table align="center" cellpadding="0" cellspacing="0" class="auto-style22" style="border-top-style: solid; border-top-width: 1px; border-top-color: #000000">
                            <tr>
                                <td height="40" align="center" class="auto-style23" valign="middle">
                                    <input  type="checkbox" id="checkbtn" name="checkbtn" OnCheckedChanged="CheckBox1_CheckedChanged" style="font-weight: 700; color: #0066FF; font-size: large"/>I have Read and accepted the terms of user of e-shop.com 
                                </td>
                            </tr>
                            <tr>
                                <td height="40" align="center" class="auto-style23" valign="middle">
                                    <input type="submit" id="registerbtn" name="registerbtn" value="Register" style="font-size: large; font-weight: 700; color: #FFFFFF; background-color: #33CC33"/>
                                </td>
                            </tr>
                        </table>
                        <table align="center" cellpadding="0" cellspacing="0" class="auto-style5">
                            <tr>
                                <td>
                                    <img alt="" class="auto-style16" src="img/footer1.png" /></td>
                            </tr>
                        </table>
                        <table align="center" cellpadding="0" cellspacing="0" class="auto-style6">
                            <tr>
                                <td class="auto-style26" height="33" width="192">About Us</td>
                                <td class="auto-style26" height="33" width="192">Customer Service</td>
                                <td class="auto-style26" height="33" width="192">Shopping with Us</td>
                                <td class="auto-style26" height="33" width="192">Browse Products</td>
                                <td class="auto-style25" height="200" rowspan="6" width="230">
                                    <img alt="" class="auto-style24" src="img/footer2.png" /></td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink6" runat="server">About e-shop</asp:HyperLink>
                                </td>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink10" runat="server">My account</asp:HyperLink>
                                </td>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink14" runat="server">Track an Order</asp:HyperLink>
                                </td>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink16" runat="server">Apparel &amp; Accessories Gift &amp; Flower</asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink7" runat="server">About Network</asp:HyperLink>
                                </td>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink11" runat="server">Order Status</asp:HyperLink>
                                </td>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink15" runat="server">Payment Option</asp:HyperLink>
                                </td>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink17" runat="server">Jewellery &amp; Watches Kids &amp; Baby</asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style29" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink8" runat="server">Terms of Use</asp:HyperLink>
                                </td>
                                <td align="center" class="auto-style29" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink12" runat="server">Contact Us</asp:HyperLink>
                                </td>
                                <td align="center" class="auto-style28" valign="middle" width="192"></td>
                                <td align="center" class="auto-style29" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink18" runat="server">Health &amp; Beauty Help</asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink9" runat="server">feedback</asp:HyperLink>
                                </td>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">
                                    <asp:HyperLink ID="HyperLink13" runat="server">How to Shop</asp:HyperLink>
                                </td>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">&nbsp;</td>
                                <td align="center" class="auto-style27" height="33" valign="middle" width="192">&nbsp;</td>
                            </tr>
                            <tr>
                                <td align="left" class="auto-style30" colspan="4" height="33" valign="middle">&copy; 2013 e-shop. All Rights Reserved. Brand logos &amp; other trademarks, and certain used on <a href="http://www.e-shop.com">www.e-shop.com</a> are the Property of their respective owners. This Website is Designed by <span style="color: yellow">Farheena Mirza.</span></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

        </form>
    </body>
</html>