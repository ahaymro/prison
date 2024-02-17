<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

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
HttpSession sessio = request.getSession();
 sessio.setMaxInactiveInterval(300);
if(sessio.getAttribute("iusername")==null && sessio.getAttribute("inspector_logged")==null )
{
   response.sendRedirect("../login.jsp"); 
} 
else {
   
    if ((System.currentTimeMillis() - sessio.getLastAccessedTime()) > 300 * 1000) {
        response.sendRedirect("logout.jsp");
    } else {
        sessio.setAttribute("lastAccessTime", System.currentTimeMillis());
        
    }
}
%>
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
        padding:20px;
}

ul li a{
	font-size: 25px;


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

.dropdown-content a:hover {background-color: teal;}

.dropdown:hover .dropdown-content {display: block;}

.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style> 
	<title>prisoner managment system</title>
</head>
<body>
<jsp:include page="../language.jsp" />
	<div class="container" style="background-color: LightSteelBlue; border-radius: 10px; box-shadow: 0px 0px 10px blue;">
	<img src="../logo2.png" style="width: 100%; height: 150px ; box-shadow: 0px 0px 10px 0px green; border-radius: 10px; margin-top: 3px;">
	<nav>

	<div class="navbar navbar-inverse" style="margin-top: 7px;">
		
		<ul class="nav navbar-nav">
			<li><a href="index.jsp">Home</a></li>
			 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> Inbox message(<%

  String sql1="select count(id) as total  from inspector_message where status=0";
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
%>)<span class="caret"></span></a>
<ul class="dropbtn" style="background-color: gray;">
    <div class="dropdown-content">
     <li><a href="inbox.jsp"><span style="color: black; font-size: 20px;">new message 
          (<% 
    String sql2="select count(id) as total  from inspector_message where status=0";
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
%>)</span></a></li>
     <li><a href="inbox1.jsp"><span style="color: black; font-size: 20px;">old message</span></a></li>
     </div>
</ul>
		<li><a href="sendmessage.jsp">send message</a></li>
			
			
                       
<ul class="dropbtn" style="background-color: gray;">
      <div class="dropdown-content">                       
                             
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
  <form action="searched.jsp" method="post"><tr><td></td> <td><input type="text" name="serial" class="form-control" style="width: 400px; font-size: 20px; font-family: comic sans ms; border: 3px solid black; border-radius: 5px;" placeholder="search prisoner using ID Number"></td> <td><input type="submit" name="search" value="search" class="btn btn-info form-control"></td> </tr></form>
  <tr>

    <td colspan="3" style="text-align: center; font-family: Comic sans Ms; background-color: #708090; color: white; border-radius: 10px; font-size: 20px; ">welcome to comissioner page</td></tr>
    <tr style="text-align: center;"><td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;">do you know about BG</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;" >search prisoner</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;"></td></tr>
        <tr><td class="text-justify" style="font-size: 14px; width: 300px;">  Benishangul-Gumuz (Amharic:), also known as Benshangul/Gumuz, is one of the nine ethnic divisions (kililoch) of Ethiopia. It was previously known as Region 6.The region's capital is Assosa<br>
            <img src="../assosa 1.jpg" width="100%"></td> 
            <td style="width: 450px;" class="text-justify" rowspan="3">
              
         
<%
 

  String query = "SELECT COUNT(ssn) as total FROM prisoner_information";

 rs = st.executeQuery(query);

  if (rs.next()) {
    total = rs.getInt("total");
  }
  int record_limit = 5;
  int total_page = (int) Math.ceil(total / (float) record_limit);
  int page_cur = (request.getParameter("page") != null) ? Integer.parseInt(request.getParameter("page")) : 1;
  int start = (page_cur - 1) * record_limit;
  // Execute select query
  query = "SELECT * FROM prisoner_information LIMIT " + start + ", " + record_limit;
  st = con.createStatement();
  rs = st.executeQuery(query);
  if (rs.isBeforeFirst()) {
    int i = 1;
    out.println("<table class='table table-bordered'><tr><th>#</th><th>ID number</th> <th>fname</th> <th>mname</th><th>more info</th></tr>");
    while (rs.next()) {
      out.println("<tr><td>" + i + "</td><td>" + rs.getString("ssn") + "</td> <td>" + rs.getString("fname") + "</td> <td>" + rs.getString("mname") + "</td><td> <a href='more.jsp?id=" + rs.getString("ssn") + "'><button class='btn btn-info' style='width:100%'>more</button></a></td></tr>");
      i++;
    }
    out.println("<tr><td colspan='3' class='page'>");
    if (page_cur > 1) {
      out.println("<a href='search.jsp?page=" + (page_cur - 1) + "'><button  class='btn btn-info'>PREVIOUS</button></a>");
    } else {  
      out.println("<button class='btn btn-default' >First Page</button>");    
    }
    out.println("</td><td colspan='3' class='page'>");
    if (page_cur < total_page) { 
      out.println("<a href='search.jsp?page=" + (page_cur + 1) + "'><button class='btn btn-success form-control'>Next</button></a>");  
    } else {
      out.println("<button class='btn btn-danger'>Last Page</button>"); 
    }
    out.println("</td></tr></table>");
  } else {
    out.println("No records matching your query were found.");
  }
  // Close database connection
  st.close();
  con.close();
%>
          

</td> 
<td style="font-size: 25px; color: red; font-family: agency fb;"> you are login as  comissioner!<table><tr>
 
<%
  Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
String ssnno = (String) sessio.getAttribute("ssn");
String sql4 = "select * from inspector_information where ssn='"+ssnno+"'";
try {
   st = con.createStatement();
    rs = st.executeQuery(sql4);
    rs.last();
    report = rs.getRow();
    rs.beforeFirst();
} catch (SQLException e) {
    e.printStackTrace();
}

if (report > 0) {
    while (rs.next()) {
        InputStream photoData = rs.getBinaryStream("photo");
        BufferedImage photoImage = ImageIO.read(photoData);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
ImageIO.write(photoImage, "jpg", baos);
byte[] photoBytes = baos.toByteArray();
String photoBase64 = Base64.getEncoder().encodeToString(photoBytes);
out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='data:image/jpeg;base64," + photoBase64 + "'style=\"width:150px; border-radius:20px; border:2px solid green;\" class=\"img-rounded\" title=\"profile picture\"/><br>Name:&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString("fname") + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString("lname") + "</font> ");
        //out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src=\"../upload/image/" + rs.getString("photo") + "\" style=\"width:150px; border-radius:20px; border:2px solid green;\" class=\"img-rounded\" title=\"profile picture\"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font style=\"color:green;\">Name:&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString("fname") + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + rs.getString("lname") + "</font> ");
    }
}
%>
</tr></table></td>
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
<p class="glyphicon glyphicon-hand-right">&nbsp;read the message that sent to you</p>
  <br>
</div>

  <p id="btn2" class="glyphicon glyphicon-play" style="">
how to post news
</p>
<div id="demo2" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;press on post news</p>
<p class="glyphicon glyphicon-hand-right">&nbsp;enter the news and press post button</p>
  <br>
</div>
<p id="btn3" class="glyphicon glyphicon-play" style="">
search prisoner
</p>
<div id="demo3" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;press on more button</p>
<p class="glyphicon glyphicon-hand-right">&nbsp;press on search prisoner</p>
<p class="glyphicon glyphicon-hand-right">&nbsp;Enter prisoner id and press search</p>
  <br>
</div>
<!--help-->

  </div>
</td> <td><script src="../decoration/calander.js" type="text/javascript" language="javascript"></script></td></tr>

</table>
<div style="background-color: #E6E6FA;border-radius: 5px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 30px;">Copyright © is reserved by BGRS in 2023</font></center></div>

</div>
</div>
</body>
</html>