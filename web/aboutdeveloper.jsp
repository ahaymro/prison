
<%@page import="java.util.Locale"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.servlet.http.*" %>

<% 
    request.getSession().setAttribute("javax.servlet.jsp.jstl.fmt.locale", Locale.ENGLISH);
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

.dropdown-content a:hover {background-color: teal;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: teal;}
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
%>)</a></li>
             <!--
                 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Servies<span class="caret"></span></a>
<ul class="dropdown-menu" style="background-color: gray;">
                            <li><a href="#"><span style="color: black; font-size: 20px;">Training</span></a></li>
                            <li><a href="#"><span style="color: black; font-size: 20px;">Education</span></a></li>
                            <li><a href="#"><span style="color: black; font-size: 20px;">Clinic</span></a></li>
                            </ul>
 </li>-->
             <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">About<span class="caret"></span></a>
<ul class="dropbtn" style="background-color: gray;">
    <div class="dropdown-content">
                            <li class="active"><a href="aboutdeveloper.jsp"><span style="color: black; font-size: 20px;">Developer</span></a></li>
                            <li><a href="aboutorganization.jsp"><span style="color: black; font-size: 20px;">Organization</span></a></li>
    </div>
</ul>
</li>
<li><a href="contact.jsp">Contact</a></li>
</ul>
<ul class="nav navbar-nav navbar-right">
 <li>
                           <!-- login modal form-->
                          
                       <!-- Modal -->
                                
                    </li>


                </ul>
                <!--modal for login-->
                <ul class="nav navbar-nav navbar-right">
              
<!--modal for login-->
</nav>
<div class="jumbotron" style="margin-top: 5px; box-shadow: 0px 0px 30px 0px white;">
<table class="table table-bordered ">
    <tr><td colspan="3" style="text-align: center; font-family: Comic sans Ms; background-color: #708090; color: white; border-radius: 10px; font-size: 20px; ">welcome to about page</td></tr>
    <tr style="text-align: center;"><td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;">do you know about BG</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;" colspan="2">Developer information</td>
        </tr>
        <tr><td class="text-justify" style="font-size: 14px; width: 300px;">  Benishangul-Gumuz (Amharic:), also known as Benshangul/Gumuz, is one of the nine ethnic divisions (kililoch) of Ethiopia. It was previously known as Region 6.The region's capital is Assosa<br>
            <img src="assosa 1.jpg" width="100%"></td> 

            <td style="width: 300px;" class="text-justify" colspan="2">
               <table class="table table-bordered">
                   <tr><td>Developer Name</td> <td>Department</td> <td>Developed place</td></tr>
                   <tr><td>Biks Sisay</td> <td rowspan="5" style="text-align: center;margin-top: 30px;"><br>infomation science</td> <td rowspan="5" style="text-align: center;"> <br>Assosa University</td></tr>
<tr><td> haymro animaw </td></tr>
<tr><td>belaynesh adugna</td></tr>
<tr><td>husen abdu</td></tr>
<tr><td>yeshwork semegn</td></tr>
               </table>
            </td> 

           </tr>
            <tr><td style="text-align: center; font-size: 20px; background-color: LightSteelBlue; color: black;" >Mission</td> <td style="text-align: center;font-size: 20px;background-color: LightSteelBlue;color: black;">Vission</td> <td style="text-align: center;font-size: 20px; background-color: LightSteelBlue; color: black;">calender</td></tr>
            <tr><td class="text-justify">Benishangul-gumuz Region prison is with participation of the people and developing highly secured information system center in order to prevent crime. Shape the prisoner to have good social interaction with people and to make the prisoner creative and fighting against crime as other good citizen do</td> <td class="text-justify"  style="width: 300px;">
                <ul class="text-justify">
                <li>Benishangul-gumuz Region prison has the vision of creating citizen who are patriotic, fight against crime and reduce crime.     </li>
                <li>To build where the rule of law approved.</li>
                   <li>To give guaranteed human right.</li>
                       <li>To provided quick service.</li>
            </ul></td> <td><script src="decoration/calander.js" type="text/javascript" language="javascript"></script></td></tr>

</table>
<div style="background-color: #E6E6FA;border-radius: 5px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 20px;">Copyright © is reserved by group(1) in 2023</font></center></div>

</div>
</div>
</body>
</html>