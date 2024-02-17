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

.dropdown-content a:hover {background-color: #ddd;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
</head>
<body>
    <jsp:include page="language.jsp" />
</body>
</html>
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

    <div class="container" style="background-color: LightSteelBlue; border-radius: 10px; box-shadow: 0px 0px 10px blue;">
    <img src="logo2.png" style="width: 100%; height: 150px ; box-shadow: 0px 0px 10px 0px green; border-radius: 10px; margin-top: 3px;">
    <nav>

    <div class="navbar navbar-inverse" style="margin-top: 7px;">
        
        <ul class="nav navbar-nav">
            <li><a href="index.jsp">Home</a></li>
                        <li><a href="cafteria_schedule.jsp">Cafteria Schedule</a></li>
    
                          
 </li>

              <li><a href="aboutorganization.jsp">About us</a></li>
<li ><a href="contact.jsp">Contact us</a></li>
</ul>
<ul class="nav navbar-nav navbar-right">
  
</ul>
    </div>
 <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title text-center" style="font-family: comic sans ms; color:red;">LOGIN PAGE </h4>
        </div>
        <div class="modal-body">
       <form action="" method="post">  
            <table class="table table-bordered"><tr><td style="font-family: comic sans ms; font-size: 25px;">username</td> <td><input type="text" name="username" class="form-control" style="border:2px solid green"></td></tr>

<tr><td style="font-family: comic sans ms; font-size: 25px;">password</td> <td><input type="password" name="password" class="form-control" style="border:2px solid green"></td></tr>
<tr><td colspan="2"><input type="submit" name="login" class="btn btn-info form-control"  value="login" style="font-size: 30px; height: 45px;"></td></tr>

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
<div class="jumbotron" style="margin-top: 5px; box-shadow: 0px 0px 30px 0px white;">
<table class="table table-bordered ">
    <tr><td colspan="9" style="text-align: center; font-family: Comic sans Ms; background-color: #708090; color: white; border-radius: 10px; font-size: 20px; ">welcome to contact page</td></tr>
    <tr style="text-align: center;"><td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;"></td>
    <td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;">do you know about BG</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;" colspan="7">contact with some website</td>
        </tr>
        <tr>
          
          <td style="font-size: 14px; width: 40px;background-color:lightcyan"><ul>
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
    <a href="https://www.email.com"><img src="email.jpg" alt=""width="35%" height="29%"></a><br>&nbsp;&nbsp;<br>
    <a href="https://www.facebook.com"><img src="fb.png" alt="" width="34%" height="25%"/></a> <br>&nbsp;&nbsp;<br>
    <a href="https://www.yahoo.com"><img src="yahoo.png" alt=""width="34%" height="35%"/></a><br>&nbsp;&nbsp;<br>
  </td>  
    
  <td colspan="6" class="text-justify" style="font-size: 14px; width: 300px;">  Benishangul-Gumuz (Amharic:), also known as Benshangul/Gumuz, is one of the nine ethnic divisions (kililoch) of Ethiopia. It was previously known as Region 6.The region's capital is Assosa<br>
            <img src="assosa 1.jpg" width="100%"></td> 

            <td style="width: 300px;" class="text-justify" colspan="2">
       <table class="table table-bordered table-condensed"><tr><td><a href="https://www.facebook.com"><span style="color: black; font-size: 20px;"></span><img src="fb.png" width="50px;"></td><td><center><font><br><br>group1facebook.com</font></center></td></tr>
<tr><td><a href="http://www.gmail.com"><span style="color: black; font-size: 20px;"></span><img src="email.jpg" width="50px;"></td> <td><br><br>group1email@gmail.com</td></tr>
<tr><td><img src="phone.png" width="50px;"></td> <td><br><br>+251962739152</td></tr>
       </table>


            </td> 

           </tr>
           <tr><td style="text-align: center; font-size: 20px; background-color: LightSteelBlue; color: black;" >Mission</td> <td colspan="4" style="text-align: center;font-size: 20px;background-color: LightSteelBlue;color: black;">Vission</td> <td colspan="3"style="text-align: center;font-size: 20px; background-color: LightSteelBlue; color: black;">calender</td></tr>
           <tr><td class="text-justify">Benishangul-gumuz Region prison is with participation of the people and developing highly secured information system center in order to prevent crime. Shape the prisoner to have good social interaction with people and to make the prisoner creative and fighting against crime as other good citizen do</td> <td class="text-justify" style="width: 520px;">
                <ul class="text-justify">
                <li>Benishangul-gumuz Region prison has the vision of creating citizen who are patriotic, fight against crime and reduce crime.</li>
                <li>To build where the rule of law approved.</li>
                   <li>To give guaranteed human right.</li>
                       <li>To provided quick service.</li>
                      
                </ul> <td colspan="7" >
                <script src="decoration/calander.js" type="text/javascript" language="javascript"></script></td>
           </tr>

</table>
<div style="background-color: #E6E6FA;border-radius: 5px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 20px;">Copyright © is reserved by group(1) in 2023</font></center></div>

</div>
</div>
</body>
</html>