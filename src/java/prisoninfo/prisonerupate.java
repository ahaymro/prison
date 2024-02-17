package prisoninfo;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class prisonerupate extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException,NumberFormatException {
        
         response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String zone = (String) session.getAttribute("zone");
      
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

            String id = request.getParameter("id_no");
            String fname = request.getParameter("fname");
            String mname = request.getParameter("mname");
            String lname = request.getParameter("lname");
            String sex = request.getParameter("sex");
            String age = request.getParameter("age");
            String height = request.getParameter("height");
            String face = request.getParameter("face");
            String education = request.getParameter("education");
            String region = request.getParameter("region");
            String parent_phone = request.getParameter("parent_phone");
             
            Part photoPart = request.getPart("photo");
            
            InputStream photoStream = photoPart.getInputStream();
             try {
             Class.forName("com.mysql.jdbc.Driver");
             con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
                pstmt = con.prepareStatement("UPDATE prisoner_information SET fname = ?, mname = ?, lname = ?, sex = ?, age = ?, height = ?, face_color = ?, education_level = ?, region = ?, parent_phone = ?, photo = ? WHERE ssn = ?");
                pstmt.setString(1, fname);
                pstmt.setString(2, mname);
                pstmt.setString(3, lname);
                pstmt.setString(4, sex);
                pstmt.setString(5, age);
                pstmt.setString(6, height);
                pstmt.setString(7, face);
                pstmt.setString(8, education);
                pstmt.setString(9, region);
                pstmt.setString(10, parent_phone);
                pstmt.setBlob(11, photoStream);
                pstmt.setString(12, id);
                int rowsAffected = pstmt.executeUpdate();

                if (rowsAffected > 0) {
                 
                    out.println("<script type=\"text/javascript\">");
                     out.println("alert('updated successfully');");
                     out.println("window.location.href = 'inspector/update.jsp';");
                     out.println("</script>");
                    
                     
                } 
               
                else {
                  out.println("<script>alert('no updated')</script>");
                
            } 
        } catch (SQLException e) {
               
            out.println("<script type=\"text/javascript\">");
                     out.println("alert('error to connect the database');");
                     out.println("window.location.href = 'inspector/upadate.jsp';");
                     out.println("</script>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(prisonerupate.class.getName()).log(Level.SEVERE, null, ex);
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