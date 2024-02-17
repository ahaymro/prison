<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
    Connection con = null;
     Statement st = null;
      ResultSet rs = null;
      PreparedStatement pstmt=null;
       int report=0;
       int total=0;
HttpSession sessio = request.getSession();
sessio.setMaxInactiveInterval(300); // Time in Seconds
if (sessio.getAttribute("iusername") ==null && sessio.getAttribute("inspector_logged") == null) {
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
 con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
 Statement stmt = con.createStatement();
String id = request.getParameter("id");

        String sql2 = "DELETE FROM prisoner_information WHERE ssn='" + id + "'";
        int result1 = stmt.executeUpdate(sql2);
        if(result1>0){
        response.sendRedirect("update.jsp");
        out.println("<script>alert('deleted succssfully')</script>");
        }
        else{
             out.println("<script>alert('error to delete prisoner information')</script>");
        }
        
%>