<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String port = (request.getServerPort() == 80 || request.getServerPort() == 443) ? "" : ":" + request.getServerPort();
    String url = request.getScheme() + "://" + request.getServerName() + port + request.getContextPath();
    String error = (String) request.getAttribute("error");
%>

<div class="modal fade" id="loginModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <form class="modal-content form-login text-center p-4" action="<%=url%>/login-servlet" method="POST" autocomplete="off">
      
      <button type="button" class="btn-close ms-auto" data-bs-dismiss="modal" aria-label="Close"></button>

      <img class="mb-4 d-block mx-auto" src="<%= request.getContextPath() %>/asset/img/logo/logo.png" alt="" width="72">
      <h1 class="h4 mb-3 fw-normal">ĐĂNG NHẬP</h1>

      <% if (error != null && !error.isEmpty()) { %>
        <div class="alert alert-danger w-100" role="alert"><%= error %></div>
      <% } %>

      <div class="form-floating mb-3">
        <input type="text" class="form-control" id="username" name="username" placeholder="Tên đăng nhập" required>
        <label for="username">Tên đăng nhập</label>
      </div>

      <div class="form-floating mb-3">
        <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu" required>
        <label for="password">Mật khẩu</label>
      </div>

      <div class="form-check text-start mb-3">
        <input type="checkbox" class="form-check-input" id="rememberMe">
        <label class="form-check-label" for="rememberMe">Ghi nhớ tài khoản</label>
      </div>

      <button class="btn btn-primary w-100 mb-3" type="submit">Đăng nhập</button>

      <a href="#" data-bs-toggle="modal" data-bs-target="#registerModal" data-bs-dismiss="modal">
        Đăng ký tài khoản mới
      </a>
    </form>
  </div>
</div>
