package controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.Role;
import model.Users;
import util.Encryption;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.util.UUID;

import dao.UsersDAO;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/register-servlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String EMAIL_REGEX = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
	private static final String USERNAME_REGEX = "^[a-zA-Z0-9._-]{4,20}$";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/page/user/Register.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String re_password = request.getParameter("re_password");
		String email = request.getParameter("email");
		String error = validateInput(username, password, re_password, email);
		System.out.println("error = " + error);
		UsersDAO usersDAO = new UsersDAO();
		if (error == null) {
			if (usersDAO.isUsernameExists(username)) {
				error = "Tên đăng nhập đã tồn tại.";
			} else if (usersDAO.isEmailExists(email)) {
				error = "Email đã được đăng ký.";
			}
		}
		if (error == null) {
			String userId = UUID.randomUUID().toString();
			Role role = new Role("001", "customer", "Khách hàng");
			Date create_at = Date.valueOf(LocalDate.now());
			Date update_at = Date.valueOf(LocalDate.now());
			String hashedPassword = Encryption.hashPassword(password);
			boolean status = true;
			Users user = new Users(userId, role, username, hashedPassword, email, create_at, update_at, status);
			HttpSession session = request.getSession();
			session.setAttribute("pendingUser", user);
			response.sendRedirect("verify-otp-servlet");
		} else {
			request.setAttribute("error", error);
			RequestDispatcher rd = request.getRequestDispatcher("/page/user/Register.jsp");
			rd.forward(request, response);
		}
	}
	
	private String validateInput(String username, String password, String rePassword, String email) {
		if (!email.matches(EMAIL_REGEX)) {
			return "Email không hợp lệ.";
		}
		if (!username.matches(USERNAME_REGEX)) {
			return "Tên đăng nhập không hợp lệ.";
		}
		if (password == null || rePassword == null || !password.equals(rePassword)) {
			return "Mật khẩu nhập lại không khớp.";
		}
		if (password.length() < 6) {
			return "Mật khẩu phải có ít nhất 6 ký tự.";
		}
		return null;
	}
}
