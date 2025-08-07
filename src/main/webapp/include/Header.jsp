<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="model.Users"%>
<%
    String currentPage = request.getRequestURI();
    String ctx = request.getContextPath();
    Users loggedInUser = (Users) session.getAttribute("user");
%>

<!-- HEADER -->
<header class="bg-light py-3 border-bottom">
	<div
		class="container d-flex justify-content-between align-items-center">
		<!-- Logo -->
		<div class="logo">
			<a href="<%= ctx %>/Index.jsp"> <img
				src="<%= ctx %>/asset/img/logo/logo.png" alt="Logo">
			</a>
		</div>

		<!-- Search bar -->
		<div class="search-bar w-50">
			<input type="text" class="form-control"
				placeholder="Tìm kiếm sản phẩm...">
		</div>

		<!-- Header icons -->
		<div class="header-icons d-flex align-items-center">
			<% if (loggedInUser == null) { %>
			<!-- Hiện nút Đăng nhập nếu chưa login -->
			<a href="#" class="text-dark me-3" data-bs-toggle="modal"
				data-bs-target="#loginModal"> <i class="fas fa-user"></i> Đăng
				nhập
			</a>
			<% } else { %>
			<!-- Nếu đã login -->
			<div class="dropdown me-3">
				<a href="#" class="text-dark dropdown-toggle"
					data-bs-toggle="dropdown"> <i class="fas fa-user"></i> <%= loggedInUser.getUsername() %>
				</a>
				<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="<%= ctx %>/profile.jsp">Tài
							khoản của tôi</a></li>
					<li><a class="dropdown-item" href="<%= ctx %>/logout-servlet">Đăng
							xuất</a></li>
				</ul>
			</div>
			<% } %>

			<!-- Giỏ hàng -->
			<a href="#" class="text-dark"> <i class="fas fa-shopping-cart"></i>
				Giỏ hàng
			</a>
		</div>
	</div>
</header>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container">
		<ul class="navbar-nav me-auto w-100 justify-content-between">
			<li class="nav-item"><a
				class="nav-link <%= currentPage.endsWith("/Index.jsp") ? "active" : "" %>"
				href="<%= ctx %>/Index.jsp">Trang chủ</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Laptop</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Linh kiện</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Phụ kiện</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Chính sách</a></li>
			<li class="nav-item"><a
				class="nav-link <%= currentPage.contains("/About.jsp") ? "active" : "" %>"
				href="<%= ctx %>/page/detail/About.jsp">Giới thiệu</a></li>
			<li class="nav-item"><a
				class="nav-link <%= currentPage.contains("/Contact.jsp") ? "active" : "" %>"
				href="<%= ctx %>/page/detail/Contact.jsp">Liên hệ</a></li>
		</ul>
	</div>
</nav>

<!-- LOGIN & REGISTER MODALS -->
<jsp:include page="../page/user/Login.jsp" />
<jsp:include page="../page/user/Register.jsp" />