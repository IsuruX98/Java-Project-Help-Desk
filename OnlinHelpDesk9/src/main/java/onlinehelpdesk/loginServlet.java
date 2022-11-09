package onlinehelpdesk;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		//getting the user inputs
		String uemail = request.getParameter("uname");
		String upw = request.getParameter("upw");
		
		//creating a session
		HttpSession session = request.getSession();
		
		//making a dispatcher object to redirect
		RequestDispatcher dis = null;
		
		//validations
				if (uemail == null || uemail.equals("")) {
					request.setAttribute("status", "invalidemail");
					dis = request.getRequestDispatcher("login.jsp");
					dis.forward(request, response);
				}
				if (upw == null || upw.equals("")) {
					request.setAttribute("status", "invalidupwd");
					dis = request.getRequestDispatcher("login.jsp");
					dis.forward(request, response);
				}
				//to catch the boolean value that returns from the util class
				boolean isTrue;
				
				//creating a object from util class to access the method
				UserDBUtil o = new UserDBUtil();
				
				//passing the return value of the method
		        isTrue = o.validateUser(uemail, upw);
		      	
		      	
				if (UserDBUtil.userCheck == true) {
					
					//creating the session
					
					int id = Integer.parseInt(UserDBUtil.user.get("id"));
					String name = UserDBUtil.user.get("name");
					String email = UserDBUtil.user.get("email");
					String mobile = UserDBUtil.user.get("mobile");
					String pw = UserDBUtil.user.get("pw");
					
					session.setAttribute("id", id);
					session.setAttribute("name", name);
					session.setAttribute("email", email);
					session.setAttribute("mobile", mobile);
					session.setAttribute("pw", pw);
					
					
					request.setAttribute("status", "pass");
					//redirect to another page
					dis = request.getRequestDispatcher("adminHome.jsp");
				
				}else if (isTrue == true) {
					
					//creating the session
					
					int id = Integer.parseInt(UserDBUtil.user.get("id"));
					String name = UserDBUtil.user.get("name");
					String email = UserDBUtil.user.get("email");
					String mobile = UserDBUtil.user.get("mobile");
					String pw = UserDBUtil.user.get("pw");
					
					session.setAttribute("id", id);
					session.setAttribute("name", name);
					session.setAttribute("email", email);
					session.setAttribute("mobile", mobile);
					session.setAttribute("pw", pw);
					
					request.setAttribute("status", "pass");
					//redirect to another page
					dis = request.getRequestDispatcher("index.jsp");
				
				}else {
					request.setAttribute("status", "failed");
					dis = request.getRequestDispatcher("login.jsp");
				}
				//finalizing the dispatcher
				dis.forward(request, response);
					
		
	}

}
