<%@ page import="java.sql.*" %>
<%
    String sql =null;
Connection con = con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
sql = "update account set status='1' where ssn='" + request.getParameter("id") + "'";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if (result > 0) {
     sql = "delete  from deaccount where ssn='" + request.getParameter("id") + "'";
int result1 = stmt.executeUpdate(sql);
if(result1>0){
    response.sendRedirect("activate.jsp");
}
} else {
    response.sendRedirect("deactivate.jsp");
}
%>