package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/delete")
public class deleteUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				//getting the user inputs
				String deletedataid = request.getParameter("deletedataid");
				
				//making a dispatcher object to redirect
				RequestDispatcher dispatcher = null;
				
				//to catch the boolean value that returns from the util class
				boolean isTrue;
				
				//creating a object from util class to access the method
				UserDBUtil o = new UserDBUtil();
				
				
				//passing the return value of the method
				isTrue = o.deleteUser(deletedataid);
				
				if (isTrue == true) {
				
				request.setAttribute("status", "deleted");
				HttpSession session = request.getSession();
				
				session.invalidate();
				dispatcher = request.getRequestDispatcher("register.jsp");
				
				}else {
					
				request.setAttribute("status", "notdeleted");
				dispatcher = request.getRequestDispatcher("acc.jsp");
				
				}
				//finalizing the dispatcher
				dispatcher.forward(request, response);
		
	}
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String deletedataid = req.getParameter("deletedataid");
		System.out.println(deletedataid);
	}

}
