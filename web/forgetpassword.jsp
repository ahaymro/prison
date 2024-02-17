
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
     Statement st = null;
      ResultSet rs = null;
      PreparedStatement pstmt=null;
   if(request.getParameter("login")!=null){
    String username = request.getParameter("username");
    String password = request.getParameter("password");
      if (username != null && password != null) {
     
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
            st = con.createStatement();
            String sql = "SELECT * FROM account WHERE username='" + username + "' AND password='" + password + "' AND status='1'";
            rs = st.executeQuery(sql);
            if (rs.next()) {
                
                session.setAttribute("id", rs.getString("id"));
                session.setAttribute("ssn", rs.getString("ssn"));
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("password", rs.getString("password"));
                session.setAttribute("zone", rs.getString("zone"));
                String user_type = rs.getString("account_type");
                if (user_type.equals("prisoner")) {
                    response.sendRedirect("prisoner/index.jsp");
                } else if (user_type.equals("adminstrator")) {
                    response.sendRedirect("admin/index.jsp");
                } else if (user_type.equals("inspector")) {
                    response.sendRedirect("inspector/index.jsp");
                } else if (user_type.equals("policeofficer")) {
                    response.sendRedirect("policeofficer/index.jsp");
                } else if (user_type.equals("visitor")) {
                    response.sendRedirect("visitor/index.jsp");
                } else if (user_type.equals("comissioner")) {
                    response.sendRedirect("comissioner/index.jsp");
                } else {
                out.println("<div style='position:absolute; top:360px; left:790px;'><font style='margin-left:30px; font-family:times new roman; font-size:19px; color:red;'>Incorrect user type </font></div>");
                }
            } else {
                out.println("<div style='position:absolute; top:360px; left:790px;'><font style='margin-left:30px; font-family:times new roman; font-size:19px; color:red;'>Incorrect username or password</font></div>");
            }
        } catch (SQLException e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } catch (ClassNotFoundException e) {
            out.println("<p>Error: " + e.getMessage() + "</p>");
        } 
      }
   }       
               %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.dropdown {
  position: relative;
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #c0c0c0;
  min-width: 210px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color:#8FBC8F;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
</head>
<body>
    <jsp:include page="language.jsp" />
</body>
</html>
<style>
li a {
  display: block;
  color: black;
  padding: 8px 16px;
  text-decoration: none;
}

/* Change the link color on hover */
li a:hover {
  background-color: darkgreen;
  color: red ;
}
</style>
<script>
function show_password() {
    var x = document.getElementById("Pass");
    if (x.type === "password") {
        x.type = "text";
    }
    else {
        x.type = "password";
    }
}

 </script>
<!DOCTYPE html>
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

ul li a{
	font-size: 25px;


}

 </style>
     
	<title>prisoner managment system</title>
</head>
<body>

	<div class="container" style="background-color:LightSteelBlue; border-radius: 10px; box-shadow: 0px 0px 10px blue;">
	<img src="logo2.png" style="width: 100%; height: 150px ; box-shadow: 0px 0px 10px 0px green; border-radius: 10px; margin-top: 3px;">
	<nav>

	<div class="navbar navbar-inverse" style="margin-top: 7px;">
		
		<ul class="nav navbar-nav">
			<li><a href="index.jsp">Home</a></li>
                        <li><a href="cafteria_schedule.jsp">Cafteria Schedule</a></li>
    
                          
 </li>

             <!--

 </li>-->
 <li><a href="aboutorganization.jsp">About us</a></li>
   


<li><a href="contact.jsp">Contact</a></li>

</ul>


	</div>

</nav>
<div class="jumbotron" style="margin-top: 5px; box-shadow: 0px 0px 30px 0px white;">
<table class="table table-bordered ">
	<tr><td colspan="3" style="text-align: center; font-family: Comic sans Ms; background-color: #708090   ; color: white; border-radius: 10px; font-size: 20px; ">welcome to prison information managment system</td></tr>
      
        <%


PreparedStatement ps = null;


if (request.getParameter("forget") != null) {
  String username = request.getParameter("username");
  String secured = request.getParameter("serial_no");

  try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
    String sql = "SELECT * FROM account WHERE username=? AND ssn=?";
    ps = con.prepareStatement(sql);
    ps.setString(1, username);
    ps.setString(2, secured);
    rs = ps.executeQuery();

    if (rs.next()) {
      session.setAttribute("username", rs.getString("username"));
      response.sendRedirect("forget.jsp");
    } else {
      out.println("<script>alert('incorrect username or Id_number')</script>");
    }
  } catch ( SQLException e) {
    e.printStackTrace();
  } finally {
    try {
      if (rs != null) rs.close();
      if (ps != null) ps.close();
      if (con != null) con.close();
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
%>

        <tr>
  <tr><td style="font-size: 14px; width: 40px;background-color:lightcyan"><ul>
                    <li class="dropdown"><a href="How to login in the systemm.pdf">Help</a></li><br>
  <li class="dropdown"><a href="news.jsp">News(<%
try {
    // Connect to the database
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
    String sql = "SELECT COUNT(description) AS news FROM news WHERE date=?";
    PreparedStatement stmt = con.prepareStatement(sql);
    stmt.setDate(1, new java.sql.Date(new java.util.Date().getTime()));
       rs   = stmt.executeQuery();
    int count = 0;
    if (rs.next()) {
        count = rs.getInt("news");
    }
    if (count > 0) {
        out.println("<font style='color:red;'>" + count + "</font>");
    } else {
        out.println("<font style='color:red;'>0</font>");
    }

    // Close the connection
    con.close();
} catch (Exception e) {
    out.println("Error: " + e.getMessage());
}
%>)</a></li><br>
  
                </ul>
    <a href="https://www.email.com"><img src="email.jpg" alt=""width="39%" height="29%"></a><br>&nbsp;&nbsp;<br>
    <a href="https://www.facebook.com"><img src="fb.png" alt="" width="39%" height="25%"/></a> <br>&nbsp;&nbsp;<br>
    <a href="https://www.yahoo.com"><img src="yahoo.png" alt=""width="39%" height="25%"/></a><br>&nbsp;&nbsp;<br>
  </td>          
            
            <td class="text-justify" style="font-size: 14px; width: 300px;"> 
<html lang="en">
<head>
  <title>forget password page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

      <!-- Modal content-->
      <div >
        <div>
  
          <h4 class="modal-title" style="text-align: center;background-color:lightsteelblue; font-family: Comic Sans Ms; font-size: 25px;">forget password</h4>
        </div>
          <form class="card mt-4" action="forgotPassword" method="POST">
					<div class="card-body">
						<div class="form-group">
							<label for="email-for-pass">Enter your email address</label> <input
								class="form-control" type="text" name="email" id="email-for-pass" required=""><small
								class="form-text text-muted">Enter the registered email address . Then we'll
								email a OTP to this address.</small>
						</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-success" type="submit">Get New
							Password</button>
						 <a href="login.jsp"class="btn btn-danger">Back to
							Login</a>
					</div>
      </div>
      
    </div>

  </td> <td style="width: 300px;" class="text-justify"><img src="pris2.jpg" width="100%">benshangul-gumuz region prison office is located in assosa city. It gives services for civil prisoners of the region. the organization uses manual file system managment, we prefer to change this application to online based system inorder to make easy file managment</td> 
</div>

</body>
</html>
            <td class="text-justify">
       
            </td></tr>
            <tr><td style="text-align: center; font-size: 20px; background-color: LightSteelBlue; color: black;" >Mission</td> <td style="text-align: center;font-size: 20px;background-color: LightSteelBlue;color: black;">Vission</td> <td style="text-align: center;font-size: 20px; background-color: LightSteelBlue; color: black;">calender</td></tr>
            <tr><td style="width: 200px;" class="text-justify">Benishangul-gumuz Region prison is with participation of the people and developing highly secured information system center in order to prevent crime. Shape the prisoner to have good social interaction with people and to make the prisoner creative and fighting against crime as other good citizen do</td> <td  class="text-justify">
                <ul class="text-justify">
                <li>Benishangul-gumuz Region prison has the vision of creating citizen who are patriotic, fight against crime and reduce crime.     </li>
                <li>To build where the rule of law approved.</li>
                   <li>To give guaranteed human right.</li>
                       <li>To provided quick service.</li>
            </ul></td> <td><script src="decoration/calander.js" type="text/javascript" language="javascript"></script></td></tr>

</table>
    <div>
        
    </div>
    <div style="background-color: #E6E6FA;border-radius:1300px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 20px;">Copyright © is reserved by BGRS in 2023</font></center></div>

</div>
</div>
</body>
</html>







