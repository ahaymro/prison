<%@ page import="java.sql.*" %>
<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
String sql = "update feedback set status='1' where id='" + request.getParameter("id") + "'";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if (result > 0) {
    response.sendRedirect("readfeedback.jsp");
} else {
    out.println("no");
}
%>