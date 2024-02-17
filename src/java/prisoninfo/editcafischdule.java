package prisoninfo;


import java.io.*;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class editcafischdule extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           PrintWriter out = response.getWriter();
        
        HttpSession session = request.getSession();
        if (session.getAttribute("policeofficer_logged") == null) {
            //response.sendRedirect("../login.jsp");
            //return;
        }
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
                    Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
            String sql = "SELECT * FROM schedule WHERE id=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, request.getParameter("id"));
            rs = ps.executeQuery();
            if (rs.next()) {
                String orderedtype = rs.getString("orderedtype");
                if (orderedtype.equals("kurs") || orderedtype.equals("misa") || orderedtype.equals("erat")) {
                    String eating_time = request.getParameter("eating_time");
                    String monday = request.getParameter("monday");
                    String tuesday = request.getParameter("tusday");
                    String wednesday = request.getParameter("wednsday");
                    String thursday = request.getParameter("thursday");
                    String friday = request.getParameter("friday");
                    String saturday = request.getParameter("saturday");
                    String sunday = request.getParameter("sunday");
                    sql = "UPDATE schedule SET eating_time=?, monday=?, tusday=?, wednsday=?, thursday=?, friday=?, saturday=?, sunday=? WHERE id=?";
                    ps = con.prepareStatement(sql);
                    ps.setString(1, eating_time);
                    ps.setString(2, monday);
                    ps.setString(3, tuesday);
                    ps.setString(4, wednesday);
                    ps.setString(5, thursday);
                    ps.setString(6, friday);
                    ps.setString(7, saturday);
                    ps.setString(8, sunday);
                    ps.setString(9, request.getParameter("id"));
                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                      out.println("<script type=\"text/javascript\">");
                     out.println("alert('updated successfully');");
                     out.println("window.location.href = 'policeofficer/updatecafteria.jsp';");
                     out.println("</script>");
                    }
                    
                   
                }
                  
            }
          
        } catch (SQLException e) {
                  
            out.println("<script type=\"text/javascript\">");
                     out.println("alert('error to connect the database');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(editcafischdule.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
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

