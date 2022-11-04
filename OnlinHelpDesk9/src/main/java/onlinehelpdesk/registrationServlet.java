package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/reg")
public class registrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String uname = request.getParameter("uname");
		String uemail = request.getParameter("uemail");
		String umobile = request.getParameter("umobile");
		String upw = request.getParameter("upw");
		
		boolean isTrue;
		
		//for redirect after adding the data to the table
		RequestDispatcher dispatcher = null;
		
		UserDBUtil o = new UserDBUtil();
		isTrue = o.insertuser(uname, uemail, umobile, upw);
		
		if (isTrue == true) {
			
			request.setAttribute("status", "success");
			dispatcher = request.getRequestDispatcher("register.jsp");
			
		}else {
			
			request.setAttribute("status", "failed");
			
		}
		
		dispatcher.forward(request, response);
		
	}

}
