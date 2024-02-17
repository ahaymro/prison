<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.InputStream"%>
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
<%
if (session.getAttribute("admin_logged") != null) {
   // response.sendRedirect("../login.jsp");
} else {
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
      con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
    } catch (Exception e) {
        e.printStackTrace();
    }
}
String id = request.getParameter("id");
String sql = "select * from prisoner_information where ssn='" + id + "'";
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
Statement stmt = con.createStatement();
 rs = stmt.executeQuery(sql);
 rs.next();



  // Get the current date
  java.util.Date currentDate = new java.util.Date();
if(rs.getDate("tcp").before(currentDate)){
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
     
  <title>prisoner managment system</title>
</head>
<body>
<jsp:include page="../language.jsp" />
  <div class="container" style="background-color: LightSteelBlue; border-radius: 10px; box-shadow: 0px 0px 10px blue;">
  <img src="../logo2.png" style="width: 100%; height: 110px ; box-shadow: 0px 0px 10px 0px green; border-radius: 10px; margin-top: 3px;">
  
<div class="jumbotron" style="margin-top: 5px; box-shadow: 0px 0px 30px 0px white;">
<table class="table table-bordered text-center">
  


<form action='' method='post'>
  <tr>
    <td colspan='2' style='font-family:Agency fb; font-size:30px;color:red; width:350px; ' class='text-left'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Prisoners confirming the duration of their imprisonment</td>
  </tr>  
  <tr>
    <td colspan='2'>
        <%
 rs = stmt.executeQuery(sql);
rs.next();
InputStream photoData = rs.getBinaryStream("photo");
        BufferedImage photoImage = ImageIO.read(photoData);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
ImageIO.write(photoImage, "jpg", baos);
byte[] photoBytes = baos.toByteArray();
String photoBase64 = Base64.getEncoder().encodeToString(photoBytes);
out.println("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src='data:image/jpeg;base64," + photoBase64 + "'style=\"width:150px; border-radius:20px; height:200px border:2px solid green;\" class=\"img-rounded\" title=\"profile picture\"/>");


        %>

    </td>
  </tr>  
  <tr>
    <td style='color:black; font-size:25px;'>FULL NAME<span style='color: red;'>*</span></td>
    <td>
      <input type='text' name='fname' class='form-control' style='border:1px solid gray; color:black; font-size:16px; font-family:Agency fb; font-size:25px; text-align:center; width:350px;' value='<%= rs.getString("fname") %> <%= rs.getString("mname") %> <%= rs.getString("lname") %>' disabled>
    </td>
  </tr>
  <tr>
    <td style='color:black; font-size:25px;'>ID_NO<span style='color: red;'>*</span></td>
    <td>
      <input type='text' name='fname' class='form-control' style='border:1px solid gray; color:black; font-size:16px;font-family:Agency fb; font-size:25px; text-align:center; width:350px;' value='<%= rs.getString("ssn") %>' disabled>
    </td>
  </tr>
  <tr>
    <td style='color:black; font-size:25px;'>AGE<span style='color: red;'>*</span></td>
    <td>
      <input type='number' name='age' class='form-control' style='border:1px solid gray; font-family:Agency fb; font-size:25px; text-align:center; width:350px;' value='<%= rs.getInt("age") %>' disabled>
    </td>
  </tr>
  <tr>
    <td style='color:black; font-size:25px;'>SEX<span style='color: red;'>*</span></td>
    <td>
      <input type='text' name='age' class='form-control' style='border:1px solid gray; font-family:Agency fb; font-size:25px; text-align:center; width:350px;' value='<%= rs.getString("sex") %>' disabled>
    </td>
  </tr>
  <tr>
    <td style='color:black; font-size:25px;'>ENTERING DATE<span style='color: red;'>*</span></td>
    <td>
      <input type='text' name='age' class='form-control' style='border:1px solid gray; font-family:Agency fb; font-size:25px; text-align:center; width:350px;' value='<%= rs.getString("tsp") %>' disabled>
    </td>
  </tr>
  <tr>
    <td style='color:black; font-size:25px;'>LEAVE DATE<span style='color: red;'>*</span></td>
    <td>
      <input type='text' name='age' class='form-control' style='border:1px solid gray; font-family:Agency fb; font-size:25px; text-align:center; width:350px;' value='<%= rs.getString("tcp") %>' disabled>
    </td>
  </tr>
  <tr>
    <td style='color:black; font-size:20px; text-align:center; font-family:Agency fb; color:red' colspan='2'>zone <%= rs.getString("zone") %></td>
  </tr>
  <tr>
    <td style='color:black; font-size:20px; text-align:center; font-family:Agency fb; color:red' colspan='2'>signiture__________</td>
  </tr>
</form>

<% rs.close(); stmt.close(); con.close(); %>

<%

    out.println("<script>window.print()</script>");
  
%>         

 <%

    }else{
out.println("<script type=\"text/javascript\">");
     out.println("alert('prisoner  dose not finish its sentenced');");
         out.println("window.location.href = 'generate.jsp';");
                                            
                        out.println("</script>");
}
  
%>   

  </table>
           
</div>
</body>
</html>