
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
String sql = "update policeofficer_message  set status='1' where id='" + request.getParameter("id") + "'";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);
if (result > 0) {
    response.sendRedirect("inbox1.jsp");
} else {
    out.println("no");
}
%>