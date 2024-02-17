<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.*" %>
<%
  Connection con = null;
Statement stmt = null;
ResultSet rs = null;
HttpSession sessio = request.getSession();
String zone = (String) sessio.getAttribute("zone");
Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
       stmt = con.createStatement();
       

String sql = "select  *from forgive WHERE id='" +request.getParameter("id")+ "'";

ResultSet query = stmt.executeQuery(sql);

query.next();

String sql1 = "INSERT INTO policeofficer_message(sender,message,zone,status,date) VALUES ('comissioner','your forgive is not accepted!','"+zone+"','0','" + new java.sql.Date(System.currentTimeMillis()) + "')";
int query1 = stmt.executeUpdate(sql1);

if (query1 > 0) { 
  
    String sql2 = "UPDATE forgive SET status='1' WHERE id='" + request.getParameter("id") + "'";
   
    int query2 = stmt.executeUpdate(sql2);

    if (query2 > 0) {
        response.sendRedirect("readforgive.jsp");
    } else {
        //response.sendRedirect("readforgive.jsp");
    }

}else {
    response.sendRedirect("readforgive.jsp");
}
%>





