<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WOMTechShop</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Index.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Login.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/Register.css">
</head>
<body>

	<jsp:include page="/include/Header.jsp" />

	<!-- MAIN CONTENT -->
	<div class="container my-4">
		<div class="row">
			<!-- Sidebar -->
			<div class="sidebar col-md-3">
				<h5>Danh mục</h5>
				<ul class="list-group">
					<li class="list-group-item"><a href="#">Laptop Gaming</a></li>
					<li class="list-group-item"><a href="#">Laptop Văn Phòng</a></li>
					<li class="list-group-item"><a href="#">CPU</a></li>
					<li class="list-group-item"><a href="#">RAM</a></li>
					<li class="list-group-item"><a href="#">Ổ cứng</a></li>
					<li class="list-group-item"><a href="#">Chuột, Bàn phím</a></li>
				</ul>
			</div>

			<!-- Product Cards Wrapper -->
			<div class="col-md-9">
				<div class="row">
					<!-- Sản phẩm 1 -->
					<div class="col-md-4 mb-4">
						<div class="card h-100">
							<img src="https://bizweb.dktcdn.net/100/372/934/products/lenovo-thinkbook-16-g6-man-hinh.jpg?v=1751502423797" class="card-img-top" alt="Laptop 1">
							<div class="card-body">
								<h5 class="card-title">Laptop Lenovo Thinkbook 16 G6+ R72451</h5>
								<p class="card-text">Giá: 24.500.000đ</p>
								<a href="#" class="btn btn-primary btn-sm">Xem chi tiết</a>
							</div>
						</div>
					</div>

					<!-- Sản phẩm 2 -->
					<div class="col-md-4 mb-4">
						<div class="card h-100">
							<img src="https://bizweb.dktcdn.net/100/372/934/products/lenovo-legion-r9000p-man-hinh-d0f1e892-b49f-4c9a-9525-12f0e95f6279.jpg?v=1751257864907" class="card-img-top" alt="Laptop 2">
							<div class="card-body">
								<h5 class="card-title">Laptop Lenovo Legion 5 Pro R9000P R93210G8</h5>
								<p class="card-text">Giá: 42.990.000đ</p>
								<a href="#" class="btn btn-primary btn-sm">Xem chi tiết</a>
							</div>
						</div>
					</div>

					<!-- Sản phẩm 3 -->
					<div class="col-md-4 mb-4">
						<div class="card h-100">
							<img src="https://bizweb.dktcdn.net/100/372/934/products/asus-rog-strix-scar-16-g634-man-hinh-8ba7d91f-bb40-40a0-91cc-40c4886bd540.jpg?v=1751208582120" class="card-img-top" alt="Laptop 3">
							<div class="card-body">
								<h5 class="card-title">Laptop Asus ROG Strix Scar 16 G635 U93220G16</h5>
								<p class="card-text">Giá: 84.800.000đ</p>
								<a href="#" class="btn btn-primary btn-sm">Xem chi tiết</a>
							</div>
						</div>
					</div>

					<!-- Thêm bao nhiêu sản phẩm tùy bạn -->
				</div>
			</div>

		</div>
	</div>

	<jsp:include page="/include/Footer.jsp" />

	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
</body>
</html>