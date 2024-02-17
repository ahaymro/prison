<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

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
<link rel="stylesheet" href="../decoration/css/bootstrap.min.css">

<script src="../decoration/js/jquery.min.js"></script>
<script src="../decoration/js/bootstrap.min.js"></script>
<style type="text/css">
        	
body{
	font-family: Times News Roman;
        padding:20px;
}

ul li a{
	font-size: 20px;


}

 </style>
     
	<title>prisoner managment system</title>
</head>
<body>

    <jsp:include page="../language.jsp" />
	<div class="container" style="background-color: LightSteelBlue; border-radius: 16px; box-shadow: 0px 0px 10px blue;">
	<img src="../logo2.png" style="width: 100%; height: 90px ; box-shadow: 0px 0px 10px 0px green; border-radius: 0px; margin-top: 0px;">
<table class="table table-bordered ">
  <tr>

            <td style="width: 150px;" class="text-justify" rowspan="3">
              <table class="table table-bordered"><tr><th class="text-center" style="background-color: lightgray; font-size: 15px; font-family: comic sans ms;" colspan="2">ASSOSA ZONE</th></tr>
                  <tr><td style="font-family: comic sans ms;">Total male Prisoner Register </td><td><%

 String sql = "select count(ssn) as total from prisoner_information where zone='assosa' and sex='male'";
 rs = st.executeQuery(sql);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%>       
              
                  </td></tr>
                  <tr><td style="font-family: comic sans ms;">total female Prisoner Register </td><td><%

 String sql1 = "select count(ssn) as total from prisoner_information where zone='assosa' and sex='female'";
 rs = st.executeQuery(sql1);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%>
                    
                    
                    </td></tr>
                <tr><td style="font-family: comic sans ms;">Total Prisoner Register</td><td><%

 String sql7 = "select count(ssn) as total from prisoner_information where zone='assosa'";
 rs = st.executeQuery(sql7);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%>       
                    
                    
                    </td></tr>
                 
<th class="text-center" style="background-color: lightgray; font-size: 15px; font-family: comic sans ms;" colspan="2">METEKEL ZONE</th></tr>
              
              <tr><td style="font-family: comic sans ms;">Total male Prisoner Register </td><td><%


 String sql3 = "select count(ssn) as total from prisoner_information where zone='metekel' and sex='male'";
 rs = st.executeQuery(sql3);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
              <tr><td style="font-family: comic sans ms;">Total female Prisoner Register </td><td><%

 
 String sql4 = "select count(ssn) as total from prisoner_information where zone='metekel' and sex='female'";
 rs = st.executeQuery(sql4);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                <tr><td style="font-family: comic sans ms;">Total Prisoner Register </td><td><%

 String sql8 = "select count(ssn) as total from prisoner_information where zone='metekel'";
 rs = st.executeQuery(sql8);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                 <th class="text-center" style="background-color: lightgray; font-size: 15px; font-family: comic sans ms;" colspan="2">KAMATCH ZONE</th></tr>

<tr><td style="font-family: comic sans ms;">Total male Prisoner Register </td><td><%


 String sql5 = "select count(ssn) as total from prisoner_information where zone ='kamatch' and sex='male'";
 rs = st.executeQuery(sql5);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
<tr><td style="font-family: comic sans ms;">Total female Prisoner Register</td><td><%

 String sql6 = "select count(ssn) as total from prisoner_information where zone='kamatch' and sex='female'";
 rs = st.executeQuery(sql6);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                <tr><td style="font-family: comic sans ms;">Total Prisoner Register Today</td><td><%

 String sql9 = "select count(ssn) as total from prisoner_information where zone='kamatch'";
 rs = st.executeQuery(sql9);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
                <th class="text-center" style="background-color: lightgray; font-size: 15px; font-family: comic sans ms;" colspan="2">from all zone</th></tr>
<tr><td style="font-family: comic sans ms;">Total female Prisoner Register</td><td><%

 String sql11= "select count(ssn) as total from prisoner_information where sex='female'";
 rs = st.executeQuery(sql11);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
<tr><td style="font-family: comic sans ms;">Total male Prisoner Register</td><td><%

 String sql10 = "select count(ssn) as total from prisoner_information where sex='male'";
 rs = st.executeQuery(sql10);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>
    <tr><td style="font-family: comic sans ms;">Total Prisoner Register in all zone</td><td>  <%
 String sql12= "select count(ssn) as total from prisoner_information";
 rs = st.executeQuery(sql12);
if (rs.next()) {
    out.println("<font style='color:red; font-family:comic sans ms; font-size:20px;'>" + rs.getInt("total") + "</font>");
} else {
    out.println("<font>0</font>");
}
%></td></tr>               
 
<script>window.print()</script>
                         
  
 </table>
</div>
</div>
</body>
</html>
<html>
<body>
</body>
</html>
