<%
   
    HttpSession sessio = request.getSession(false);
    if (sessio != null) {
        // Invalidate the session
        sessio.invalidate();
    }
  
 response.sendRedirect("../index.jsp");
   
%>