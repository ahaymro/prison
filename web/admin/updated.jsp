

<%@page import="java.nio.file.StandardCopyOption"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
      
Connection con = null;
 Statement stmt=null;
 ResultSet rs=null;
 int report = 0;
 int total = 0;
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
<%
    if (session.getAttribute("admin_logged") == null) {
        // response.sendRedirect("../login.jsp");
    } else {
        
        PreparedStatement pstmt = null;
     

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
            out.println("HELLOW");

            if (request.getParameter("update") != null) {
                String accountType = null;
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String sex = request.getParameter("sex");
                int age = Integer.parseInt(request.getParameter("age"));
                InputStream inputStream = null;
                Part filePart = request.getPart("photo");

                if (filePart != null) {
                    inputStream = filePart.getInputStream();
                }

                String sql = "SELECT account_type FROM account WHERE ssn=?";
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, request.getParameter("id"));
                rs = pstmt.executeQuery();
                out.println("HELLOW");

                if (rs.next()) {
                    accountType = rs.getString("account_type");

                    if (accountType.equals("comissioner")) {
                        sql = "UPDATE comissioner_information SET fname=?, lname=?, sex=?, age=?, photo=? WHERE ssn=?";
                    } else if (accountType.equals("policeofficer")) {
                        sql = "UPDATE policeofficer_information SET fname=?, lname=?, sex=?, age=?, photo=? WHERE ssn=?";
                    } else if (accountType.equals("inspector")) {
                        sql = "UPDATE inspector_information SET fname=?, lname=?, sex=?, age=?, photo=? WHERE ssn=?";
                    } else if (accountType.equals("adminstrator")) {
                        sql = "UPDATE admin_info SET fname=?, lname=?, sex=?, age=?, photo=? WHERE ssn=?";
                    }

                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, fname);
                    pstmt.setString(2, lname);
                    pstmt.setString(3, sex);
                    pstmt.setInt(4, age);

                    if (inputStream != null) {
                        pstmt.setBlob(5, inputStream);
                    }

                    pstmt.setString(6, request.getParameter("id"));
                    int result = pstmt.executeUpdate();

                    if (result > 0) {
                        out.println("<font style='color:red;position:absolute;top:250px;left:450px; font-size:20px;'>updated successfully</font>");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }

                if (pstmt != null) {
                    pstmt.close();
                }

                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
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
  Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
  stmt=con.createStatement();
  String sql="select count(id) as total  from admin_message where status=0";
 rs=stmt.executeQuery(sql);

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
			<li><a href="inbox1.php"><span style="color: black; font-size: 20px;">new message(<%
  Class.forName("com.mysql.jdbc.Driver");
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
  stmt=con.createStatement();
  String sql1="select count(id) as total  from admin_message where status=0";
 rs=stmt.executeQuery(sql1);

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
        <td style="font-size: 20px; background-color: LightSteelBlue; color: black; font-family: comic sans Ms;" >update account page</td>
        <td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;"></td></tr>
        <tr><td class="text-justify" style="font-size: 14px; width: 300px;">  Benishangul-Gumuz also known as Benshangul/Gumuz, is one of the nine ethnic divisions (kililoch) of Ethiopia. It was previously known as Region 6.The region's capital is Assosa<br>
            <img src="../assosa 1.jpg" width="100%"></td> 
            <td style="width: 450px;" class="text-justify" rowspan="3">
            <table class="table table-bordered" style="font-size: 15px; color: black;">
              
<%
String id = request.getParameter("id");
String account = null;
String fname = null;
String lname = null;
int age = 0;
String sex = null;


    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
    PreparedStatement st = con.prepareStatement("SELECT * FROM account WHERE ssn = ?");
    st.setString(1, id);
    
  ResultSet  rs1 = st.executeQuery();
 
    if (rs1.next()) {
        String id_no=rs1.getString("ssn");
        account = rs1.getString("account_type");
        if (account.equals("adminstrator")) {
            st = con.prepareStatement("SELECT * FROM admin_info WHERE ssn = ?");
            st.setString(1, id);
      rs = st.executeQuery();
            if (rs.next()) {
                fname = rs.getString("fname");
                lname = rs.getString("lname");
                age = rs.getInt("age");
                sex = rs.getString("sex");
           
        
%>


    <form action="../Updatedaccount" method="post" enctype="multipart/form-data">
        <table>
             <tr>
                <td>Id_no<span style="color: red;">*</span></td>
                <td><input type="text" name="id" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= id_no %>"><br></td>
            </tr>
            <tr>
                <td>Fname<span style="color: red;">*</span></td>
                <td><input type="text" name="fname" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= fname %>"><br></td>
            </tr>
            <tr>
                <td>Lname<span style="color: red;">*</span></td>
                <td><input type="text" name="lname" class="form-control" style="border:1px solid gray;" value="<%= lname %>"><br></td>
            </tr>
            <tr>
                <td>Age<span style="color: red;">*</span></td>
                <td><input type="number" name="age" class="form-control" style="border:1px solid gray;" value="<%= age %>"><br></td>
            </tr>
            <tr>
                <td>Sex<span style="color: red;">*</span></td>
                <td>
                    <select name="sex" class="form-control" style="border:1px solid gray;">
                        <option value="male" <%= (sex != null && sex.equals("male")) ? "selected" : "" %>>Male</option>
                        <option value="female" <%= (sex != null && sex.equals("female")) ? "selected" : "" %>>Female</option>
                    </select><br>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="file" name="photo" class="form-control" required><br></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="update" value="update" class="btn btn-success form-control"></td>
            </tr>
        </table>
    </form>
   <%
}
%>

   <%
}
%>
   <%
if (account.equals("comissioner")) {
            st = con.prepareStatement("SELECT * FROM comissioner_information WHERE ssn = ?");
            st.setString(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                fname = rs.getString("fname");
                lname = rs.getString("lname");
                age = rs.getInt("age");
                sex = rs.getString("sex");
       %>
        <form action="../Updatedaccount" method="post" enctype="multipart/form-data">
        <table>
              <tr>
                <td>Id_no<span style="color: red;">*</span></td>
                <td><input type="text" name="id" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= id_no %>"><br></td>
            </tr>
                <td>Fname<span style="color: red;">*</span></td>
                <td><input type="text" name="fname" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= fname %>"><br></td>
            </tr>
            <tr>
                <td>Lname<span style="color: red;">*</span></td>
                <td><input type="text" name="lname" class="form-control" style="border:1px solid gray;" value="<%= lname %>"><br></td>
            </tr>
            <tr>
                <td>Age<span style="color: red;">*</span></td>
                <td><input type="number" name="age" class="form-control" style="border:1px solid gray;" value="<%= age %>"><br></td>
            </tr>
            <tr>
                <td>Sex<span style="color: red;">*</span></td>
                <td>
                    <select name="sex" class="form-control" style="border:1px solid gray;">
                        <option value="male" <%= (sex != null && sex.equals("male")) ? "selected" : "" %>>Male</option>
                        <option value="female" <%= (sex != null && sex.equals("female")) ? "selected" : "" %>>Female</option>
                    </select><br>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="file" name="photo" class="form-control" required><br></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="update" value="update" class="btn btn-success form-control"></td>
            </tr>
        </table>
    </form>
       
       
        <%
}
%>
 <%
}
%>
<%
 if (account.equals("policeofficer")) {
            st = con.prepareStatement("SELECT * FROM policeofficer_information WHERE ssn = ?");
            st.setString(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                fname = rs.getString("fname");
                lname = rs.getString("lname");
                age = rs.getInt("age");
                sex = rs.getString("sex");
       %>
        <form action="../Updatedaccount" method="post" enctype="multipart/form-data">
        <table>
             <tr>
                <td>Id_no<span style="color: red;">*</span></td>
                <td><input type="text" name="id" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= id_no %>"><br></td>
            </tr>
                <td>Fname<span style="color: red;">*</span></td>
                <td><input type="text" name="fname" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= fname %>"><br></td>
            </tr>
            <tr>
                <td>Lname<span style="color: red;">*</span></td>
                <td><input type="text" name="lname" class="form-control" style="border:1px solid gray;" value="<%= lname %>"><br></td>
            </tr>
            <tr>
                <td>Age<span style="color: red;">*</span></td>
                <td><input type="number" name="age" class="form-control" style="border:1px solid gray;" value="<%= age %>"><br></td>
            </tr>
            <tr>
                <td>Sex<span style="color: red;">*</span></td>
                <td>
                    <select name="sex" class="form-control" style="border:1px solid gray;">
                        <option value="male" <%= (sex != null && sex.equals("male")) ? "selected" : "" %>>Male</option>
                        <option value="female" <%= (sex != null && sex.equals("female")) ? "selected" : "" %>>Female</option>
                    </select><br>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="file" name="photo" class="form-control" required><br></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="update" value="update" class="btn btn-success form-control"></td>
            </tr>
        </table>
    </form>
       
       
        <%
}
%>
 <%
}
%>
        <%
 if (account.equals("inspector")) {
            st = con.prepareStatement("SELECT * FROM inspector_information WHERE ssn = ?");
            st.setString(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                fname = rs.getString("fname");
                lname = rs.getString("lname");
                age = rs.getInt("age");
                sex = rs.getString("sex");
       %>
        <form action="../Updatedaccount" method="post" enctype="multipart/form-data">
        <table>
              <tr>
                <td>Id_no<span style="color: red;">*</span></td>
                <td><input type="text" name="id" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value='<%= id_no %>'><br></td>
            </tr>
            <tr>
                <td>Fname<span style="color: red;">*</span></td>
                <td><input type="text" name="fname" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= fname %>"><br></td>
            </tr>
            <tr>
                <td>Lname<span style="color: red;">*</span></td>
                <td><input type="text" name="lname" class="form-control" style="border:1px solid gray;" value="<%= lname %>"><br></td>
            </tr>
            <tr>
                <td>Age<span style="color: red;">*</span></td>
                <td><input type="number" name="age" class="form-control" style="border:1px solid gray;" value="<%= age %>"><br></td>
            </tr>
            <tr>
                <td>Sex<span style="color: red;">*</span></td>
                <td>
                    <select name="sex" class="form-control" style="border:1px solid gray;">
                        <option value="male" <%= (sex != null && sex.equals("male")) ? "selected" : "" %>>Male</option>
                        <option value="female" <%= (sex != null && sex.equals("female")) ? "selected" : "" %>>Female</option>
                    </select><br>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="file" name="photo" class="form-control" required><br></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="update" value="update" class="btn btn-success form-control"></td>
            </tr>
        </table>
    </form>
                        
        <%
}
%>
 <%
}
%>
        <%
 if (account.equals("visitor")) {
            st = con.prepareStatement("SELECT * FROM vistor_information WHERE ssn = ?");
            st.setString(1, id);
            rs = st.executeQuery();
            if (rs.next()) {
                fname = rs.getString("fname");
                lname = rs.getString("lname");
                age = rs.getInt("age");
                sex = rs.getString("sex");
       %>
        <form action="../Updatedaccount" method="post" enctype="multipart/form-data">
        <table>
              <tr>
                <td>Id_no<span style="color: red;">*</span></td>
                <td><input type="text" name="id" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= id_no %>"><br></td>
            </tr>
            <tr>
                <td>Fname<span style="color: red;">*</span></td>
                <td><input type="text" name="fname" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= fname %>"><br></td>
            </tr>
            <tr>
                <td>Lname<span style="color: red;">*</span></td>
                <td><input type="text" name="lname" class="form-control" style="border:1px solid gray;" value="<%= lname %>"><br></td>
            </tr>
            <tr>
                <td>Age<span style="color: red;">*</span></td>
                <td><input type="number" name="age" class="form-control" style="border:1px solid gray;" value="<%= age %>"><br></td>
            </tr>
            <tr>
                <td>Sex<span style="color: red;">*</span></td>
                <td>
                    <select name="sex" class="form-control" style="border:1px solid gray;">
                        <option value="male" <%= (sex != null && sex.equals("male")) ? "selected" : "" %>>Male</option>
                        <option value="female" <%= (sex != null && sex.equals("female")) ? "selected" : "" %>>Female</option>
                    </select><br>
                </td>
            </tr>
            <tr>
                <td colspan="2"><input type="file" name="photo" class="form-control" required><br></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" name="update" value="update" class="btn btn-success form-control"></td>
            </tr>
        </table>
    </form>
       
       
        <%
}
%>
 <%
}
%>
   <%
}
%>
  </table>
            </td> 
            <td </td><br>
            </tr>
            <tr><td style="text-align: center; font-size: 20px; background-color: LightSteelBlue; color: black;" >what can i help you?</td>  <td style="text-align: center;font-size: 20px; background-color: LightSteelBlue; color: black;"></td></tr>
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

  <p id="btn2" class="glyphicon glyphicon-play">
how to View report
</p> 
<div id="demo2" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;press on view report</p>
<p class="glyphicon glyphicon-hand-right">&nbsp;read the report that sent from each zone</p>
  <br>
</div>
<p id="btn3" class="glyphicon glyphicon-play">
how to Mng account
</p>
<div id="demo3" class="collapse out" ><p class="glyphicon glyphicon-hand-right">&nbsp;press on manage account</p>
<p class="glyphicon glyphicon-hand-right">youcancreate,delete,update,activate and deactivate</p>
  <br>
  
</div>
</table>


</div>
</div>
</body>
</html>









