package prisoninfo;



import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) // 16MB
public class createAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException ,NumberFormatException{
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String serialNo = request.getParameter("ssn");
        String password = request.getParameter("password");
        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String sex = request.getParameter("sex");
        int age = Integer.parseInt(request.getParameter("age"));
        String zone = request.getParameter("zone");
        String password1 = request.getParameter("password1");
        String accountType = request.getParameter("user_type");
         String email = request.getParameter("email");
 String phot = request.getParameter("photo");
        // Get photo
      Part photo = request.getPart("photo");
        
        // Check form data
        if (fname.isEmpty() || lname.isEmpty() || serialNo.isEmpty()) {
           
             out.println("<script type=\"text/javascript\">");
                     out.println("alert('please fill the form');");
                     out.println("window.location.href = 'admin/create.jsp';");
                     out.println("</script>");
        }

        if (age < 21) {
           
                     out.println("<script type=\"text/javascript\">");
                     out.println("alert('please Enter Valid Age Age must be greater 21');");
                     out.println("window.location.href = 'admin/create.jsp';");
                     out.println("</script>");
        }

        if (!password.equals(password1)) {
         
            out.println("<script type=\"text/javascript\">");
                     out.println("alert('coniformation password is not correct!');");
                     out.println("window.location.href = 'admin/create.jsp';");
                     out.println("</script>");  
            return;
        }

        // Create database connection
        Connection conn = null;
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        PreparedStatement stmt3 = null;
        PreparedStatement stmt4 = null;

        try {
                Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
            // Insert into account table
            

            // Insert into corresponding information table
            if (accountType.equals("comissioner")) {
                String sql2 = "INSERT INTO comissioner_information(fname, ssn, lname, sex, age, zone, photo) VALUES (?, ?, ?, ?, ?, ?, ?)";
                stmt2 = conn.prepareStatement(sql2);
                stmt2.setString(1, fname);
                stmt2.setString(2, serialNo);
                stmt2.setString(3, lname);
                stmt2.setString(4, sex);
                stmt2.setInt(5, age);
                stmt2.setString(6, zone);
                InputStream is = photo.getInputStream();
                stmt2.setBlob(7, is);
                stmt2.executeUpdate();
             String sql1 = "INSERT INTO account(ssn, username,email, password, zone, account_type, status) VALUES (?, ?, ?, ?, ?, ?,?)";
            stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, serialNo);
            stmt1.setString(2, fname);
            stmt1.setString(3, email);
            stmt1.setString(4, password);
            stmt1.setString(5, zone);
            stmt1.setString(6, accountType);
            stmt1.setInt(7, 1);
            stmt1.executeUpdate();
            } else if (accountType.equals("inspector")) {
                String sql2 = "INSERT INTO inspector_information(ssn, fname, lname, sex, age, zone, photo) VALUES (?, ?, ?, ?, ?, ?, ?)";
                stmt2 = conn.prepareStatement(sql2);
                stmt2.setString(1, serialNo);
                stmt2.setString(2, fname);
                stmt2.setString(3, lname);
                stmt2.setString(4, sex);
                stmt2.setInt(5, age);
                stmt2.setString(6, zone);
               InputStream is = photo.getInputStream();
                stmt2.setBlob(7, is);
                stmt2.executeUpdate();
           String sql1 = "INSERT INTO account(ssn, username,email, password, zone, account_type, status) VALUES (?,?, ?, ?, ?, ?, ?)";
            stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, serialNo);
            stmt1.setString(2, fname);
              stmt1.setString(3, email);
            stmt1.setString(4, password);
            stmt1.setString(5, zone);
            stmt1.setString(6, accountType);
            stmt1.setInt(7, 1);
            stmt1.executeUpdate();
            } else if (accountType.equals("policeofficer")) {
                String sql2 = "INSERT INTO policeofficer_information(fname, lname, ssn, sex, age, zone, photo) VALUES (?, ?, ?, ?, ?, ?, ?)";
                stmt2 = conn.prepareStatement(sql2);
                stmt2.setString(1, fname);
                stmt2.setString(2, lname);
                stmt2.setString(3, serialNo);
                stmt2.setString(4, sex);
                stmt2.setInt(5, age);
                stmt2.setString(6, zone);
                InputStream is = photo.getInputStream();
                stmt2.setString(7, phot);
                stmt2.executeUpdate();
             String sql1 = "INSERT INTO account(ssn, username,email, password, zone, account_type, status) VALUES (?,?, ?, ?, ?, ?, ?)";
            stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, serialNo);
            stmt1.setString(2, fname);
              stmt1.setString(3, email);
            stmt1.setString(4, password);
            stmt1.setString(5, zone);
            stmt1.setString(6, accountType);
            stmt1.setInt(7, 1);
            stmt1.executeUpdate();
            } else if (accountType.equals("adminstrator")) {
                String sql2 = "INSERT INTO admin_info(ssn, fname, lname, sex, age, photo) VALUES (?, ?, ?, ?, ?, ?)";
                stmt2 = conn.prepareStatement(sql2);
                stmt2.setString(1, serialNo);
                stmt2.setString(2, fname);
                stmt2.setString(3, lname);
                stmt2.setString(4, sex);
                stmt2.setInt(5, age);
                InputStream is = photo.getInputStream();
                stmt2.setBlob(6, is);
                stmt2.executeUpdate();
            String sql1 = "INSERT INTO account(ssn, username,email, password, zone, account_type, status) VALUES (?, ?, ?, ?, ?, ?,?)";
            stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, serialNo);
            stmt1.setString(2, fname);
              stmt1.setString(3, email);
            stmt1.setString(4, password);
            stmt1.setString(5, zone);
            stmt1.setString(6, accountType);
            stmt1.setInt(7, 1);
            stmt1.executeUpdate();
            } else if (accountType.equals("visitor")) {
                String sql2 = "INSERT INTO vistor_information(fname, lname, ssn, sex, age, zone, photo) VALUES (?, ?, ?, ?, ?, ?, ?)";
                stmt2 = conn.prepareStatement(sql2);
                stmt2.setString(1, fname);
                stmt2.setString(2, lname);
                stmt2.setString(3, serialNo);
                stmt2.setString(4, sex);
                stmt2.setInt(5, age);
                stmt2.setString(6, zone);
                InputStream is = photo.getInputStream();
                stmt2.setBlob(7, is);
                stmt2.executeUpdate();
                
            String sql1 = "INSERT INTO account(ssn, username,email, password, zone, account_type, status) VALUES (?, ?, ?, ?, ?, ?,?)";
            stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, serialNo);
            stmt1.setString(2, fname);
              stmt1.setString(3, email);
            stmt1.setString(4, password);
            stmt1.setString(5, zone);
            stmt1.setString(6, accountType);
            stmt1.setInt(7, 1);
            stmt1.executeUpdate();
            }
                  out.println("<script type=\"text/javascript\">");
                     out.println("alert('registered successfully');");
                     out.println("window.location.href = 'admin/create.jsp';");
                     out.println("</script>");      
     
            
        } catch (SQLException e) {
              
            out.println("<script type=\"text/javascript\">");
                     out.println("alert('error to connect the database');");
                     out.println("window.location.href = 'admin/create.jsp';");
                     out.println("</script>");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(createAccount.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            // Close database resources
            try {
                if (stmt1 != null) {
                    stmt1.close();
                }
                if (stmt2 != null) {
                    stmt2.close();
                }
                if (stmt3 != null) {
                    stmt3.close();
                }
                if (stmt4 != null) {
                    stmt4.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
