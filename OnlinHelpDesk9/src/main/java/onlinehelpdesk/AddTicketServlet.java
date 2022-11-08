package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/y_insert")
public class AddTicketServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String id = request.getParameter("id");
		String contact = request.getParameter("contact");
		String subject = request.getParameter("subject");
		String description = request.getParameter("description");
		
		
		TicketdbUtil ticket = new TicketdbUtil();
		
		boolean isTrue;
		
		isTrue = ticket.addticket(name, email, id, contact, subject, description);
		
		
		
		if(isTrue == true) {
			RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
			request.setAttribute("ticket", "ticketadded");
			dis.forward(request, response);
		} else {
			RequestDispatcher dis2 = request.getRequestDispatcher("addticket.jsp");
			request.setAttribute("ticket", "ticketnotadded");
			dis2.forward(request, response);
		}
		
	}

}
