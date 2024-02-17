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
if (sessio.getAttribute("ausername") ==null && sessio.getAttribute("admin_logged") == null) {
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
String sql1 = "SELECT * FROM account WHERE ssn='" + id + "'";
ResultSet rs1 = stmt.executeQuery(sql1);
if(rs1.next()) {
    String user = rs1.getString("account_type");
    if(user.equals("inspector")) {
        String sql2 = "DELETE FROM inspector_information WHERE ssn='" + id + "'";
        int result1 = stmt.executeUpdate(sql2);
        if(result1 > 0) {
            String sql3 = "DELETE FROM account WHERE ssn='" + id + "'";
            int result2 = stmt.executeUpdate(sql3);
            if(result2 > 0) {
                response.sendRedirect("delete.jsp");
                out.println("<script>alert('success');</script>");
            } else {
                out.println("unknown id_number");
            }
        } else {
            out.println("unknown id");
        }
    } else if(user.equals("comissioner")) {
        String sql2 = "DELETE FROM comissioner_information WHERE ssn='" + id + "'";
        int result1 = stmt.executeUpdate(sql2);
        if(result1 > 0) {
            String sql3 = "DELETE FROM account WHERE ssn='" + id + "'";
            int result2 = stmt.executeUpdate(sql3);
            if(result2 > 0) {
                response.sendRedirect("delete.jsp");
                out.println("<script>alert('deleted');</script>");
            } else {
                out.println("unknown serial_number");
            }
        } else {
            out.println("unknown serial_no");
        }
    }else if(user.equals("policeofficer")) {
        String sql2 = "DELETE FROM policeofficer_information WHERE ssn='" + id + "'";
        int result1 = stmt.executeUpdate(sql2);
        if(result1 > 0) {
            String sql3 = "DELETE FROM account WHERE ssn='" + id + "'";
            int result2 = stmt.executeUpdate(sql3);
            if(result2 > 0) {
                response.sendRedirect("delete.jsp");
                out.println("<script>alert('deleted');</script>");
            } else {
                out.println("unknown serial_number");
            }
        } else {
            out.println("unknown serial_no");
        }
    } else if(user.equals("visitor")) {
        String sql2 = "DELETE FROM vistor_information WHERE ssn='" + id + "'";
        int result1 = stmt.executeUpdate(sql2);
        if(result1 > 0) {
            String sql3 = "DELETE FROM account WHERE ssn='" + id + "'";
            int result2 = stmt.executeUpdate(sql3);
            if(result2 > 0) {
                response.sendRedirect("delete.jsp");
                out.println("<script>alert('deleted');</script>");
            } else {
                out.println("unknown serial_number");
            }
        } else {
            out.println("unknown serial_no");
        }
    }else if(user.equals("adminstrator")) {
        String sql2 = "DELETE FROM admin_info WHERE ssn='" + id + "'";
        int result1 = stmt.executeUpdate(sql2);
        if(result1 > 0) {
            String sql3 = "DELETE FROM account WHERE ssn='" + id + "'";
            int result2 = stmt.executeUpdate(sql3);
            if(result2 > 0) {
                response.sendRedirect("delete.jsp");
                out.println("<script>alert('deleted');</script>");
            } else {
                out.println("unknown serial_number");
            }
        } else {
            out.println("unknown serial_no");
        }
    } else {
        response.sendRedirect("delete.jsp");
    }
} else {
    out.println("the serial number is not presented");
}
%>