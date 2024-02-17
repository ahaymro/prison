
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
 <%@ page import="java.sql.*, java.util.*, java.io.*" %>


<% 
    Connection con = null;
 Statement st=null;
 ResultSet rs=null;
 int report = 0;
 int total = 0;
 Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
  st=con.createStatement();
   HttpSession sessio = request.getSession(true);
sessio.setMaxInactiveInterval(300); // Time in Seconds
if (sessio.getAttribute("pusername") ==null && sessio.getAttribute("policeofficer_logged") == null) {
       response.sendRedirect("../login.jsp");
} else {
   
    if ((System.currentTimeMillis() - sessio.getLastAccessedTime()) > 300 * 1000) {
        response.sendRedirect("logout.jsp");
    } else {
        sessio.setAttribute("lastAccessTime", System.currentTimeMillis());
        
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

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
</head>
<body>
    <jsp:include page="../language.jsp" />
</body>
</html>
<!DOCTYPE html>
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
                        
			<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> Inbox message(<% 
    String sql2="select count(message) as total  from policeofficer_message where status=0";
 rs=st.executeQuery(sql2);

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
    String sql3="select count(message) as total  from policeofficer_message where status=0";
 rs=st.executeQuery(sql3);

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
		<li><a href="sendmessage.jsp">send message</a></li>
            <li><a href="view_visitor.jsp"> visitor appointment</a></li>    
           <li><a href="updatecafteria.jsp">Edit cafe schedule</a></li>  
        <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">More<span class="caret"></span></a>
<ul class="dropbtn" style="background-color: gray;">
    <div class="dropdown-content">
                      
                            <li><a href="giveforgive.jsp"><span style="color: black; font-size: 20px;">request</span></a></li>
                            <li><a href="feedback.jsp"><span style="color: black; font-size: 20px;">feedback</span></a></li>
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

    <td colspan="3" style="text-align: center; font-family: Comic sans Ms; background-color: #708090; color: white; border-radius: 10px; font-size: 20px; ">welcome to adminstrator page</td></tr>
    <tr style="text-align: center;"><td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;">do you know about BG</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;" >UPDATE CAFTERIA SCHEDULE PAGE </td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;"></td></tr>
        <tr><td class="text-justify" style="font-size: 14px; width: 300px;">  Benishangul-Gumuz  also known as Benshangul/Gumuz, is one of the nine ethnic divisions (kililoch) of Ethiopia. It was previously known as Region 6.The region's capital is Assosa<br>
            <img src="../assosa 1.jpg" width="100%"></td> 
            <td style="width: 450px;" class="text-justify" rowspan="3">
            <table class="table table-bordered" style="font-size: 15px; color: black;">
            
              <% 
                
         String orderedtype ="";
        String eating_time = "";
        String monday = "";
        String tusday =  "";
        String wednsday =  "";
        String thursday =  "";
        String friday =  "";
        String saturday =  "";
        String sunday =  "";
                  
      int id_no = Integer.parseInt(request.getParameter("id"));
    String sql1 = "select * from schedule where id='" + id_no + "'";
   rs = st.executeQuery(sql1);
    if(rs.next()){
        report++;
       orderedtype = rs.getString("orderedtype");
        eating_time = rs.getString("eating_time");
        monday = rs.getString("monday");
       tusday = rs.getString("tusday");
        wednsday = rs.getString("wednsday");
        thursday = rs.getString("thursday");
       friday = rs.getString("friday");
        saturday = rs.getString("saturday");
        sunday = rs.getString("sunday");
         }

%>
   <form action="../editcafischdule"method="post"enctype="multipart/form-data">
                <tr>
                    <td>id<span style="color: red;">*</span></td>
                    <td><input type="text" name="id" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= id_no %>"></td>
                </tr>
                <tr>
                    <td>eating time<span style="color: red;">*</span></td>
                    <td><input type="text" name="eating_time" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= eating_time %>"></td>
                </tr>
                <tr>
                    <td>Monday<span style="color: red;">*</span></td>
                    <td><input type="text" name="monday" class="form-control" style="border:1px solid gray;" value="<%= monday %>"></td>
                </tr>
                <tr>
                    <td>tusday<span style="color: red;">*</span></td>
                    <td><input type="text" name="tusday" class="form-control" style="border:1px solid gray;" value="<%= tusday %>"></td>
                </tr>
                <tr>
                    <td>wednsday<span style="color: red;">*</span></td>
                    <td><input type="text" name="wednsday" class="form-control" style="border:1px solid gray;" value="<%= thursday %>"></td>
                </tr>
                <tr><td>thursday<span style='color: red;'>*</span></td><td><input type='text' name='thursday' class='form-control' style='border:1px solid gray;' value="<%= wednsday %>" ></td></tr>

                  <tr><td>friday<span style='color: red;'>*</span></td><td><input type='text' name='friday' class='form-control' style='border:1px solid gray;' value="<%= friday %>"></td></tr>

                    <tr><td>saturday<span style='color: red;'>*</span></td><td><input type='text' name='saturday' class='form-control' style='border:1px solid gray;' value="<%= saturday %>"></td></tr>
                      <tr><td>sunday<span style='color: red;'>*</span></td><td><input type='text' name='sunday' class='form-control' style='border:1px solid gray;' value="<%= sunday %>"></td></tr>   
    <tr><td colspan='2'> <input type='submit' name='update' value='update' class='btn btn-success form-control'></td></tr>
              </form>

           
</table>
            
            </td> 
<td style="font-size: 25px; color: red;"> you are login<br> &nbsp; &nbsp;as <br><br> adminstrator!</td>

            </tr>
            <tr><td style="text-align: center; font-size: 20px; background-color: LightSteelBlue; color: black;" >what can i help you?</td>  <td style="text-align: center;font-size: 20px; background-color: LightSteelBlue; color: black;">calender</td></tr>
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
    
        <p id="btnt" class="glyphicon glyphicon-play" style="">
how to send message
</p>
<div id="demo" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;Enter the message</p>
<p class="glyphicon glyphicon-hand-right">&nbsp;Press on send button</p>
  <br>
</div>

   <p id="btn1" class="glyphicon glyphicon-play" style="">
how to read message
</p>
<div id="demo1" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;press inbox message</p>
<p class="glyphicon glyphicon-hand-right">&nbsp;select new message or old message then click and see</p>
  <br>
</div>

  <p id="btn2" class="glyphicon glyphicon-play" style="">
how to register visitors
</p>
<div id="demo2" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;press on register visitor</p>
<p class="glyphicon glyphicon-hand-right">&nbsp;fill the form approprietly</p>
  <p class="glyphicon glyphicon-hand-right">&nbsp;then press register</p>

<br>
  
  
</div>
<p id="btn3" class="glyphicon glyphicon-play" style="">
how to how to edit cafeteria schedule
</p>
<div id="demo3" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;caftereyia on cafteria </p>
<p class="glyphicon glyphicon-hand-right">&nbsp;press on the date you want to </p>
<p class="glyphicon glyphicon-hand-right">&nbsp;Enter prisoner id and press search</p>
  <br>
</div>
</td> <td><script src="../decoration/calander.js" type="text/javascript" language="javascript"></script></td></tr>

</table>
<div style="background-color: #E6E6FA;border-radius: 5px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 20px;">Copyright © is reserved by group(1) in 2023</font></center></div>
</div>
</div>
</body>
</html>






