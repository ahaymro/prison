package forgot;



import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/newPassword")
public class NewPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
     PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
		String newPassword = request.getParameter("password");
		String confPassword = request.getParameter("confPassword");
		RequestDispatcher dispatcher = null;
		if (newPassword != null && confPassword != null && newPassword.equals(confPassword)) {

			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/prisoner?useSSL=false", "root",
						"");
				PreparedStatement pst = con.prepareStatement("update account set password = ? where email = ? ");
				pst.setString(1, newPassword);
				pst.setString(2, (String) session.getAttribute("email"));

				int rowCount = pst.executeUpdate();
				if (rowCount > 0) {
					request.setAttribute("status", "resetSuccess");
                                         out.println("<script type=\"text/javascript\">");
                     out.println("alert('your password is succssfully reseted');");
                     out.println("window.location.href = 'login.jsp';");
                     out.println("</script>");
					dispatcher = request.getRequestDispatcher("login.jsp");
                                        
				} else {
					request.setAttribute("status", "resetFailed");
					dispatcher = request.getRequestDispatcher("newPassword.jsp");
				}
				dispatcher.forward(request, response);
			} catch (Exception e) {
			out.println("<script type=\"text/javascript\">");
                     out.println("alert('database releted errorr');");
                     out.println("window.location.href = 'inspector/index.jsp';");
                     out.println("</script>");
			}
		}
	}

}
