
<%@page import="java.util.Base64"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
<%@ page import="java.sql.*" %>
<%
     HttpSession sessio = request.getSession(true);
sessio.setMaxInactiveInterval(300); // Time in Seconds
if (sessio.getAttribute("username") ==null && sessio.getAttribute("visitor_logged") == null) {
       response.sendRedirect("../login.jsp");
} else {
   
    if ((System.currentTimeMillis() - sessio.getLastAccessedTime()) > 300 * 1000) {
        response.sendRedirect("logout.jsp");
    } else {
        sessio.setAttribute("lastAccessTime", System.currentTimeMillis());
        
    }
}
Connection con = null;
PreparedStatement ps = null;
ResultSet rs=null;
 
    Statement st=null;
    int report = 0;
 int total = 0;
 Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
  st=con.createStatement();

String relation = request.getParameter("relation");
String region = request.getParameter("region");
String woreda = request.getParameter("woreda");
String kebele = request.getParameter("kebele");
String ssn = (String) sessio.getAttribute("ssn");

try {
    Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
  String sql1="select *from vistor_information where ssn='"+ssn+"'";
  st = con.createStatement();
  rs=st.executeQuery(sql1);
  if(rs.next()){
    String sql = "INSERT INTO visitor (fname,  lname, age, sex, relation, region, woreda, kebele) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
    ps = con.prepareStatement(sql);
    ps.setString(1, rs.getString("fname"));
 
    ps.setString(2,rs.getString("lname"));
    ps.setInt(3, rs.getInt("age"));
    ps.setString(4, rs.getString("sex"));
 
    ps.setString(5, relation);
    ps.setString(6, region);
    ps.setString(7, woreda);
    ps.setString(8, kebele);
    int rowsInserted = ps.executeUpdate();
    if (rowsInserted > 0) {
        out.println("<script>alert('Successfully registered')</script>");
    } else {
        out.println("<script>alert('Not registered')</script>");
    }
  }
} catch (Exception e) {
    out.println();
} 

%>
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
</body>
</html>
<script>
    function confirmation()
    {
        var x =confirm("do you want to register prisoner ");
        if (x==true)
        {
            return true;
            
        }
       else
           return false;
    }
</script>
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
   <jsp:include page="../language.jsp" />
	<div class="container" style="background-color: LightSteelBlue; border-radius: 10px; box-shadow: 0px 0px 10px blue;">
	<img src="../logo2.png" style="width: 100%; height: 150px ; box-shadow: 0px 0px 10px 0px green; border-radius: 10px; margin-top: 3px;">
	<nav>

	<div class="navbar navbar-inverse" style="margin-top: 7px;">
		
		<ul class="nav navbar-nav" >
			<li><a href="index.jsp">Home</a></li>
                        <li><a href="checkforvisiting.jsp">check for visiting</a></li>
 <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">More<span class="caret"></span></a>
<ul class="dropbtn" style="background-color: gray;">
    <div class="dropdown-content">
                      
                          
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
    <form action="" method="post">
    <td colspan="3" style="text-align: center; font-family: Comic sans Ms; background-color: #708090; color: white; border-radius: 10px; font-size: 20px; ">welcome to visitor page</td></tr>
    <tr style="text-align: center;"><td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;">do you know about BG</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;" >Register visitor</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;"></td></tr>
        <tr><td class="text-justify" style="font-size: 14px; width: 300px;">  Benishangul-Gumuz  also known as Benshangul/Gumuz, is one of the nine ethnic divisions (kililoch) of Ethiopia. It was previously known as Region 6.The region's capital is Assosa<br>
            <img src="../assosa 1.jpg" width="100%"></td> 
            <td style="width: 300px;" class="text-justify" rowspan="3">


              <form action="" method="post" enctype="multipart/form-data">
              <table class="table table-bordered">
                <tr><td>region<span style="color: red;">*</span></td><td><select name="region" class="form-control" style="border:1px solid gray;" required="">
  <option value="tigray">Tigray</option>
 <option value="amhara">Amhara</option>
  <option value="oromia">Oromia</option>
   <option value="snnr">SNNR</option>
    <option value="harar">Harar</option>
     <option value="bgrs">BGRS</option>
      <option value="somali">somali</option>
       <option value="afar">afar</option>
        <option value="gambela">gambela</option>
</select>
    </td></tr>
                 <tr><td>reletion<span style="color: red;">*</span></td><td><input type="text" name="relation" pattern="^[A-Za-z'.\s]{1,40}$" class="form-control" style="border:1px solid gray;" required=""></td></tr>
                 <tr><td>woreda<span style="color: red;">*</span></td><td><input type="text" name="woreda" pattern="^[A-Za-z'.\s]{1,40}$" class="form-control" style="border:1px solid gray;" required=""></td></tr>
                 <tr><td>kebele<span style="color: red;">*</span></td><td><input type="text" name="kebele"  class="form-control" style="border:1px solid gray;" required=""></td></tr>
            
                 
              </table>
     <input type="submit" name="register" value="register" class="btn btn-success form-control" onclick="return confirmation ();">
              </form>
              <!--register new user-->
            </td> 
<td style="font-size: 25px; color: red; font-family: agency fb;"> you are login as visitor!
<table><tr>
<%
  Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");

String ssnno = (String) sessio.getAttribute("ssn");
String sql5 = "select * from vistor_information where ssn=5446";
try {
   st = con.createStatement();
    rs = st.executeQuery(sql5);
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

     
 
</tr></table>



</td>
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
    
   
<td><script src="../decoration/calander.js" type="text/javascript" language="javascript"></script></td></tr>

</table>
<div style="background-color: #E6E6FA;border-radius: 5px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 20px;">Copyright © is reserved by group(1) in 2023</font></center></div>

</div>
</div>
</body>
</html>
<%
if (request.getParameter("update") != null) {
  String username=request.getParameter("username");
  String current=request.getParameter("cpassword");
  String newPwd=request.getParameter("npassword");
  String copassword=request.getParameter("copassword");
  if (newPwd.equals(copassword)) {
    String sql6="SELECT * FROM account WHERE username='"+username+"' AND password='"+current+"'";
     rs=st.executeQuery(sql6);
     report=0;
    while(rs.next()) {
      report++;
    }
    if (report>0) {
      String sql7="UPDATE account SET password='"+newPwd+"' WHERE username='"+username+"'";
      int qu=st.executeUpdate(sql7);
      if (qu>0) {
        out.println("<script>alert('password is updated successfully')</script>");
      }
      else{
        out.println("<script>alert('not updated please try again!!')</script>");
      }
    }
    else{
      out.println("<script>alert('username or password is not correct please enter correct password and username!!')</script>");
    }
  }
  else{
    out.println("<script>alert('coniformation password is incorrect!')</script>");
  }
}
%>
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

    