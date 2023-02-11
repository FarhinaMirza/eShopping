<%-- 
    Document   : cartForm
    Created on : Oct 8, 2018, 11:30:10 AM
    Author     : FARHEENA
--%>
<%@page import="java.sql.*;" %>
<%@page import="mypackage.eShoppingQuery" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
    </head>
    <% // Update cart data
        eShoppingQuery es;
        ResultSet rs;
        if (request.getParameter("cid") != null && request.getParameter("qty") != null) {
            es = new eShoppingQuery();
            String cart = request.getParameter("cid");
            String qty = request.getParameter("qty");
            String val = es.updateCart(cart, qty);
            out.print("<script>alert('" + val + "'); window.location.href='masterpage.jsp?page=cartForm.jsp';</script>");
        }
    %>

    <% // Delete cart data
        if (request.getParameter("idDelete") != null) {
            es = new eShoppingQuery();
            String val = es.deleteCart(request.getParameter("idDelete"));
            out.print(val);
            out.print("<script>window.location.href='masterpage.jsp?page=cartForm.jsp';</script>");
        }
    %>

    <% // paybtn data
        if (request.getParameter("paybtn") != null) {
            if (session.getAttribute("email") != null) {
                session.setAttribute("finalNetPrice", request.getParameter("hidNetPrice"));
                session.setAttribute("finalTotal", request.getParameter("hidfinalTotal"));
                session.setAttribute("finalDiscount", request.getParameter("hidfinalDiscount"));
                session.setAttribute("finalQty", request.getParameter("hidfinalQty"));
                out.print("<script>window.location.href='masterpage.jsp?page=shippingForm.jsp';</script>");
            } else {
                out.print("<script>window.location.href='masterpage.jsp?page=LoginForm1.jsp';</script>");
            }
        }
    %>

    <% // Buy more Item data
        if (request.getParameter("itembtn") != null) {
            out.print("<script>window.location.href='masterpage.jsp?page=departmentForm.jsp';</script>");
        }
    %>
    <body>
        <div class="admin_contain center">
            <p>Cart :</p>
            <table class="grid_center" cellpadding="1" cellspacing="1" align="center" border="1">
                <tr>
                    <th></th>
                    <th></th>
                    <th>
                        Product Image
                    </th>
                    <th>
                        Product Code
                    </th>
                    <th>
                        Product Name
                    </th>
                    <th>
                        Price
                    </th>
                    <th>
                        Quentity
                    </th>
                    <th>
                        Total
                    </th>
                </tr>
                <% // inner join query for cart
                    String total = "";
                    int t = 0, q = 0;
                    String uniqId = "0";
                    if (session.getAttribute("cart") != null) {
                        uniqId = session.getAttribute("cart").toString();
                    }
                    es = new eShoppingQuery();
                    rs = es.innerJoinCartToProductData(uniqId);
                    int count = 0;
                    int cnt = 0;
                    while (rs.next()) {
                        cnt++;
                        count = rs.getRow();
                        total = (Integer.parseInt(rs.getString("pNewprize")) * Integer.parseInt(rs.getString("qty"))) + "";
                        t = t + Integer.parseInt(total);
                        q = q + Integer.parseInt(rs.getString("qty"));
                %>
                <tr>
                    <td>
                        <input type="checkbox" value="<%=rs.getString("cartId")%>" id="checkbtn<%=rs.getString("cartId")%>" name="checkbtn"/>
                    </td>
                    <td>
                        <a href="masterpage.jsp?page=cartForm.jsp&idDelete=<%=rs.getString("cartId")%>"><i class="fa fa-trash"></i></a>
                    </td>
                    <td>
                        <img src="img/<%=rs.getString("pImg")%>"/>
                    </td>
                    <td>
                        <%=rs.getString("uniqueId")%>
                    </td>
                    <td>
                        <%=rs.getString("pName")%>
                    </td>
                    <td>
                        <label id="lblNewPrice-<%=rs.getString("cartId")%>"><%=rs.getString("pNewprize")%></label>
                    </td>
                    <td>
                        <input type="number" onchange="txtQtyFun(<%=rs.getString("cartId")%>)" data-txtQtycartId="<%=rs.getString("cartId")%>" id="txtQty-<%=rs.getString("cartId")%>" name="txtQty-<%=rs.getString("cartId")%>" value="<%=rs.getString("qty")%>" min="1" max="100" />
                        <input type="button" id="qtybtn" onclick="btnUpdate(<%=rs.getString("cartId")%>)" name="qtybtn" value="Update"/>
                    </td>
                    <td>
                        <label data-lblTotal="<%=cnt%>" id="lblTotal-<%=rs.getString("cartId")%>"><%=total%></label>
                    </td>
                </tr>
                <%}%>
            </table> <br>
            <!--cart check - uncheck--> 
            <img class="selectallarrow" src="img/arrow_left.png" alt=""/>
            <a style="color: blue;" href="#" id="chkAllBtn" onclick="CheckcheckAll(); return false;">Check All</a> / 
            <a style="color: blue;" href="#" id="chkAllBtn" onclick="CheckUncheckAll(); return false;">Uncheck All</a> With selected : <button id="btnDeleteAll" type="button" name="btnDeleteAll" onclick="btnDeleteAllClick()"><i class="iclass fa fa-trash"></i></button>
            <!--cart check - uncheck close-->
            <input type="hidden" value="<%=count%>" id="hidCount" name="hidCount" />
            <br> <br>
            <div class="form-group">
                <label>Qty</label> <span style="font-weight: bold;" id="lblFinalTotalQty"><%=q%></span> <br>
                <label>Total Price</label> <span style="font-weight: bold;"><span id="lblFinalTotalPrice"><%=t%></span> RS/- Only</span><br>
                <label style="color: blue;">Discount (10)%</label> <span style="font-weight: bold;"> <span id="lblFinalDiscount"><%=(t * 10) / 100%></span> RS/-</span><br>
                <label>NetPrice</label> <span style="font-weight: bold;"><span id="lblFinalNetPrice"><%=t - ((t * 10) / 100)%></span> RS/-</span> 
                <!--get data for order form-->
                <input type="hidden" id="hidNetPrice" name="hidNetPrice" value="0"/>
                <input type="hidden" id="hidfinalTotal" name="hidfinalTotal" value="0"/>
                <input type="hidden" id="hidfinalDiscount" name="hidfinalDiscount" value="0"/>
                <input type="hidden" id="hidfinalQty" name="hidfinalQty" value="0"/>
            </div>
            <div class="cart_btn">
                <input type="submit" id="itembtn" name="itembtn" value="Buy More Item"/>
                <input type="submit" id="paybtn" name="paybtn" value="Proced to Pay"/>
            </div>
        </div>
        <script type="text/javascript">
            window.onload = function ()
            {
                hidNetPrice.value = lblFinalNetPrice.innerHTML;
                hidfinalTotal.value = lblFinalTotalPrice.innerHTML;
                hidfinalDiscount.value = lblFinalDiscount.innerHTML;
                hidfinalQty.value = lblFinalTotalQty.innerHTML;
            }

            function txtQtyFun(cartId)
            {
                var txtQtyVal = document.querySelector("#txtQty-" + cartId).value;
                var proPrice = document.querySelector("#lblNewPrice-" + cartId).innerHTML;
                //document.querySelector("#txtQty-" + cartId).value = parseInt(txtQtyVal).toString();
                document.querySelector("#lblTotal-" + cartId).innerHTML = (parseInt(txtQtyVal) * parseInt(proPrice)).toString();
                var finalTotal = 0;
                for (var i = 1; i <= parseInt(document.querySelector("#hidCount").value); i++)
                {
                    finalTotal = finalTotal + parseInt(document.querySelector("label[data-lblTotal='" + i + "']").innerHTML);
                }
                lblFinalTotalPrice.innerHTML = finalTotal.toString();
                lblFinalTotalQty.innerHTML = txtQtyVal.toString();
                lblFinalDiscount.innerHTML = ((finalTotal * 10) / 100).toString();
                lblFinalNetPrice.innerHTML = (finalTotal - (finalTotal * 10) / 100).toString();
                hidNetPrice.value = lblFinalNetPrice.innerHTML;

                //sessionStorage.setItem("netPrize",lblFinalNetPrice.innerHTML);
                // console.log(txtQtyVal);
            }

            function btnUpdate(cartId)
            {
                //debugger;
                var txtQtyVal = document.querySelector("#txtQty-" + cartId).value;
                window.location.href = "masterpage.jsp?page=cartForm.jsp&cid=" + cartId + "&qty=" + txtQtyVal;
            }
            function CheckcheckAll()
            {
                var chkBox = document.getElementsByName("checkbtn");
                for (var i = 0; i < chkBox.length; i++) {
                    chkBox[i].checked = true;
                    /*if(chkBox[i].checked == true)
                     {
                     console.log(chkBox[i].value);       
                     }*/
                }
            }
            function CheckUncheckAll() {
                var unchkBox = document.getElementsByName("checkbtn");
                for (var i = 0; i < unchkBox.length; i++) {
                    unchkBox[i].checked = false;
                }
            }
            function btnDeleteAllClick()
            {
                var carIds = "";
                var chkBox = document.getElementsByName("checkbtn");
                for (var i = 0; i < chkBox.length; i++) {
                    if (chkBox[i].checked == true)
                    {
                        /* if (i == (chkBox.length - 1)) {
                         carIds += chkBox[i].value;
                         }
                         else
                         {*/
                        carIds += "," + chkBox[i].value;
                        //}

                    }

                }
                carIds = carIds.substring(1, carIds.length);
                // console.log(carIds);
                window.location.href = "masterpage.jsp?page=cartForm.jsp&idDelete=" + carIds;
            }

        </script>
    </body>
</html>
