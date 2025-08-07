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
<script>
    const inputs = document.querySelectorAll(".otp-inputs input");

    inputs.forEach((input, index) => {
        input.addEventListener("input", () => {
            if (input.value.length === 1 && index < inputs.length - 1) {
                inputs[index + 1].focus();
            }
        });

        input.addEventListener("keydown", (e) => {
            // Nếu nhấn Backspace và ô đang rỗng → chuyển về ô trước
            if (e.key === "Backspace" && input.value === "" && index > 0) {
                inputs[index - 1].focus();
            }
        });
    });

    // Gộp mã OTP trước khi submit
    const form = document.getElementById("otp-form");
    form.addEventListener("submit", function (e) {
        let otp = "";
        inputs.forEach(input => otp += input.value);

        const hidden = document.createElement("input");
        hidden.type = "hidden";
        hidden.name = "otp";
        hidden.value = otp;
        form.appendChild(hidden);
    });
</script>

</html>