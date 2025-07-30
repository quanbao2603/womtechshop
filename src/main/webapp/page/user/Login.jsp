<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String port = (request.getServerPort() == 80 || request.getServerPort() == 443) ? "" : ":" + request.getServerPort();
    String url = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/Login.css">
</head>
<body>
	<main class="form-login w-100 m-auto">
		<form class="text-center" action="<%=url%>/login-servlet" method="POST">
			<img class="mb-4"
				src="<%= request.getContextPath() %>/asset/img/logo/logo.png"
				alt="" width="72">
			<h1 class="h3 mb-3 fw-normal">ĐĂNG NHẬP</h1>
			<% if (error != null && !error.isEmpty()) { %>
			<div class="alert alert-danger" role="alert"><%= error %></div>
			<% } %>
			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="username"
					name="username" placeholder="Tên đăng nhập" required> <label
					for="username">Tên đăng nhập</label>
			</div>
			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="password"
					name="password" placeholder="Mật khẩu" required autocomplete="off">
				<label for="password">Mật khẩu</label>
			</div>
			<div class="checkbox mb-3 d-inline-flex align-items-center">
				<label><input type="checkbox" value="remember-me">
					Ghi nhớ tài khoản</label>
			</div>
			<button class="w-100 btn btn-lg btn-primary mb-3" type="submit">Đăng
				nhập</button>
			<a href="<%=url %>/page/user/Register.jsp">Đăng ký tài khoản mới</a>
			<p class="mt-5 mb-3">&copy;2025 WomTechShop. All
				rights reserved.</p>
		</form>
	</main>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
