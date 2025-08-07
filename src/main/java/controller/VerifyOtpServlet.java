package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Random;

import model.Users;
import dao.UsersDAO;
import util.Email;

/**
 * Servlet implementation class VerifyOtpServlet
 */
@WebServlet("/verify-otp-servlet")
public class VerifyOtpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final int OTP_VALID_MINUTES = 5;

	public VerifyOtpServlet() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Users user = (Users) session.getAttribute("pendingUser");

		if (user == null) {
			response.sendRedirect(request.getContextPath() + "/page/account/register.jsp");
			return;
		}

		String otp = generateOtp();
		long timestamp = System.currentTimeMillis();

		session.setAttribute("otp", otp);
		session.setAttribute("otpTimestamp", timestamp);

		// Gửi email
		Email.sendOTPEmail(user.getEmail(), user.getUsername(), otp, OTP_VALID_MINUTES);

		request.getRequestDispatcher("/page/verify/OTP.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();

		String otpInput = request.getParameter("otp");
		String sessionOtp = (String) session.getAttribute("otp");
		Long otpTimestamp = (Long) session.getAttribute("otpTimestamp");
		Users user = (Users) session.getAttribute("pendingUser");

		// Kiểm tra đầy đủ các điều kiện
		if (otpInput == null || sessionOtp == null || otpTimestamp == null || user == null) {
			request.setAttribute("error", "Phiên xác thực không hợp lệ, vui lòng đăng ký lại.");
			request.getRequestDispatcher("/page/account/register.jsp").forward(request, response);
			return;
		}

		if (!otpInput.equals(sessionOtp)) {
			request.setAttribute("error", "Mã OTP không chính xác.");
			request.getRequestDispatcher("/page/verify/OTP.jsp").forward(request, response);
			return;
		}

		// Kiểm tra OTP có còn hiệu lực không
		long currentTime = System.currentTimeMillis();
		long elapsedMinutes = (currentTime - otpTimestamp) / (60 * 1000);

		if (elapsedMinutes > OTP_VALID_MINUTES) {
			request.setAttribute("error", "Mã OTP đã hết hạn.");
			request.getRequestDispatcher("/page/verify/OTP.jsp").forward(request, response);
			return;
		}
		
		// Lưu user vào DB
		new UsersDAO().insert(user);
		
		// Chuyển sang user đã xác thực
		session.removeAttribute("pendingUser");
		session.setAttribute("user", user); // Giữ lại để người dùng vẫn đăng nhập

		// Xóa OTP
		session.removeAttribute("otp");
		session.removeAttribute("otpTimestamp");

		response.sendRedirect(request.getContextPath() + "/Index.jsp");
	}

	private String generateOtp() {
		return String.format("%06d", new Random().nextInt(1000000));
	}
}