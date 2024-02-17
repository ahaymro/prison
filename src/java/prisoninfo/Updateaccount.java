package prisoninfo;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.io.IOException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

@WebServlet("/Updatedaccount")
@MultipartConfig(maxFileSize = 16177215)
public class Updateaccount extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Connection con;

    public Updateaccount() {
        super();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
   HttpSession  session  = request.getSession(true);
   
         if (session.getAttribute("admin_logged") == null) {
        // response.sendRedirect("../login.jsp");
    } 
        PreparedStatement pstmt = null;
     Connection con = null;
        Statement stmt=null;
 ResultSet rs=null;

      

         
                String accountType = null;
                String fname = request.getParameter("fname");
                String lname = request.getParameter("lname");
                String sex = request.getParameter("sex");
                int age = Integer.parseInt(request.getParameter("age"));
                InputStream inputStream = null;
                Part filePart = request.getPart("photo");

                if (filePart != null) {
                    inputStream = filePart.getInputStream();
                }
                 try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");

                String sql = "SELECT account_type FROM account WHERE ssn=?";
                
                pstmt = con.prepareStatement(sql);
                pstmt.setString(1, request.getParameter("id"));
                rs = pstmt.executeQuery();
              

                if (rs.next()) {
                    accountType = rs.getString("account_type");

                    if (accountType.equals("comissioner")) {
                        sql = "UPDATE comissioner_information SET fname=?, lname=?, sex=?, age=?, photo=? WHERE ssn=?";
                    } else if (accountType.equals("policeofficer")) {
                        sql = "UPDATE policeofficer_information SET fname=?, lname=?, sex=?, age=?, photo=? WHERE ssn=?";
                    } else if (accountType.equals("inspector")) {
                        sql = "UPDATE inspector_information SET fname=?, lname=?, sex=?, age=?, photo=? WHERE ssn=?";
                    } else if (accountType.equals("adminstrator")) {
                        sql = "UPDATE admin_info SET fname=?, lname=?, sex=?, age=?, photo=? WHERE ssn=?";
                    }
                   else if (accountType.equals("visitor")) {
                         sql = "UPDATE vistor_information SET fname=?, lname=?, sex=?, age=?, photo=? WHERE ssn=?";
                    }
                    pstmt = con.prepareStatement(sql);
                    pstmt.setString(1, fname);
                    pstmt.setString(2, lname);
                    pstmt.setString(3, sex);
                    pstmt.setInt(4, age);

                    if (inputStream != null) {
                        pstmt.setBlob(5, inputStream);
                    }

                    pstmt.setString(6, request.getParameter("id"));
                    int result = pstmt.executeUpdate();

                    if (result > 0) {
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('updated successfully');");
                     out.println("window.location.href = 'admin/update.jsp';");
                     out.println("</script>");
                    
                }
            }else{
                
                   out.println("<script type=\"text/javascript\">");
                   out.println("alert('not updated ');");
                   out.println("window.location.href = 'admin/update.jsp';");
                   out.println("</script>");
                    
                }
                
        } catch (Exception e) {
               
            out.println("<script type=\"text/javascript\">");
                     out.println("alert('error to connect the database');");
                     out.println("window.location.href = 'admin/update.jsp';");
                     out.println("</script>");
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }

                if (pstmt != null) {
                    pstmt.close();
                }

                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    
    }

   

}
