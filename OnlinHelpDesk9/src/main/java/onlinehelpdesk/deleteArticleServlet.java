package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/delete")

public class deleteArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id"));
		boolean isTrue;
		
		ArticleDBUtil dbutil = new ArticleDBUtil();
		isTrue = dbutil.deleteArticle(id);
		
		if(isTrue == true) {
			
			RequestDispatcher dis = request.getRequestDispatcher("home.jsp");
			dis.forward(request, response);
			
		}
		
		else{
			
			RequestDispatcher dis = request.getRequestDispatcher("unsuccess.jsp");
			dis.forward(request, response);
			}
		
	}

}
