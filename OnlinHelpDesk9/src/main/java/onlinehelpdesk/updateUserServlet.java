package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/update")
public class updateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = request.getParameter("id");
		String name = request.getParameter("uname");
		String email = request.getParameter("uemail");
		String mobile = request.getParameter("umobile");
		String upw = request.getParameter("upw");
		
		
		
		//for redirect after adding the data to the table
		RequestDispatcher dispatcher = null;
		
		
		
		boolean isTrue;
			
		UserDBUtil o = new UserDBUtil();
		isTrue = o.updateUser(id, name, email, mobile, upw);
		
		if (isTrue == true) {
			
			request.setAttribute("status", "updatedone");
			dispatcher = request.getRequestDispatcher("login.jsp");
			
		}else {
			
			request.setAttribute("status", "updatefailed");
			dispatcher = request.getRequestDispatcher("updateuser.jsp");
			
		}
		dispatcher.forward(request, response);
		
		
	  

   }

}
