<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%
    
 
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
     Statement st = null;
      ResultSet rs = null;
      PreparedStatement pstmt=null;
       int report=0;
       int total=0;
HttpSession sessio = request.getSession();
sessio.setMaxInactiveInterval(300); // Time in Seconds
if (sessio.getAttribute("username") ==null && sessio.getAttribute("admin_logged") == null) {
       response.sendRedirect("../login.jsp");
} else {
   
    if ((System.currentTimeMillis() - sessio.getLastAccessedTime()) > 300 * 1000) {
        response.sendRedirect("logout.jsp");
    } else {
        sessio.setAttribute("lastAccessTime", System.currentTimeMillis());
        
    }
}
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
</head>
<body>
     <jsp:include page="../language.jsp" />
</body>
</html>
<html>
<head>
	<meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="../decoration/css/bootstrap.min.css">

        <script src="../decoration/js/jquery.min.js"></script>
        <script src="../decoration/js/bootstrap.min.js"></script>
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
	<img src="../logo2.png" style="width: 100%; height: 150px ; box-shadow: 0px 0px 10px 0px green; border-radius: 10px; margin-top: 3px;">
	<nav>

	<div class="navbar navbar-inverse" style="margin-top: 7px;">
		
		<ul class="nav navbar-nav">
			<li><a href="index.jsp">Home</a></li>
		<li><a href="sendmessage.jsp">send message</a></li>
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> Inbox message(<%

  st=con.createStatement();
  String sql="select count(id) as total  from admin_message where status=0";
 rs=st.executeQuery(sql);

  while(rs.next()) {
    report++;
    total = rs.getInt("total");
  }
  if (report > 0) {
    out.println("<font style='color:red;'>"+total+"</font>");
  }
  else {
    out.println("<font style='color:red;'>0</font>");
  }
%>)<span class="caret"></span></a>
<ul class="dropbtn" style="background-color: gray;">
    <div class="dropdown-content">
			<li><a href="inbox1.jsp"><span style="color: black; font-size: 20px;">new message(<%
 
  st=con.createStatement();
  String sql1="select count(id) as total  from admin_message where status=0";
 rs=st.executeQuery(sql1);

  while(rs.next()) {
    report++;
    total = rs.getInt("total");
  }
  if (report > 0) {
    out.println("<font style='color:red;'>"+total+"</font>");
  }
  else {
    out.println("<font style='color:red;'>0</font>");
  }
%>)</span></a></li>
                        <li><a href="inbox.jsp"><span style="color: black; font-size: 20px;">old message</span></a></li>
    </div>
</ul>
	<li><a href="view_report.jsp">View report</a></li>

         <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">report generate<span class="caret"></span></a>
<ul class="dropbtn" style="background-color: gray;">
    <div class="dropdown-content">
        <li><a href="reportgerenate.jsp"><span style="color: black; font-size: 20px;">today report</span></a></li>
        <li><a href="reportgeneration.jsp"><span style="color: black; font-size: 20px;">general report</span></a></li>
                           
    </div>
</ul>
</li>       
			 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Manage Account<span class="caret"></span></a>
<ul class="dropbtn" style="background-color: gray;">
    <div class="dropdown-content">
                            <li><a href="create.jsp"><span style="color: black; font-size: 20px;">create account</span></a></li>
                            <li><a href="delete.jsp"><span style="color: black; font-size: 20px;">delete account</span></a></li>
                            <li><a href="update.jsp"><span style="color: black; font-size: 20px;">update account</span></a></li>
                            <li><a href="activate.jsp"><span style="color: black; font-size: 20px;">activate account</span></a></li>
                            <li><a href="deactivate.jsp"><span style="color: black; font-size: 20px;">deactivate account</span></a></li>
    <li> <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal" style="margin-right: 15px;">change password</button></a>
                             </li>
    </div>
</ul>
</li>

</ul>
<ul class="nav navbar-nav navbar-right">
 <li>
                           <!-- login modal form-->
                           <a href="logout.jsp"> <button type="button" class="btn btn-success" style=" margin-top: -5px; width: 80px;">logout</button></a>
                       <!-- Modal -->
                                

                    </li>


                </ul>
	</div>

</nav>
<div class="jumbotron" style="margin-top: 5px; box-shadow: 0px 0px 30px 0px white;">
<table class="table table-bordered ">
  <tr>

    <td colspan="4" style="text-align: center; font-family: Comic sans Ms; background-color: #708090; color: white; border-radius: 10px; font-size: 20px; ">welcome to adminstrator page</td></tr>
    <tr style="text-align: center;">
        <td colspan="3" style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;" >view report prisoner information</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;"></td></tr>
        <tr><td style="width: 300px;" class="text-justify" rowspan="1">
        <table class="table table-bordered"><tr><th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">ASSOSA ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total female Prisoner Register Today</td><td><%

st = con.createStatement();
String sql2 = "select count(ssn) as total from prisoner_information where zone='assosa' and sex='female' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql2);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%>    </td></tr>
                 <tr><td style="font-family: comic sans ms;">Total male Prisoner Register Today</td><td><%

st = con.createStatement();
String sql3 = "select count(ssn) as total from prisoner_information where zone='assosa' and sex='male' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql3);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%>        </td></tr>


<th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">METEKEL ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total female Prisoner Register Today</td><td><%

st = con.createStatement();
String sql5 = "select count(ssn) as total from prisoner_information where zone='metekel'and sex='female' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql5);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                 <tr><td style="font-family: comic sans ms;">Total male Prisoner Register Today </td><td>
                         <%

st = con.createStatement();
String sql4 = "select count(ssn) as total from prisoner_information where zone='metekel'and sex='male' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql4);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%>   </td></tr>


                 <th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">KAMATCH ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total female Prisoner Register Today</td><td><%


st = con.createStatement();
String sql7 = "select count(ssn) as total from prisoner_information where zone='kamatch' and sex='female' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql7);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                 <tr><td style="font-family: comic sans ms;">Total male Prisoner register today</td><td><%

st = con.createStatement();
String sql6 = "select count(ssn) as total from prisoner_information where zone='kamatch' and sex='male' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql6);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%> </td></tr>

                 <th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">all ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total female Prisoner Register Today</td><td><%


st = con.createStatement();
String sql8 = "select count(ssn) as total from prisoner_information where sex='female' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql8);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                 <tr><td style="font-family: comic sans ms;">Total male Prisoner register today</td><td><%

st = con.createStatement();
String sql9 = "select count(ssn) as total from prisoner_information where sex='male' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql4);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
        

</tr></table>

</td>
     
            <td style="width: 300px;" class="text-justify" rowspan="2">
              <table class="table table-bordered"><tr><th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">ASSOSA ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total Prisoner Register Today</td><td><%

st = con.createStatement();
String sql10 = "select count(ssn) as total from prisoner_information where zone='asossa' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql10);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
<tr><td style="font-family: comic sans ms;">Total Prisoner</td><td><%

 con =DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");

 st = con.createStatement();
 String sql17 = "select count(ssn) as total from prisoner_information where zone='assosa'";
 rs = st.executeQuery(sql17);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%>       </td></tr>

<th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">METEKEL ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total Prisoner Register Today</td><td><%


st = con.createStatement();
String sql11 = "select count(ssn) as total from prisoner_information where zone='metekel' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql11);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
<tr><td style="font-family: comic sans ms;">Total Prisoner</td><td><%



 st = con.createStatement();
 String sql18 = "select count(ssn) as total from prisoner_information where zone='metekel'";
 rs = st.executeQuery(sql18);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%>    </td></tr>

                 <th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">KAMATCH ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total Prisoner Register Today</td><td><%

st = con.createStatement();
String sql12 = "select count(ssn) as total from prisoner_information where zone='kamatch' and tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql2);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                 <tr><td style="font-family: comic sans ms;">Total Prisoner</td><td><%

st = con.createStatement();
String sql19 = "select count(ssn) as total from prisoner_information where zone='kamatch'";
rs = st.executeQuery(sql19);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>

                 <th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">all ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total Prisoner Register Today</td><td><%

st = con.createStatement();
String sql13 = "select count(ssn) as total from prisoner_information where tsp='" + new java.util.Date().getTime() + "'";
rs = st.executeQuery(sql3);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                 <tr><td style="font-family: comic sans ms;">Total Prisoner</td><td><%

st = con.createStatement();
String sql20 = "select count(ssn) as total from prisoner_information";
rs = st.executeQuery(sql20);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
        

</tr></table>

</td>
     
            <td style="width: 300px;" class="text-justify" rowspan="2">
              <table class="table table-bordered"><tr><th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">ASSOSA ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total female Prisoner Register </td><td><%


st = con.createStatement();
String sql22 = "select count(ssn) as total from prisoner_information where zone='assosa' and sex='female'";
rs = st.executeQuery(sql22);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                 <tr><td style="font-family: comic sans ms;">Total male Prisoner</td><td><%


st = con.createStatement();
String sql21 = "select count(ssn) as total from prisoner_information where zone='assosa' and sex='male'";
rs = st.executeQuery(sql21);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>


<th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">METEKEL ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total female Prisoner Register </td><td><%


st = con.createStatement();
String sql23 = "select count(ssn) as total from prisoner_information where zone='metekel' and sex='female'";
rs = st.executeQuery(sql23);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></</td></tr>
                 <tr><td style="font-family: comic sans ms;">Total male Prisoner</td><td><%

st = con.createStatement();
String sql25 = "select count(ssn) as total from prisoner_information where zone='metekel' and sex='male'";
rs = st.executeQuery(sql25);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>


                 <th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">KAMATCH ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total female Prisoner Register </td><td><%

st = con.createStatement();
String sql26 = "select count(ssn) as total from prisoner_information where zone='kamatch' and sex='female'";
rs = st.executeQuery(sql26);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                 <tr><td style="font-family: comic sans ms;">Total male Prisoner</td><td><%

st = con.createStatement();
String sql27 = "select count(ssn) as total from prisoner_information where zone='kamatch' and sex='male'";
rs = st.executeQuery(sql27);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>

                 <th class="text-center" style="background-color: lightgray; font-size: 20px; font-family: comic sans ms;" colspan="2">all ZONE</th></tr>
                <tr><td style="font-family: comic sans ms;">Total female Prisoner Register </td><td><%


st = con.createStatement();
String sql28 = "select count(ssn) as total from prisoner_information where sex='female'";
rs = st.executeQuery(sql28);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                 <tr><td style="font-family: comic sans ms;">Total male Prisoner</td><td><%


st = con.createStatement();
String sql29 = "select count(ssn) as total from prisoner_information where sex='male'";
rs = st.executeQuery(sql29);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:30px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
     </tr></table>
            </tr>
            <tr><td rospan="3"></td> </tr>
            <tr>
              <td class="text-justify" >
    <!--help-->
    <div style="width: 350px; height: 200px;">
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
    
       
</table>
<div style="background-color: #E6E6FA;border-radius: 5px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 20px;">Copyright © is reserved by group(1) in 2023</font></center></div>

</div>
</div>
</body>
</html>

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

<tr><td colspan="2"><input type="submit" name="update" class="btn btn-info form-control"  value="change password" style="font-size: 20px; height: 45px;"></td></tr>

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
