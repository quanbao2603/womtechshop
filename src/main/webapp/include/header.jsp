<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%
    String currentPage = request.getRequestURI();
    String ctx = request.getContextPath();
%>

<!-- HEADER -->
<header class="bg-light py-3 border-bottom">
	<div
		class="container d-flex justify-content-between align-items-center">
		<div class="logo">
			<a href="<%= ctx %>/index.jsp"> <img
				src="<%= ctx %>/assets/img/logo/logo.png" alt="Logo">
			</a>
		</div>
		<div class="search-bar w-50">
			<input type="text" class="form-control"
				placeholder="Tìm kiếm sản phẩm...">
		</div>
		<div class="header-icons d-flex align-items-center">
			<a href="<%= ctx %>/pages/user/login.jsp" class="text-dark me-3">
				<i class="fas fa-user"></i> Đăng nhập
			</a> <a href="#" class="text-dark"> <i class="fas fa-shopping-cart"></i>
				Cart
			</a>
		</div>
	</div>
</header>

<!-- NAVBAR -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
	<div class="container">
		<ul class="navbar-nav me-auto w-100 justify-content-between">
			<li class="nav-item"><a
				class="nav-link <%= currentPage.endsWith("/index.jsp") ? "active" : "" %>"
				href="<%= ctx %>/index.jsp">Trang chủ</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Laptop</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Linh kiện</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">Phụ kiện</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Chính sách</a>
			</li>
			<li class="nav-item"><a
				class="nav-link <%= currentPage.contains("/about.jsp") ? "active" : "" %>"
				href="<%= ctx %>/pages/detail/about.jsp">Giới thiệu</a></li>
			<li class="nav-item"><a
				class="nav-link <%= currentPage.contains("/contact.jsp") ? "active" : "" %>"
				href="<%= ctx %>/pages/detail/contact.jsp">Liên hệ</a></li>
		</ul>
	</div>
</nav>
