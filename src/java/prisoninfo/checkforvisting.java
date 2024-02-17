
package prisoninfo;



import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) // 16MB
public class checkforvisting extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException ,NumberFormatException{
        PrintWriter out = response.getWriter();
        try {
            Connection con=null;
            Statement st=null;
            
            
            
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
            st=con.createStatement();
             ResultSet rs = null;
            ResultSet rs1 = null;
            ResultSet rs3 = null;
            
            if(request.getParameter("check")!=null){
                String prisonerId = request.getParameter("prisoner_id");
                String visitor_id = request.getParameter("visitor_id");
                LocalDateTime startTime = LocalDateTime.parse(request.getParameter("start_time"),
                        DateTimeFormatter.ISO_DATE_TIME);
                LocalDateTime endTime = LocalDateTime.parse(request.getParameter("end_time"),
                        DateTimeFormatter.ISO_DATE_TIME);
                
                if (startTime.isBefore(endTime)) {
                    
                    
                    try {
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
                        st = conn.createStatement();
                        String sql = "select  *from prisoner_information where ssn='" + prisonerId + "'";
                        rs = st.executeQuery(sql);
                        if (rs.next()) {
                            String sql1 = "select *from vistor_information where ssn='" + visitor_id + "'";
                            Statement st1 = conn.createStatement();
                            rs1 = st1.executeQuery(sql1);
                            if (rs1.next()) {
                                
                                String sql3 = "SELECT *from visitor_appo WHERE prisoner_id = '" + prisonerId + "' AND end_time >='" + startTime + "' AND start_time <= '" + endTime + "'";
                                Statement st2 = conn.createStatement();
                                rs3 = st2.executeQuery(sql3);
                                          
                                if (rs3.next()) {
                                     out.println("<script type=\"text/javascript\">");
                                            out.println("alert('prisoner is reserved in this time please  come to another time');");
                                            out.println("window.location.href = 'visitor/checkforvisiting.jsp';");
                                            out.println("</script>");
                                } else {
                                    if(rs.getString("zone").equals(rs1.getString("zone"))){
                                        
                                        PreparedStatement stmt = conn.prepareStatement(
                                                "INSERT INTO visitor_appo (prisoner_id, prisoner_name, visitor_id, start_time, end_time) VALUES (?, ?, ?, ?, ?)");
                                        stmt.setString(1, rs.getString("ssn"));
                                        stmt.setString(2, rs.getString("fname"));
                                        stmt.setString(3, rs1.getString("ssn"));
                                        stmt.setObject(4, startTime);
                                        stmt.setObject(5, endTime);
                                        int qury=   stmt.executeUpdate();
                                        if(qury>0){
                                            String sql4="update  prisoner_information set status=1 where ssn='" + prisonerId + "'";
                                            Statement st3 = conn.createStatement();
                                            st3.executeUpdate(sql4);
                                            out.println("<script type=\"text/javascript\">");
                                            out.println("alert('prisoner is resreved susccssfully');");
                                            out.println("window.location.href = 'visitor/register.jsp';");
                                            
                                            out.println("</script>");
                                        }
                                    }
                                    else {
                                    
                                         out.println("<script type=\"text/javascript\">");
                                            out.println("alert('visitor  and prisoner zone is not match');");
                                            out.println("window.location.href = 'visitor/checkforvisiting.jsp';");
                                            
                                            out.println("</script>");
                                    }
                                    
                                }
                            } else {
                                out.println("<script type=\"text/javascript\">");
                                            out.println("alert('visitor is not found');");
                                            out.println("window.location.href = 'visitor/checkforvisiting.jsp';");
                                            
                                            out.println("</script>");
                               
                                
                            }
                        }
                        else {
                             out.println("<script type=\"text/javascript\">");
                                            out.println("alert('prisoner is not found');");
                                            out.println("window.location.href = 'visitor/checkforvisiting.jsp';");
                                            
                                            out.println("</script>");
                            
                            
                        }
                        
                    } catch (SQLException e) {
                      
                             out.println("<script type=\"text/javascript\">");
                                            out.println("alert(' database error');");
                                            out.println("window.location.href = 'visitor/checkforvisiting.jsp';");
                                            
                                            out.println("</script>");
                    } finally {
                        try {
                            if (rs3 != null) {
                                rs3.close();
                            }
                            if (rs1 != null) {
                                rs1.close();
                            }
                            if (rs != null) {
                                rs.close();
                            }
                        } catch (SQLException e) {
                            out.println(e);
                        }
                    }
                }
                else{
                     out.println("<script type=\"text/javascript\">");
                                            out.println("alert('startTime shoud be less than endtime!');");
                                            out.println("window.location.href = 'visitor/checkforvisiting.jsp';");
               
                                            out.println("</script>");
                }
            }
            else{

                
            }       } catch (SQLException ex) {
            Logger.getLogger(checkforvisting.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
