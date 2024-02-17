<%@ page import="java.sql.*" %>
<%
  ResultSet rs=null;
    String sql=null;

Connection con = con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
sql = "update account set status='0' where id='" + request.getParameter("id") + "'";
Statement stmt = con.createStatement();
int result = stmt.executeUpdate(sql);

if (result > 0) {
   
     sql = "select  *from account where id='" +request.getParameter("id") + "'";
         rs = stmt.executeQuery(sql);
         if(rs.next()){
         
         sql="insert into deaccount(ssn,password,status,username) values('" +rs.getString("ssn") + "','" +rs.getString("password") + "','0','" +rs.getString("username") + "') ";
      int result2= stmt.executeUpdate(sql);
      if(result2>0){
        response.sendRedirect("deactivate.jsp");
      
      
      }
         }
    
} else {
    response.sendRedirect("deactivated.jsp");
}
%>