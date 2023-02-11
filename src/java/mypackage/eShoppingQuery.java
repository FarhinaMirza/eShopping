/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mypackage;

import java.sql.*;
/**
 *
 * @author FARHEENA
 */
public class eShoppingQuery {

    public static Connection mycon() throws Exception {
        Class.forName("com.mysql.jdbc.Driver");
        return DriverManager.getConnection("jdbc:mysql://localhost:3306/eshopping", "root", "");
    }
// login data

    public static ResultSet LoginForm(String mail, String password) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from registrationform where emailId='" + mail + "'and password='" + password + "'");
        return rs;
    }

    // insert registration data
    public static String registrationInsert(String fname, String mname, String lname, String email, String password, String rePassword, String gender, String dob, String address, String country, String state, String city, String pincode, String contact, String sQue, String sAns) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from registrationform where firstName='" + fname + "'");
        if (rs.next()) {
            return "<script>alert('Name is already exists...')</script>";
        } else {
            int sql = st.executeUpdate("Insert into registrationform VALUES(NULL,'" + fname + "','" + mname + "','" + lname + "','" + email + "','" + password + "','" + rePassword + "','" + gender + "','" + dob + "','" + address + "','" + country + "','" + state + "','" + city + "','" + pincode + "','" + contact + "','" + sQue + "','" + sAns + "',curdate())");
            if (sql > 0) {
                return "<script>alert('Successfully Store your Data...')</script>";
            } else {
                return "<script>alert('Something Wrong...')</script>";
            }
        }
    }

    //forget pass data
    public static ResultSet forgetpass(String mail, String sQue, String sAns) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from registrationform where emailId='" + mail + "'and sQue='" + sQue + "'and sAns='" + sAns + "'");
        return rs;
    }

    // update forget pass data
    public static String forgetupdatepass(String mail, String newpass, String confpass) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Update registrationform set password='" + newpass + "',rePassword='" + confpass + "' where emailId='" + mail + "'");
        if (sql > 0) {
            return "<script>alert('New Password Successfully Updated...')</script>";
        } else {
            return "<script>alert('Something Wrong...')</script>";
        }
    }

    // feedback data
    public static void feedbackform(String fname, String mail, String contact, String comment) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Update registrationform set  where firstName='" + fname + "',emailId='" + mail + "',contactNo='" + contact + "'");
    }

    // change pass data
    public static String changepass(String mail, String password, String newpass, String confpass) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from registrationform where emailId='" + mail + "' and password='" + password + "'");
        if (rs.next()) {
            int sql = st.executeUpdate("Update registrationform set password='" + newpass + "',rePassword='" + confpass + "'where emailId='" + mail + "'");
            if (sql > 0) {
                return "<script>alert('Password Changed Successfully...')</script>";
            } else {
                return "<script>alert('Something Wrong in Code')</script>";
            }
        } else {
            return "<script>alert('Old Password does not match...')</script>";
        }
    }

    // Edit MyAccount data
    public static ResultSet editAccount(String email) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from registrationform where emailId='" + email + "'");
        return rs;
    }

    // Update MyAccount data
    public static String updateAccount(String fname, String mname, String lname, String email, String gender, String dob, String address, String state, String city, String pincode, String contact, String sQue, String sAns) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Update registrationform set middleName='" + mname + "',lastName='" + lname + "',emailId='" + email + "',gender='" + gender + "',dob='" + dob + "',address='" + address + "',state='" + state + "',city='" + city + "',zipCode='" + pincode + "',contactNo='" + contact + "',sQue='" + sQue + "',sAns='" + sAns + "' where firstName='" + fname + "'");
        if (sql > 0) {
            return "<script>alert('Successfully Update your Data..')</script>";
        } else {
            return "<script>alert('Somthing Wrong')</script>";
        }
    }

    // feedback data
    public static String feedbackInsert(String name, String email, String contact, String comment) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Insert into feedbackform VALUES (NULL,'" + name + "','" + email + "','" + contact + "','" + comment + "',curdate())");
        if (sql > 0) {
            return "<script>alert('Thanks for your Comment...')</script>";
        } else {
            return "<script>alert('Something Wrong in Code')</script>";
        }
    }

    // Admin login data
    public static ResultSet adminLogin(String email, String password) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from adminform where emailId='" + email + "' and password='" + password + "'");
        return rs;
    }

    // News insert data
    public static String insertNews(String news) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Insert into masternews VALUES(NULL,'" + news + "',curdate())");
        if (sql > 0) {
            return "<script>alert('Your Data successfully store...')</script>";
        } else {
            return "<script>alert('Something Wrong...')</script>";
        }
    }

    // News data
    public static ResultSet news() throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from masternews");
        return rs;
    }

    // Department insert data
    public static String departmentInsert(String department, String img) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Insert into admindepartment VALUES(NULL,'" + department + "','" + img + "',curdate())");
        if (sql > 0) {
            return "<script>alert('Successfully store your data..')</script>";
        } else {
            return "<script>alert('Something wrong...')</script>";
        }
    }

    // Department data
    public static ResultSet departmentData() throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from admindepartment");
        return rs;
    }

    // Edit for department data
    public static ResultSet editDepartment(String id) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from admindepartment where dId='" + id + "'");
        return rs;
    }

    // Update for department data
    public static String updateDepartment(String id, String department, String img) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Update admindepartment Set department='" + department + "',img='" + img + "' where dId='" + id + "'");
        if (sql > 0) {
            return "<script>alert('Successfully Update your Data..')</script>";
        } else {
            return "<script>alert('Somthing Wrong')</script>";
        }
    }

    // Delete for department data
    public static String deleteDepartment(String idDelete) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Delete from admindepartment where dId='" + idDelete + "'");
        return "<script>alert('Successfully Delete Your Data...')</script>";
    }

    // Category insert data
    public static String categoryInsert(String department, String category, String img) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Insert into admincategory VALUES(NULL,'" + department + "','" + category + "','" + img + "',curdate())");
        if (sql > 0) {
            return "<script>alert('Successfully store your data..')</script>";
        } else {
            return "<script>alert('Something wrong...')</script>";
        }
    }

    // Category data
    public static ResultSet categoryData() throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from admincategory");
        return rs;
    }

    // Sub Category data
    public static ResultSet subcategoryData(String dept) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from admincategory where department='" + dept + "'");
        return rs;
    }

    // Edit for Category data
    public static ResultSet editCategory(String id) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from admincategory where cId='" + id + "'");
        return rs;
    }

    // Update for category data
    public static String updateCategory(String id, String department, String category, String img) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Update admincategory Set department='" + department + "',category='" + category + "',img='" + img + "' where cId='" + id + "'");
        if (sql > 0) {
            return "<script>alert('Successfully Update your Data..')</script>";
        } else {
            return "<script>alert('Something wrong...')</script>";
        }
    }

    // Delete for category data
    public static String deleteCategory(String idDelete) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Delete from admincategory where cId='" + idDelete + "'");
        return "<script>alert('Successfully Delete Your Data...')</script>";
    }

    // Company insert data
    public static String companyInsert(String department, String category, String companyName) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Insert into admincompany VALUES(NULL,'" + department + "','" + category + "','" + companyName + "',curdate())");
        if (sql > 0) {
            return "<script>alert('Successfully store your data..')</script>";
        } else {
            return "<script>alert('Something wrong...')</script>";
        }
    }

    // Company data
    public static ResultSet companyData() throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from admincompany");
        return rs;
    }

    // Edit for Company data
    public static ResultSet editCompany(String id) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from admincompany where cId='" + id + "'");
        return rs;
    }

    // Update for Company data
    public static String updateCompany(String id, String department, String category, String companyName) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Update admincompany Set department='" + department + "',category='" + category + "',companyName='" + companyName + "' where cId='" + id + "'");
        if (sql > 0) {
            return "<script>alert('Successfully Update your Data..')</script>";
        } else {
            return "<script>alert('Something wrong...')</script>";
        }
    }

    // Delete for data
    public static String deleteCompany(String idDelete) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Delete from admincompany where cId='" + idDelete + "'");
        return "<script>alert('Successfully Delete Your Data...')</script>";
    }

    // Product insert data
    public static String productInsert(String department, String category, String company, String name, String size, String oldprize, String newprize, String color, String qty, String description, String img) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Insert into adminproduct VALUES(NULL,'" + department + "','" + category + "','" + company + "','" + name + "','" + size + "','" + oldprize + "','" + newprize + "','" + color + "','" + qty + "','" + description + "','" + img + "',curdate())");
        if (sql > 0) {
            return "<script>alert('Successfully store your data..')</script>";
        } else {
            return "<script>alert('Something wrong..')</script>";
        }
    }

    // Product data
    public static ResultSet productData() throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from adminproduct");
        return rs;
    }

    // Sub Product category data
    public static ResultSet subProductCategory(String cate) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from adminproduct where pCategory='" + cate + "'");
        return rs;
    }

    // Product details data
    public static ResultSet productDetails(String id) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from adminproduct where pId='" + id + "'");
        return rs;
    }

    // Edit for product data
    public static ResultSet editProduct(String id) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from adminproduct where pId='" + id + "'");
        return rs;
    }

    // Update for product data
    public static String updateProduct(String id, String department, String category, String company, String name, String size, String oldprize, String newprize, String color, String qty, String description, String img) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Update adminproduct Set pDepart='" + department + "',pCategory='" + category + "',pCompany='" + company + "',pName='" + name + "',pSize='" + size + "',pOldprize='" + oldprize + "',pNewprize='" + newprize + "',pColor='" + color + "',pQty='" + qty + "',pDescription='" + description + "',pImg='" + img + "' where pId='" + id + "'");
        if (sql > 0) {
            return "<script>alert('Successfully Update your Data..')</script>";
        } else {
            return "<script>alert('Something wrong...')</script>";
        }
    }

    // Delete for product data
    public static String deleteProduct(String idDelete) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Delete from adminproduct where pId='" + idDelete + "'");
        return "<script>alert('Successfully Delete Your Data...')</script>";
    }

    // Add to cart insert data
    public static String cartInsert(int uniqId, String id, String qty) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Insert into cartform VALUES(NULL," + uniqId + ",'" + id + "','" + qty + "',curdate())");
        if (sql > 0) {
            return "<script>alert('Successfully store your data..')</script>";
        } else {
            return "<script>alert('Something wrong..')</script>";
        }
    }

    // Add to cart data
    public static ResultSet cartData() throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from cartform");
        return rs;
    }

    // Update cart data
    public static String updateCart(String id, String qty) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Update cartform Set qty='" + qty + "' where cartId='" + id + "'");
        if (sql > 0) {
            return "Successfully Update your Quntity";
        } else {
            return "Something wrong..";
        }
    }

    // Delete cart data
    public static String deleteCart(String idDelete) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Delete from cartform where cartId IN (" + idDelete + ")");
        return "<script>alert('Successfully Delete Your Data...')</script>";
    }

    // Delete cart data for unique id
    public static String deleteCartUnique(String uniqId)throws Exception{
        Connection con =mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Delete from cartform where uniqueId='"+uniqId+"'");
        return "<script>alert('Successfully Delete Your Data...')</script>";
    }
    
    // Join inner table query for cart form
    public static ResultSet innerJoinCartToProductData(String uniqId) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from adminproduct INNER JOIN cartform ON adminproduct.pId=cartform.pId where uniqueId='" + uniqId + "'");
        return rs;
    }

    // shipping form insert data
    public static String shippingInsert(String name, int rId, String address, String mobileNo, String city, String state, String code) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Insert into shipping_master VALUES(NULL," + rId + ",'" + name + "','" + address + "','" + mobileNo + "','" + city + "','" + state + "','" + code + "',curdate())");
        if (sql > 0) {
            String mid = "";
            String query = "Select MAX(sId) as mId from shipping_master Where rId=" + rId;
            ResultSet rs = st.executeQuery(query);
            if (rs.next()) {
                mid = rs.getString("mId");

                //return "<script>alert('Successfully store your data..')</script>";
            }
            return "Successfully store your data," + mid;
        } else {
            return "Something wrong, 0";
        }
    }

    // shipping from data
    public static ResultSet shippingData() throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from shipping_master");
        return rs;
    }
    
    // order / invoice insert data
    public static String orderInsert(int rId, String id, String orderNo, String tQty, String tAmount, String sCharge, String tDiscount, String netAmount, String oStatus, String pStatus, String pType) throws Exception{
        Connection con = mycon();
        Statement st = con.createStatement();
        int sql = st.executeUpdate("Insert into order_master VALUES(NULL,'"+rId+"','"+id+"','"+orderNo+"','"+tQty+"','"+tAmount+"','"+sCharge+"','"+tDiscount+"','"+netAmount+"','"+oStatus+"','"+pStatus+"','"+pType+"',curdate())");
        if (sql>0) {
            return "<script>alert('Successfully store your data..')</script>";
        } else {
            return "<script>alert('Something wrong..')</script>";
        }
    }
    
    // order / invoice Data for get Max id
    public static String orderDataMaxId()throws  Exception{
        Connection con=mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select MAX(oId) as orderId from order_master");
        String maxId="";
        if (rs.next()) {
             maxId = rs.getString("orderId");
        }
        return maxId;
    }
    
     // Join inner table query for invoiceDetails form
    public static ResultSet innerJoinOrderDetailsToProductData(String oId) throws Exception {
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM orderdetails_master as odm INNER JOIN order_master as om ON odm.oId = om.oId INNER JOIN adminproduct as ap ON odm.pId = ap.pId Where om.oId ='" + oId + "'");
        return rs;
    }
    
    // order / invoice Data
    public static ResultSet orderData() throws Exception{
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from order_master");
        return rs;
    }
    
    // Serch date for order / invoice Data
    public static ResultSet SearchDate_orderData(String date1, String date2)throws Exception{
        Connection con = mycon();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("Select * from order_master where oDate between '"+date1+"' and '"+date2+"'");
        return rs;
    }
    
    // order Details / invoice insert data
    public static String orderDetailsInsert(String oId,String pId,String pPrize,String oQty,String pAmount)throws Exception{
        Connection con =mycon();
        Statement st = con.createStatement();
        int sql=st.executeUpdate("Insert into orderdetails_master VALUES(NULL,'"+oId+"','"+pId+"','"+pPrize+"','"+oQty+"','"+pAmount+"',curdate())");
        if (sql>0) {
            return "<script>alert('Successfully store your data..')</script>";
        } else {
            return "<script>alert('Something wrong..')</script>";        
        }
    }
}
