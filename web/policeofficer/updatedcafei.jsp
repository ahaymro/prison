       

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


<html>
<head>
   <head>
  
    <link href="style1.css" rel="stylesheet" type="text/css"/>
    <script src="jquery-1.7.1.min.js"></script>
    <script src="registration_script.js"></script>
	  <link rel="stylesheet" media="screen" href="login.css" >
</head>
<body> 

<table align="center" border="0" bgcolor="white" width="400" cellpadding="9" cellspacing="0" >
          <tr>
            <td colspan="2" height="2"><img src="../logo2.png" width="860"></td>
          </tr>
          <tr>
            <td width="25%" bgcolor="#FFFFFF" >&nbsp;&nbsp;
            <td width="50%" align="center" bgcolor="white">
       
<div id="content" class="ctrdiv">
	<form id="frmReg" method="POST" action="../editcafischdule">
       <h2 id="hdr_title">Edit cafe schedule </h2>
            <div class="control_input">
            <label for="ID_NO" class="label">ID_NO</label><input type="text" name="id" class="form-control" style="border:1px solid gray; color:black; font-size:16px;" value="<%= id_no %>" required="">
            </div>
            <div class="control_input">
                <label for="eating_time" class="label">eating_time</label><input type="text" id="Fname" name="eating_time" value="<%= eating_time %>" class="reg_fields" required placeholder=""/>
            </div>
       <div class="control_input">
                <label for="monday" class="label">monday</label><input type="text" id="Fname" name="monday" value="<%= monday %>"class="reg_fields" required placeholder=""/>
            </div>
       <div class="control_input">
                <label for="tusday" class="label">tusday</label><input type="text" id="Fname" name="tusday"value="<%= tusday %>" class="reg_fields" required placeholder=""/>
            </div>
         
       
             <div class="control_input">
                <label for="wednsday" class="label">wednsday</label><input type="text" name="wednsday"value="<%= wednsday %>" class="reg_fields" required/>
            </div>
        <div class="control_input">
         <label for="thursday" class="label"> thursday</label><input type="text" name="thursday" class="reg_fields" style="border:1px solid gray;" value="<%= thursday %>" required=""/>
    
        
  <div class="control_input">
      <label for="friday" class="label">friday</label><input type="text" name="friday"value="<%= friday %>"class="form-control" style="border:1px solid gray;" required="">
   </div> 
    
        <div class="control_input">
      <label for="ed" class="label">saturday</label> <input type="text" name="saturday"value="<%= saturday %>" class="form-control" style="border:2px solid gray;"  required>
          </div>
       <div class="control_input">
<label for="ed" class="label">sunday</label>
     <input type="text" name="sunday"value="<%= sunday %>" class="form-control" style="border:1px solid gray;"  required>
      </div>
      <label for="ed" class="label"></label><input type="submit" name="update" id="Add" value=" update" class="btn btn-success form-control"style="color:#00cccc; font-size:20px; " ><br>
 
            </div>
          
    </form>
    <tr>
            <td colspan="2" bgcolor="#FF0000" height="1" align="center">
	     	   <font size="4">   
           <a href="index.jsp">BACK TO HOME</a> 
          </font>
            </td>
          </tr>
</td>
</tr>
<tr>
  
</tr>
</table>
</body>
</html>