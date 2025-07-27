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
<title>WOMTECH - Register</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/register.css">
</head>
<body>
	<main class="form-register w-100 m-auto">
		<form class="text-center" action="<%=url%>/register" method="POST">
			<img class="mb-4"
				src="<%= request.getContextPath() %>/assets/img/logo/logo.png"
				alt="Logo" width="72">
			<h1 class="h3 mb-3 fw-normal">ĐĂNG KÝ</h1>

			<% if (error != null && !error.isEmpty()) { %>
			<div class="alert alert-danger" role="alert"><%= error %></div>
			<% } %>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="name" name="name"
					placeholder="Họ và tên" required> <label for="name">Họ
					và tên</label>
			</div>

			<div class="form-floating mb-3">
				<input type="text" class="form-control" id="username"
					name="username" placeholder="Tên đăng nhập" required> <label
					for="username">Tên đăng nhập</label>
			</div>

			<div class="form-floating mb-3">
				<input type="email" class="form-control" id="email" name="email"
					placeholder="Email" required> <label for="email">Email</label>
			</div>

			<div class="form-floating mb-3">
				<input type="password" class="form-control" id="password"
					name="password" placeholder="Mật khẩu" required autocomplete="off">
				<label for="password">Mật khẩu</label>
			</div>

			<div class="form-floating mb-4">
				<input type="password" class="form-control" id="re-password"
					name="re-password" placeholder="Nhập lại mật khẩu" required
					autocomplete="off"> <label for="re-password">Nhập
					lại mật khẩu</label>
			</div>

			<button class="w-100 btn btn-lg btn-primary mb-3" type="submit">Đăng
				ký</button>
			<span>Bạn đã có tài khoản? </span> <a href="login.jsp">Đăng nhập</a>
			<p class="mt-5 mb-3 text-muted">&copy;2025 WomTechShop. All
				rights reserved.</p>
		</form>
	</main>

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"
		integrity="sha384-Atwg2Pkwv9vp0ygtn1JAojH0nYbwNJLPhwyoVbhoPwBhjQPR5VtM2+xf0Uwh9KtT"
		crossorigin="anonymous">
</script>
</body>
</html>
