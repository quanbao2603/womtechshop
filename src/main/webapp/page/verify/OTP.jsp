<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String port = (request.getServerPort() == 80 || request.getServerPort() == 443) ? "" : ":" + request.getServerPort();
String url = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTP</title>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/OTP.css">
</head>
<body>
	<div class="otp-container">
		<h2>Nhập mã OTP</h2>
		<p>Mã xác thực đã được gửi đến email/số điện thoại của bạn</p>
		<form id="otp-form" action="<%=url%>/verify-otp-servlet" method="POST">
			<div class="otp-inputs">
				<input type="text" name="otp1" maxlength="1" required> <input
					type="text" name="otp2" maxlength="1" required> <input
					type="text" name="otp3" maxlength="1" required> <input
					type="text" name="otp4" maxlength="1" required> <input
					type="text" name="otp5" maxlength="1" required> <input
					type="text" name="otp6" maxlength="1" required>
			</div>
			<button type="submit">Xác nhận</button>
		</form>
		<p class="resend">
			Không nhận được mã? <a href="#">Gửi lại</a>
		</p>
	</div>
</body>

<script src="<%=request.getContextPath()%>/js/OTPVerify.js"></script>

</html>