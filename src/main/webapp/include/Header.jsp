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
			<a href="<%= ctx %>/Index.jsp"> <img
				src="<%= ctx %>/asset/img/logo/logo.png" alt="Logo">
			</a>
		</div>
		<div class="search-bar w-50">
			<input type="text" class="form-control"
				placeholder="Tìm kiếm sản phẩm...">
		</div>
		<div class="header-icons d-flex align-items-center">
			<a href="#" class="text-dark me-3" data-bs-toggle="modal" data-bs-target="#loginModal">
				<i class="fas fa-user"></i> Đăng nhập
			</a> <a href="#" class="text-dark"> 
				<i class="fas fa-shopping-cart"></i> Giỏ hàng
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
			<li class="nav-item"><a class="nav-link" href="#">Linh kiện</a>
			</li>
			<li class="nav-item"><a class="nav-link" href="#">Phụ kiện</a></li>
			<li class="nav-item"><a class="nav-link" href="#">Chính sách</a>
			</li>
			<li class="nav-item"><a
				class="nav-link <%= currentPage.contains("/About.jsp") ? "active" : "" %>"
				href="<%= ctx %>/page/detail/About.jsp">Giới thiệu</a></li>
			<li class="nav-item"><a
				class="nav-link <%= currentPage.contains("/Contact.jsp") ? "active" : "" %>"
				href="<%= ctx %>/page/detail/Contact.jsp">Liên hệ</a></li>
		</ul>
	</div>
</nav>

<!-- LOGIN MODAL -->
<jsp:include page="../page/user/Login.jsp" />
<jsp:include page="../page/user/Register.jsp" />