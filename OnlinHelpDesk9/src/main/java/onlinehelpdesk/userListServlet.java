package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/userlist")
public class userListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			UserDBUtil o = new UserDBUtil();
			List<User> userdetails = o.getUserDetails();
			request.setAttribute("userdetails", userdetails);
			
			RequestDispatcher dis = request.getRequestDispatcher("userlist.jsp");
			dis.forward(request, response);
		
	}

}
