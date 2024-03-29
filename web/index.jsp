<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>

<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.servlet.http.*" %>


<%@ page import="java.sql.*" %>


<%
  
  Connection con = null;
  PreparedStatement stmt = null;
  ResultSet rs = null;
  HttpSession sessio = request.getSession();

  // Get the form data
     if(request.getParameter("login")!=null){
  String username = request.getParameter("username");
  String password = request.getParameter("password");

  // Store the form data in session variables
 
  sessio.setAttribute("password", password);
  sessio.setAttribute("lastAccessTime", System.currentTimeMillis());

  // Connect to the database
  
  try {
    Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
    // Prepare the SQL statement
    String sql = "SELECT * FROM account WHERE username=? AND password=? AND status='1'";
    stmt = con.prepareStatement(sql);
    stmt.setString(1, username);
    stmt.setString(2, password);

    // Execute the SQL statement
    rs = stmt.executeQuery();

    // Check if the user exists
    if (rs.next()) {
      String user_type = rs.getString("account_type");
      if (user_type.equals("adminstrator")) {
        sessio.setAttribute("admin_logged", "true");
        sessio.setAttribute("id", rs.getInt("id"));
        sessio.setAttribute("ssn",rs.getString("ssn"));
        sessio.setAttribute("zone", rs.getString("zone"));
        sessio.setAttribute("ausername", username);
        String usernamee = rs.getString("username");
        String passwordd = rs.getString("password");
        if (usernamee.equals(username) && passwordd.equals(password)) {
          response.sendRedirect("admin/index.jsp");
        } else {
          out.println("<div style='position:absolute; top:360px; left:790px;'><font style='margin-left:30px; font-family:times new roman; font-size:19px; color:red;'>please enter correct password <br>and username!</font></div>");
        }
      } else if (user_type.equals("inspector")) {
          sessio.setAttribute("iusername", username);
        sessio.setAttribute("inspector_logged", "true");
        sessio.setAttribute("id", rs.getInt("id"));
        sessio.setAttribute("ssn", rs.getString("ssn"));
        sessio.setAttribute("zone", rs.getString("zone"));
        String usernamee = rs.getString("username");
        String passwordd = rs.getString("password");
        if (usernamee.equals(username) && passwordd.equals(password)) {
          response.sendRedirect("inspector/index.jsp");
        } else {
          out.println("<div style='position:absolute; top:360px; left:790px;'><font style='margin-left:30px; font-family:times new roman; font-size:19px; color:red;'>please enter correct password <br>and username!</font></div>");
        }
      } else if (user_type.equals("policeofficer")) {
          sessio.setAttribute("pusername", username);
        sessio.setAttribute("policeofficer_logged", "true");
        sessio.setAttribute("id", rs.getInt("id"));
        sessio.setAttribute("ssn", rs.getString("ssn"));
        sessio.setAttribute("zone", rs.getString("zone"));
        String usernamee = rs.getString("username");
        String passwordd = rs.getString("password");
        if (usernamee.equals(username) && passwordd.equals(password)) {
          response.sendRedirect("policeofficer/index.jsp");
        } else {
          out.println("<div style='position:absolute; top:360px; left:790px;'><font style='margin-left:30px; font-family:times new roman; font-size:19px; color:red;'>please enter correct password <br>and username!</font></div>");
        }
      } 
      else if (user_type.equals("visitor")) {
          sessio.setAttribute("vusername", username);
        sessio.setAttribute("visitor_logged", "true");
        sessio.setAttribute("id", rs.getInt("id"));
        sessio.setAttribute("ssn", rs.getString("ssn"));
        sessio.setAttribute("zone", rs.getString("zone"));
        String usernamee = rs.getString("username");
        String passwordd = rs.getString("password");
        if (usernamee.equals(username) && passwordd.equals(password)) {
          response.sendRedirect("visitor/index.jsp");
        } else {
          out.println("<div style='position:absolute; top:360px; left:790px;'><font style='margin-left:30px; font-family:times new roman; font-size:19px; color:red;'>please enter correct password <br>and username!</font></div>");
        }
      }
      else if (user_type.equals("comissioner")) {
          sessio.setAttribute("cusername", username);
        sessio.setAttribute("comissioner_logged", "true");
        sessio.setAttribute("id", rs.getInt("id"));
        sessio.setAttribute("ssn", rs.getString("ssn"));
        sessio.setAttribute("zone", rs.getString("zone"));
        String usernamee = rs.getString("username");
        String passwordd = rs.getString("password");
        if (usernamee.equals(username) && passwordd.equals(password)) {
          response.sendRedirect("comissioner/index.jsp");
        } else {
          out.println("<div style='position:absolute; top:360px; left:790px;'><font style='margin-left:30px; font-family:times new roman; font-size:19px; color:red;'>please enter correct password <br>and username!</font></div>");
        }
        
        
      } else {
        out.println("<div style='position:absolute; top:370px; left:790px;'><font style='margin-left:30px; font-family:times new roman; font-size:19px; color:red;'>please enter correct password <br>and username!</font></div>");
      }
      
    } else {
      out.println("<div style='position:absolute; top:370px; left:790px;'><font style='margin-left:85px; font-family:times new roman; font-size:19px; color:red;'>incorrect password and username!</font></div>");
    }
  } catch (Exception e) {
    e.printStackTrace();
  } finally {
    // Close the database resources
    if (rs != null) {
      try {
        rs.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    if (stmt != null) {
      try {
        stmt.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
    if (con != null) {
      try {
        con.close();
      } catch (SQLException e) {
        e.printStackTrace();
      }
    }
  }
  }
%>

<style>
    #google_translate_element{
        margin-top:20px;
        align: right;
        
        
    }  
    
    
    
</style>
<script>
var myInput = document.getElementById("password");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
  document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
  document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 8) {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}
</script>

<html>
<head>
    </script>	
<script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script>

<script>
function googleTranslateElementInit() {
  new google.translate.TranslateElement({
    pageLanguage: 'en',
    includedLanguages: 'en,am,om',
    layout: google.translate.TranslateElement.InlineLayout.SIMPLE
  }, 'google_translate_element');
}

</script>
</script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
  
.left, .right {
  float: left;
  width: 20%; /* The width is 20%, by default */
}

.main {
  float: left;
  width: 60%; /* The width is 60%, by default */
}

/* Use a media query to add a breakpoint at 800px: */
@media screen and (max-width: 800px) {
  .left, .main, .right {
    width: 100%; /* The width is 100%, when the viewport is 800px or smaller */
  }
}

    #google_translate_element{
        
 width:device-width;
        display: none;
  position: absolute;
  background-color: #c0c0c0;
  min-width:150px;

  z-index:1;
  color: black;
   display: block;
  color: black;
  padding: 8px 16px;
  text-decoration: none;
  margin-left:1027;


 

 
  display: block;
  background-color:white;
 
    
    }
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

.dropdown-content a:hover {background-color:white;}
.dropdown:hover .dropdown-content {display: block;}
.ul li:hover{background-color:white;}
.dropdown:hover .dropbtn {background-color: #3e8e41;}
</style>
</head>
<body>
    <div id="google_translate_element">Language</div>
</body>
</html>
<style>
li a {
  display: block;
  color: black;
  padding: 8px 14px;
  text-decoration: none;
  
}
 #google_translate_element{
        margin-top:158px;
        align: right;
        
        
    }  
    
/* Change the link color on hover */
li a:hover {
  background-color: darkgreen;
  color: red ;
}

@media  screen and(max-width:10px) {
  .con,container{
    width:100%; /* The width is 100%, when the viewport is 800px or smaller */
  }
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
            
@media(max-width:5000px) {
 
    	
body{
	font-family: Times News Roman;
 padding:20px;
      
    width:100%;  
}
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
    
			  <li><a href="aboutorganization.jsp">About us</a></li>
                          <li><a href="contact.jsp">Contact us</a></li>
                        
                        
</ul>


	</div>

			 
</nav>
<div class="jumbotron" style="margin-top: 5px; box-shadow: 0px 0px 30px 0px white;">
<table class="table table-bordered ">
	<tr><td colspan="5" style="text-align: center; font-family: Comic sans Ms; background-color: Lavender ; color:black ; border-radius: 10px; font-size: 20px; ">welcome to prison information managment system</td></tr>
    <tr style="text-align: center;"><td colspan="4" style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: comic sans Ms;">do you know about BG</td>
        
        <td style="font-size: 20px; background-color: LightSteelBlue; color: white; font-family: times new roman;">login here</td>
    </tr>
        <tr><td style="font-size: 14px; width: 40px;background-color:lightcyan"><ul>
                    <li class="dropdown"><a href="How to login in the systemm.pdf">Help</a></li><br>
  <li class="dropdown"><a href="news.jsp">News(<%
try {
           Class.forName("com.mysql.jdbc.Driver");
    // Connect to the database
   con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
    String sql = "SELECT COUNT(description) AS news FROM news WHERE date=?";
    stmt = con.prepareStatement(sql);
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
  <td colspan="3" style="width: 300px;" class="text-justify"><img src="pris2.jpg" width="100%">benshangul-gumuz region prison office is located in assosa city. It gives services for civil prisoners of the region. the organization uses manual file system managment, we prefer to change this application to online based system inorder to make easy file managment</td> 
   
            <td class="text-justify">
         <table class="table table-condensed table-bordered">
  
    <tr>
        <td style="width: 400px;">
<div class="con"style="width: 300px; margin-left: 10px; background-color: gray; height: 300px; border-radius: 10px; box-shadow: 0px 0px 10px green;">
<form action="" method="post"><br>


<font style="color: black; font-size: 20px; margin-left: 15px;">User Name</font></font></span>
 <input type="text" name="username" class="form-control" style="width: 250px; margin-left: 15px; border:2px solid black;" required="">
            <font style="color: black; font-size: 20px; margin-left: 15px;">Password</font></font></span>
            <input type="password" name="password" id="Pass" class="form-control" style="width: 250px; margin-left: 15px; border:2px solid black;" required=""><br>

            <input type="submit" name="login" value="login" class="btn btn-success form-control" style="width: 250px; margin-left: 15px; background-color: #54381e; font-size: 20px; font-family: comic sans Ms; height: 50px; border:2px solid brown;">
           <br><input type="checkbox"  name="checkbox" id="cb" onClick="show_password();">
<span style="color: black; font-size: 17px"><b>Show Characters<b></span></center><br>
             <a href="forgetpassword.jsp" style="color: black; font-family: times new roman; font-size: 20px;">forget password</a>
 
        </form>
       

    </div>

        </td>

    </tr>
</table>
            </td></tr>
        <tr><td colspan="2" style="text-align: center; font-size: 20px; background-color: LightSteelBlue; color: black;" >Mission</td> <td colspan="2" style="text-align: center;font-size: 20px;background-color: LightSteelBlue;color: black;">Vission</td> <td style="text-align: center;font-size: 20px; background-color: LightSteelBlue; color: black;">calender</td></tr>
            <tr><td colspan="2" class="text-justify">Benishangul-gumuz Region prison is with participation of the people and developing highly secured information system center in order to prevent crime. Shape the prisoner to have good social interaction with people and to make the prisoner creative and fighting against crime as other good citizen do</td> <td class="text-justify">
                <ul class="text-justify">
                  
             <li>Benishangul-gumuz Region prison has the vision of creating citizen who are patriotic, fight against crime and reduce crime.     </li>
                <li>To build where the rule of law approved.</li>
                   <li>To give guaranteed human right.</li>
                       <li>To provided quick service.</li>
              
                </ul></td> <td colspan="3"><script src="decoration/calander.js" type="text/javascript" language="javascript"></script></td></tr>
<TR >
            
            </TR>
</table>
    <div>
        
    </div>
    <div style="background-color: #E6E6FA;border-radius:1300px; box-shadow: 0px 0px 10px 0px green;"><center><font style="font-size: 20px;">ęCopyright is reserved by group(1) in 2023</font></center></div>

</div>
</div>
  <script src="script.js"></script>
</body>
</html>