<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="include/baseHeader.jsp" />

<!-- icheck bootstrap -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/admin-resources/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
<title>Spring Shop | Log in</title>
</head>
<body class="hold-transition login-page">
	<div class="login-box">
		<div class="login-logo">
			<a href="${pageContext.servletContext.contextPath}/blog?site=home"><b>SPRING</b>
				shop</a>
		</div>
		<!-- /.login-logo -->
		<div class="card">
			<div class="card-body login-card-body">
				<p class="login-box-msg">Nhập tài khoản và mật khẩu</p>
				<c:if test='${sessionScope["login-failed"] != null}'>
					<div class="alert alert-warning alert-dismissible">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">×</button>
						<h5>
							<i class="icon fas fa-exclamation-triangle"> Thất bại</i>
						</h5>
						Đăng nhập không thành công. Sai tên tài khoản hoặc mật khẩu.
					</div>
					<c:remove var="login-failed" scope="session" />
				</c:if>

				<form:form method="post" modelAttribute="user">
					<div class="input-group mb-3">
						<form:input path="username" cssClass="form-control"
							placeholder="Tên tài khoản" required="required" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-user"></span>
							</div>
						</div>
					</div>
					<div class="input-group mb-3">
						<form:input path="currentPassword" type="password"
							cssClass="form-control" placeholder="Mật khẩu"
							required="required" />
						<div class="input-group-append">
							<div class="input-group-text">
								<span class="fas fa-lock"></span>
							</div>
						</div>
					</div>
					<div class="row">
						<!-- /.col -->
						<div class="col-12">
							<button type="submit" class="btn btn-primary text-uppercase btn-block">Đăng nhập</button>
						</div>
						<!-- /.col -->
					</div>
				</form:form>
			</div>
			<!-- /.login-card-body -->
		</div>
	</div>
	<!-- /.login-box -->

	<!-- JS -->
	<c:import url="include/baseJs.jsp" />
</body>
</html>
