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
  color: white;
  padding: 8px 16px;
  text-decoration: none;
}

/* Change the link color on hover */
li a:hover {
  background-color: white;
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
			<li><a href="news.jsp">News(<%
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
%>)(</a></li>
             <!--
				 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Servies<span class="caret"></span></a>
<ul class="dropdown-menu" style="background-color: gray;">
                            <li><a href="#"><span style="color: black; font-size: 20px;">Training</span></a></li>
                            <li><a href="#"><span style="color: black; font-size: 20px;">Education</span></a></li>
                            <li><a href="#"><span style="color: black; font-size: 20px;">Clinic</span></a></li>
                            </ul>
             class="active"
 </li>-->
			 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">About<span class="caret"></span></a>

    <ul class="dropbtn" style="background-color: gray;">
    <div class="dropdown-content">
                            <li><a href="aboutdeveloper.jsp"><span style="color: black; font-size: 20px;">Developer</span></a></li>
                            <li><a href="aboutorganization.jsp"><span style="color: black; font-size: 20px;">Organization</span></a></li>
    </div>
</ul>
</li>
<li><a href="contact.jsp">Contact</a></li>
<li><a href="help.jsp">Help</a></li>
</ul>

	</div>

</nav>
<div class="jumbotron" style="margin-top: 5px; box-shadow: 0px 0px 30px 0px white;">
<table class="table table-bordered ">
    <tr><td colspan="3" style="text-align: center; font-family: Comic sans Ms; background-color: #708090; color: white; border-radius: 10px; font-size: 20px; ">welcome to prison information managment system</td></tr>
    <tr style="text-align: center;"><td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;">do you know about BG</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;">Benishangul-gumuz Region(BG) prison comission</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;"></td></tr>
        <tr><td class="text-justify" style="font-size: 14px; width: 300px;">  Benishangul-Gumuz (Amharic: ቤንሻንጉል ጉሙዝ), also known as Benshangul/Gumuz, is one of the nine ethnic divisions (kililoch) of Ethiopia. It was previously known as Region 6.The region's capital is Assosa<br>
     <script type="text/javascript">
      $(document).ready(function(){
    $("#btnt").click(function(){
        $("#demo").toggle(1000);
        $("#demo1").hide(1000);
         $("#demo2").hide(1000);
          $("#demo3").hide(1000);
    });
});
  $(document).ready(function(){
    $("#btn1").click(function(){
        $("#demo1").toggle(1000);
        $("#demo").hide(1000);
         $("#demo2").hide(1000);
          $("#demo3").hide(1000);
    });
});
  $(document).ready(function(){
    $("#btn2").click(function(){
        $("#demo2").toggle(1000);
        $("#demo").hide(1000);
         $("#demo1").hide(1000);
          $("#demo3").hide(1000);
    });
});
  $(document).ready(function(){
    $("#btn3").click(function(){
        $("#demo3").toggle(1000);
        $("#demo2").hide(1000);
         $("#demo1").hide(1000);
          $("#demo").hide(1000);
    });
});


    </script>
 <div style="width: 450px; height: 200px;">               
<p id="btnt" class="glyphicon glyphicon-play" style="">  
    how to view cafteria schedule <br>
</p>
<div id="demo" class="collapse out" ><p style="color:blueviolet" class="glyphicon glyphicon-hand-right">&nbsp;find the cafteria schedule in the task bar </p><br>
<p style="color:blueviolet"  class="glyphicon glyphicon-hand-right">&nbsp;Press on cafteria schedule links</p><br>
  <br>
</div>

 <p id="btn1" class="glyphicon glyphicon-play" style="">
     how to login <br>
</p>
<div id="demo1" class="collapse out" ><p style="color:blueviolet" class="glyphicon glyphicon-hand-right">&nbsp;open the sytem first</p><br>
<p style="color:blueviolet"  class="glyphicon glyphicon-hand-right">&nbsp;fill the user name and password correctly</p>
<br>
<p style="color:blueviolet"  class="glyphicon glyphicon-hand-right">&nbsp;press login button</p>
<br>
</div>

  <p id="btn2" class="glyphicon glyphicon-play">
      how to View about organization<br>
</p> 
<div id="demo2" class="collapse out" ><p style="color:blueviolet"  class="glyphicon glyphicon-hand-right">&nbsp;press on about organization on task bar</p><br>
<p  style="color:blueviolet" class="glyphicon glyphicon-hand-right">&nbsp;read the about organization  e</p><br>
  <br>
</div>
<p id="btn3" class="glyphicon glyphicon-play">
how to get contacts<br>
</p>
<div id="demo3" class="collapse out" ><p style="color:blueviolet"  class="glyphicon glyphicon-hand-right">&nbsp;press on contact</p><br>
<p style="color:blueviolet" class="glyphicon glyphicon-hand-right">you can get the contact </p><br>
  <br>
  
</div>

    
    
            </td> <td style="width: 300px;" class="text-justify"><img src="pris2.jpg" width="100%">benshangul-gumuz region prison office is located in assosa city. It gives services for civil prisoners of the region. the organization uses manual file system managment, we prefer to change this application to online based system inorder to make easy file managment</td> 

            <td class="text-justify">
         <table class="table table-condensed table-bordered">
 
    </div>

        </td>


    </tr>
</table>
            </td></tr>
            <tr><td style="text-align: center; font-size: 20px; background-color: #556B2F; color: white;" >Mission</td> <td style="text-align: center;font-size: 20px;background-color: #556B2F;color: white;">Vission</td> <td style="text-align: center;font-size: 20px; background-color: #556B2F; color: white;">calender</td></tr>
            <tr><td class="text-justify">Benishangul-gumuz Region prison is with participation of the people and developing highly secured information system center in order to prevent crime. Shape the prisoner to have good social interaction with people and to make the prisoner creative and fighting against crime as other good citizen do</td> <td class="text-justify">
                <ul class="text-justify">
                <li>Benishangul-gumuz Region prison has the vision of creating citizen who are patriotic, fight against crime and reduce crime.     </li>
                <li>To build where the rule of law approved.</li>
                   <li>To give guaranteed human right.</li>
                       <li>To provided quick service.</li>
            </ul></td> <td><script src="decoration/calander.js" type="text/javascript" language="javascript"></script></td></tr>

</table>
<div style="background-color: #E6E6FA;border-radius: 5px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 20px;">Copyright © is reserved by GROUP 1 in 2023</font></center></div>

</div>
</div>
</body>
</html>

