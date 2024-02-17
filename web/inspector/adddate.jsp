<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>

<%
Connection con = null;
PreparedStatement stmt = null;
try {
    // Connect to the database
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/adddate", "root", "");

    // Calculate the date to insert
    Calendar cal = Calendar.getInstance();
    cal.add(Calendar.DATE, 10);
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    String date = sdf.format(cal.getTime());

    // Prepare the SQL statement
    String sql = "INSERT INTO date(date) VALUES (adddate(?, interval 10 day))";
    stmt = con.prepareStatement(sql);
    stmt.setString(1, date);

    // Execute the SQL statement
    int rows = stmt.executeUpdate();
    if (rows > 0) {
        out.println("Inserted");
    } else {
        out.println("Try again");
    }
} catch (Exception e) {
    e.printStackTrace();
    out.println("Error: " + e.getMessage());
} finally {
    // Close the database connection and statement
    try {
        if (stmt != null) {
            stmt.close();
        }
        if (con != null) {
            con.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>