/*/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package prisoninfo;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;



import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(maxFileSize = 16177215) // 16MB
public class register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
        
        PrintWriter out = response.getWriter();

        // Get form data
        
   
        

        // Get form data
        String serialNo = request.getParameter("id_no");
        String fname = request.getParameter("fname");
         String mname = request.getParameter("mname");
        String lname = request.getParameter("lname");
        
         int age = Integer.parseInt(request.getParameter("age"));
        String sex = request.getParameter("sex");
        String crimetype = request.getParameter("crimetype");
           String education = request.getParameter("education");
        String zone = request.getParameter("zone");
        double hight=Double.parseDouble(request.getParameter("height"));
         String face = request.getParameter("face");
          String region = request.getParameter("region");
          String phone = request.getParameter("parent_phone");
           int stay=Integer.parseInt(request.getParameter("stay"));
            String year = request.getParameter("year");
           
              Part photo = request.getPart("photo");
                  InputStream photoStream = photo.getInputStream();
    LocalDate currentDate = LocalDate.now();
    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
    String formattedDate = currentDate.format(formatter);
    
         double styee=stay*0.67;
         
String dateStr = "";
Calendar cal = Calendar.getInstance();
if (year.equals("year")) {
   
    cal.add(Calendar.YEAR, (int)styee);
    double decimalPart = styee - (int) styee;
    double months = (decimalPart * 12);
     cal.add(Calendar.MONTH, (int)months );
     double decimalPart1= months-(int)months;
     double days =  (decimalPart1 * 30);
    cal.add(Calendar.DAY_OF_MONTH, (int)days);
    
    dateStr = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
} else if (year.equals("month")) {
  
    cal.add(Calendar.MONTH, (int)styee);
     double decimalPart = styee - (int) styee;
    double days =  (decimalPart * 30);
    cal.add(Calendar.DAY_OF_MONTH, (int)days);
    dateStr = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
}
Date releaseDate = cal.getTime();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
  String formattedDa= dateFormat.format(releaseDate);
        
        // Check form data
     if (hight < 0 && stay<0 ) {
         
               out.println("<script type=\"text/javascript\">");
                     out.println("alert('please enter valid hight or stay in prison');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
        }

        if (age < 18) {
         
               out.println("<script type=\"text/javascript\">");
                     out.println("alert('please Enter Valid Age Age must be greater 18');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
        }
       
        Connection conn = null;
        
        PreparedStatement stmt1 = null;
        PreparedStatement stmt2 = null;
        PreparedStatement stmt3 = null;
        PreparedStatement stmt4 = null;
         Statement st=null;
         ResultSet rs = null;
    ResultSet rs1 = null;
    ResultSet rs2 = null;
     String sql =null;
     int query=0;
        try {
              Class.forName("com.mysql.jdbc.Driver");
             conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner", "root", "");
        
        int i=1;
    sql="select max(dorm_no) as maximum from prisoner_information where zone='"+zone+"' and sex='"+sex+"'";
    st = conn.createStatement();
        rs1 = st.executeQuery(sql);
        if(rs1.next()){
        int maximum=rs1.getInt("maximum");
        if(maximum==0)
        {
        
            String sql1 = "INSERT INTO prisoner_information(ssn, fname, mname, lname, sex, age, zone,height,face_color, photo, education_level, region, crimetype, parent_phone, tsp, tcp,dorm_no,status) VALUES (?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
            stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, serialNo);
            stmt1.setString(2, fname);
            stmt1.setString(3, mname);
            stmt1.setString(4, lname);
            stmt1.setString(5, sex);
            stmt1.setInt(6, age);
             stmt1.setString(7, zone);
             stmt1.setDouble(8, hight);
              stmt1.setString(9, face);
                stmt1.setBlob(10, photoStream);
                  stmt1.setString(11, education);
                  stmt1.setString(12, region);
                       stmt1.setString(13, crimetype);
                    stmt1.setString(14, phone);
                      stmt1.setString(15, formattedDate );
                         stmt1.setString(16, dateStr );
                          stmt1.setInt(17, i); 
                           stmt1.setInt(18, 0); 
         query=  stmt1.executeUpdate();
        if (query>0){
            out.println("<script type=\"text/javascript\">");
                     out.println("alert('registered successfully');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
        }
        else{
         out.println("<script type=\"text/javascript\">");
                     out.println("alert('not registered ');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
        
        
        }
        
        }
       sql="select count(dorm_no) as total from prisoner_information where dorm_no='"+maximum+"' and zone='"+zone+"' and sex='"+sex+"'";
       Statement st1 = conn.createStatement();
        rs2 = st1.executeQuery(sql);
        if(rs2.next()){
            int total=rs2.getInt("total");
            if(total==6){
             int  plus=maximum+1;
             String sql1 = "INSERT INTO prisoner_information(ssn, fname, mname, lname, sex, age, zone,height,face_color, photo, education_level, region, crimetype, parent_phone, tsp, tcp,dorm_no,status) VALUES (?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
            stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, serialNo);
            stmt1.setString(2, fname);
            stmt1.setString(3, mname);
            stmt1.setString(4, lname);
            stmt1.setString(5, sex);
            stmt1.setInt(6, age);
             stmt1.setString(7, zone);
             stmt1.setDouble(8, hight);
              stmt1.setString(9, face);
                stmt1.setBlob(10, photoStream);
                  stmt1.setString(11, education);
                  stmt1.setString(12, region);
                       stmt1.setString(13, crimetype);
                    stmt1.setString(14, phone);
                      stmt1.setString(15, formattedDate );
                         stmt1.setString(16, dateStr );
                          stmt1.setInt(17, plus); 
                           stmt1.setInt(18, 0 ); 
         query=  stmt1.executeUpdate();
        if (query>0){
            out.println("<script type=\"text/javascript\">");
                     out.println("alert('registered successfully');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
        }
        else{
         out.println("<script type=\"text/javascript\">");
                     out.println("alert('not registered ');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
        
        
        }
     
                         }
            else{
            
            String sql1 = "INSERT INTO prisoner_information(ssn, fname, mname, lname, sex, age, zone,height,face_color, photo, education_level, region, crimetype, parent_phone, tsp, tcp,dorm_no,status) VALUES (?,?,?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
            stmt1 = conn.prepareStatement(sql1);
            stmt1.setString(1, serialNo);
            stmt1.setString(2, fname);
            stmt1.setString(3, mname);
            stmt1.setString(4, lname);
            stmt1.setString(5, sex);
            stmt1.setInt(6, age);
             stmt1.setString(7, zone);
             stmt1.setDouble(8, hight);
              stmt1.setString(9, face);
                stmt1.setBlob(10, photoStream);
                  stmt1.setString(11, education);
                  stmt1.setString(12, region);
                       stmt1.setString(13, crimetype);
                    stmt1.setString(14, phone);
                      stmt1.setString(15, formattedDate );
                         stmt1.setString(16, dateStr );
                          stmt1.setInt(17, maximum); 
                           stmt1.setInt(18, 0 ); 
         query=  stmt1.executeUpdate();
        if (query>0){
            out.println("<script type=\"text/javascript\">");
                     out.println("alert('registered successfully');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
        }
        else{
         out.println("<script type=\"text/javascript\">");
                     out.println("alert('not registered ');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
        
        
        }
     
            
            }
            
        }
        
       
        
        }
    
    
      } catch (SQLException e) {
            
         
                   out.println("<script type=\"text/javascript\">");
                     out.println("alert('database releted errorr');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
           
        } catch (ClassNotFoundException ex) {
           // Logger.getLogger(Account.class.getName()).log(Level.SEVERE, null, ex);
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
            }
        }
    }
}
