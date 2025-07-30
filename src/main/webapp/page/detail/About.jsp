<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>About WOMTechShop</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/Index.css">
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/About.css">
</head>
<body>
	<jsp:include page="/include/Header.jsp" />
	
	<div class="container mt-5 about-content">
	    <h2 class="mb-4 text-primary">GIỚI THIỆU</h2>
	    <p><strong>Tên Công ty:</strong> CÔNG TY TNHH CÔNG NGHỆ VÀ TIN HỌC HỒNG PHÁT</p>
	    <p><strong>Tên giao dịch:</strong> LAPTOPNEW.vn</p>
	    <p><strong>Văn phòng:</strong> 54/205/8 Phạm Hùng, xã Bình Hưng, Tp.HCM, Việt Nam</p>
	    <p><strong>Giấy phép ĐKKD:</strong> 0318111456</p>
	
	    <h5 class="mt-4">* Hệ thống cửa hàng:</h5>
	    <ul>
	        <li>Chi nhánh 1: 29 Tân Thành, P.Chợ lớn, Tp.HCM</li>
	        <li>Chi nhánh 2: 399 Xô Viết Nghệ Tĩnh, P.Bình Thạnh, Tp.HCM</li>
	        <li>Chi nhánh 3: Quận 10 (sắp khai trương)</li>
	    </ul>
	    <p><strong>* Call Center:</strong> 1900.8946 - Email: <a href="mailto:khachhang@laptopnew.vn">khachhang@laptopnew.vn</a></p>
	
	    <h4 class="mt-5">1. Quá trình hình thành và phát triển</h4>
	    <p>
	        ✓ Laptopnew chính thức được thành lập vào năm 2010, thời điểm Việt Nam gia nhập WTO và nhu cầu sử dụng Laptop tăng cao.<br>
	        ✓ Trong quá trình phát triển, Laptopnew mở rộng hoạt động kinh doanh, đa dạng hóa kênh phân phối.<br>
	        ✓ Được thành lập dưới pháp nhân Công Ty TNHH TM DV Tin Học Xuân Ân (số 0309936348).<br>
	        ✓ Website <strong>Laptopnew.vn</strong> trở thành địa chỉ quen thuộc cho khách hàng tìm mua sản phẩm Laptop hàng hiệu.
	    </p>
	
	    <h5 class="mt-4">Những dấu mốc quan trọng:</h5>
	    <ul>
	        <li>2010 đến nay: đại lý ủy quyền của Dell, HP, Asus, Acer, MSI, Lenovo, LG, Rapoo…</li>
	        <li>2015: Top 10 nhà cung cấp Laptop chính hãng uy tín nhất tại Việt Nam (Top1 bình chọn)</li>
	        <li>2017: Hợp tác MSI - mở MSI Concept Store đầu tiên tại Việt Nam (msivietnam.vn)</li>
	        <li>2018: Nhà phân phối uỷ quyền AverMedia</li>
	        <li>2023: Hợp nhất thành CÔNG TY TNHH CÔNG NGHỆ VÀ TIN HỌC HỒNG PHÁT</li>
	    </ul>
	
	    <p>
	        Đội ngũ nhân viên trẻ, chuyên môn cao, phục vụ tận tình và luôn làm khách hàng hài lòng.<br>
	        Laptopnew cam kết duy trì mối quan hệ hợp tác lâu dài, tận tụy với khách hàng.
	    </p>
	
	    <h4 class="mt-5">2. Mục tiêu với đối tác</h4>
	    <p>
	        ✓ Cung cấp hàng hóa đa dạng, mẫu mã mới nhất, chất lượng tốt, giá cả cạnh tranh.<br>
	        ✓ Tìm kiếm đối tác có năng lực cung cấp các sản phẩm công nghệ tiên tiến nhất.<br>
	        ✓ Thành công của khách hàng là tương lai của chúng tôi.
	    </p>
	
	    <h4 class="mt-5">3. Tầm nhìn</h4>
	    <ul>
	        <li>Trở thành công ty có hệ thống showroom Laptop quy mô, chuyên nghiệp tại Việt Nam</li>
	        <li>Xây dựng môi trường làm việc chuyên nghiệp và phát huy tối đa năng lực cá nhân</li>
	        <li>Chia sẻ quyền lợi, trách nhiệm và nghĩa vụ công bằng, minh bạch</li>
	    </ul>
	
	    <h4 class="mt-5">4. Giá trị cốt lõi</h4>
	    <ul>
	        <li>Khách hàng là trọng tâm</li>
	        <li>Uy tín</li>
	        <li>Chất lượng</li>
	        <li>Trung thực</li>
	        <li>Hiệu quả</li>
	        <li>Phát triển con người</li>
	        <li>Tạo sự khác biệt</li>
	    </ul>
	
	    <h4 class="mt-5">5. Triết lý kinh doanh</h4>
	    <ul>
	        <li>Chất lượng là nền tảng phát triển bền vững</li>
	        <li>Dám nghĩ - Dám làm - Dám chịu trách nhiệm</li>
	        <li>Chăm sóc khách hàng tận tâm và chuyên nghiệp</li>
	        <li>Kiểm soát rủi ro hiệu quả</li>
	        <li>Phát huy tinh thần đoàn kết, hợp lực trong toàn thể công ty</li>
	    </ul>
	</div>
	
	<jsp:include page="/include/Footer.jsp" />
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.min.js"></script>
</body>
</html>
