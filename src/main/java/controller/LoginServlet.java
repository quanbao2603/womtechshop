package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import dao.UsersDAO;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login-servlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String error = "";

		UsersDAO usersDAO = new UsersDAO();
		
		if (!usersDAO.isUsernameExists(username)) {
			error = "Sai tên đăng nhập hoặc mật khẩu";
			request.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("/page/user/Login.jsp");
			rd.forward(request, response);
		} else {
			if (usersDAO.isLoginValid(username, password)) {
				
				response.sendRedirect(request.getContextPath() + "/Index.jsp");
			} else {
				error = "Sai tên đăng nhập hoặc mật khẩu";
				request.setAttribute("error", error);
				RequestDispatcher rd = request.getRequestDispatcher("/page/user/Login.jsp");
				rd.forward(request, response);
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
