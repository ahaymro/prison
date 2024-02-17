<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    Connection con = null;
     Statement st = null;
      ResultSet rs = null;
      PreparedStatement pstmt=null;
       int report=0;
       int total=0;
HttpSession sessio = request.getSession();
sessio.setMaxInactiveInterval(900); // Time in Seconds
if (sessio.getAttribute("cusername") ==null && sessio.getAttribute("comissioner_logged") == null) {
       response.sendRedirect("../login.jsp");
} else {
   
    if ((System.currentTimeMillis() - sessio.getLastAccessedTime()) > 900 * 1000) {
        response.sendRedirect("logout.jsp");
    } else {
        sessio.setAttribute("lastAccessTime", System.currentTimeMillis());
        
    }
}
%>
<%


    Date now = new Date();
    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    String formattedDate = formatter.format(now);


int query = 0;

try {
    Class.forName("com.mysql.jdbc.Driver");
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
    st = con.createStatement();
    
    if (request.getParameter("post") != null) {
        String news = request.getParameter("news");
        
       
     String sql = "INSERT INTO news(description, date) VALUES ('" + news + "','" +formattedDate  + "')";
         query = st.executeUpdate(sql);
    }
    if(query>0){
     out.println("<font style='position:absolute; top:350px; left:600px; color:red; font-family:comic sans Ms; font-size:25px;'>posted successfully!</font>");
   
    }
    
    
} catch (SQLException e) {
    e.printStackTrace();
} catch (ClassNotFoundException e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) {
            rs.close();
        }
        if (st != null) {
            st.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
<!DOCTYPE html>
<script>
    function confirmation()
    {
        var x =confirm("do you want to post news ");
        if (x==true)
        {
            return true;
            
        }
       else
           return false;
    }
</script>
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
  Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
  st=con.createStatement();
  String sql1="select count(id) as total  from comissioner_message where status=0";
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
     <li><a href="inbox1.jsp"><span style="color: black; font-size: 20px;">new message(<%
  Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
  st=con.createStatement();
  String sql2="select count(id) as total  from comissioner_message where status=0";
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
     <li><a href="inbox.jsp"><span style="color: black; font-size: 20px;">old message</span></a></li>
     </div>
</ul>
		<li><a href="sendmessage.jsp">send message</a></li>
			<li><a href="postnew.jsp">Post news</a></li>
			<li><a href="readfeedback.jsp">see feedback</a></li>
			 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">More<span class="caret"></span></a>
<ul class="dropbtn" style="background-color: gray;">
      <div class="dropdown-content">                         
                          
                             <li><a href="readforgive.jsp"><span style="color: black; font-size: 20px;">read Request</span></a></li>
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
<table class="table table-bordered" style="font-size: 30px;">

	<tr><td colspan="3" style="text-align: center;">  

</td>
            </tr>
	<tr><td><img src="../pri1.jpg" class="img-rounded" style="width: 267px; height: 396px;" id="img"></td>   <td style="font-family: Comic sans Ms;"><br><br>
<b><form action="" method="post">
        <textarea class="form-control" placeholder="Enter your news and events" style="width: 600px; height: 200px; border:2px solid gray; border-radius: 10px;" name="news" required=""></textarea><br> <input type="submit" name="post" value="post" class="btn btn-success form-control" style="height: 45px;font-size: 25px; width: 200px; margin-left: 200px;"onclick="return confirmation ();"></form></b>
  </td></tr>

</table>
<div style="background-color: #E6E6FA;border-radius: 5px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 20px;">Copyright © is reserved by group(1) in 2023</font></center></div>

</div>
</div>
</body>
</html>