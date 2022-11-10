package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/updatedata")
public class UpdateArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int id = Integer.parseInt(request.getParameter("id"));
		String adminID = request.getParameter("adminid");
		String subject = request.getParameter("sub");
		String description = request.getParameter("dis");
		
		boolean isTure;
		
		ArticleDBUtil dbutil = new ArticleDBUtil();
		
		isTure = dbutil.updateArticle(id,adminID, subject, description);
		
		if(isTure == true) {
			RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
			dis.forward(request, response);
		}
		
		else {
			RequestDispatcher dis = request.getRequestDispatcher("Unsuccess.jsp");
			dis.forward(request, response);
		}
	
	}

}
