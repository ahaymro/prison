
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.sql.Blob"%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page import="java.io.*" %>


<%
    Connection con=null;
    Statement st=null;
      ResultSet rs = null;
   // Date currentDate = new Date();
   SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//String currentTime = dateFormat.format(currentDate);;
java.util.Date currentDate = new java.util.Date();
  java.sql.Timestamp currentTimestamp = new java.sql.Timestamp(currentDate.getTime());
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
 Statement stmt = con.createStatement();
 
String id = request.getParameter("id");
        String sql2 = "DELETE FROM visitor_appo WHERE end_time  < '" +currentTimestamp + "'";
        int result1 = stmt.executeUpdate(sql2);
        if(result1>0){
          String sql3 = "update prisoner_information set status=0  WHERE ssn='" +id+ "'";
         stmt.executeUpdate(sql3);
        response.sendRedirect("view_visitor.jsp");
     
        }
        else{
                    out.println("<script type=\"text/javascript\">");
                     out.println("alert('prisoner still  reserved');");
                     out.println("window.location.href = 'view_visitor.jsp';");
                     out.println("</script>");
                    
        } 
        
        
%>