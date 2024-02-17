
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
 if(request.getParameter("update")!=null){
String username = request.getParameter("username");
String current = request.getParameter("cpassword");
String ne = request.getParameter("npassword");
String copassword = request.getParameter("copassword");

if (ne.equals(copassword)) {
   
    try {
        Class.forName("com.mysql.jdbc.Driver");
       con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
        stmt = con.createStatement();
        String sql = "SELECT * FROM account WHERE username='" + username + "' AND password='" + current + "'";
        rs = stmt.executeQuery(sql);
        if (rs.next()) {
          String sql1 = "UPDATE account SET password='" + ne + "' WHERE username='" + username + "'";
            int query = stmt.executeUpdate(sql1);
            if (query > 0) {
                out.println("<script>alert('password is updated successfully')</script>");
            } else {
                out.println("<script>alert('not updated please try again!!')</script>");
            }
        } else {
            out.println("<script>alert('username or password is not correct please enter correct password and username!!')</script>");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
} else {
    out.println("<script>alert('coniformation password is incorrect!')</script>");
}
 }
%>
<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="margin-right: 15px;">change password</button>
    
</ul>
    </div>
 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-center" style="font-family: comic sans ms; color:red;">change password </h4>
        </div>
        <div class="modal-body">
       <form action="" method="post">  
            <table class="table table-bordered"><tr><td style="font-family: comic sans ms; font-size: 25px;">username</td> <td><input type="text" name="username" class="form-control" style="border:2px solid green"></td></tr>

<tr><td style="font-family: comic sans ms; font-size: 25px;">password</td> <td><input type="password" name="cpassword"  required="" id="Pass" class="form-control" style="border:2px solid green"></td></tr>
<tr><td style="font-family: comic sans ms; font-size: 25px;">new password</td> <td><input type="password" name="npassword"   required="" id="Pass" class="form-control" style="border:2px solid green"></td></tr>
<tr><td style="font-family: comic sans ms; font-size: 25px;">confirm password</td> <td><input type="password" name="copassword"   required="" id="Pass" class="form-control" style="border:2px solid green"></td></tr>

<tr><td colspan="2"><input type="submit" name="update" class="btn btn-info form-control"  value="change password" style="font-size: 30px; height: 45px;"></td></tr>

          </table>
      </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>
</nav>
<html>
<head>
	<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="decoration/css/bootstrap.min.css">

        <script src="decoration/js/jquery.min.js"></script>
        <script src="decoration/js/bootstrap.min.js"></script>
        <style type="text/css">
        	
body{
	font-family: Times News Roman;
         padding:20px;
}
form{
    width:500px;
    margin: auto;
    padding: 20px;
    background:#E6E6FA;
    font-size: 16px;
}

ul li a{
	font-size: 25px;


}

 </style>

 <!DOCTYPE html>
 <!--
 <html>
 <head>
 	<title></title>
 </head>
 <body>
      
 <form action="" method="post">
user name<br> <input type="text" name="username"   required="" id="Pass" placeholder="Enter username..."><br><br>
current password<br><input type="password" name="cpassword"  required="" id="Pass" placeholder="Enter current password..."><br><br>
new password<br><input type="password" name="npassword"   required="" id="Pass" placeholder="Enter new password..."><br><br>
confirm password<br><input type="password" name="copassword"   required="" id="Pass" placeholder="Enter confirm password..."><br><br>
  
    
    <input type="submit" name="update" value="confirm">
  
 </form>
 
 </body>
 </html>
