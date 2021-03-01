<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="include/baseHeader.jsp" />
<title>Admin | Customize</title>
<!-- summernote -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/admin-resources/plugins/summernote/summernote-bs4.min.css" />
</head>
<body class="hold-transition sidebar-mini">
	<div class="wrapper">
		<!-- Navbar -->
		<c:import url="include/navbar.jsp" />
		<!-- /.navbar -->

		<!-- Main Sidebar Container -->
		<c:import url="include/sidebar.jsp"></c:import>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<div class="container-fluid">
					<div class="row mb-2">
						<div class="col-sm-6">
							<h1>Tùy chỉnh trang chủ</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="row">
					<div class="col-md-12">
						<div class="card card-outline card-info">
							<form method="post">
								<div class="card-body">
									<div class="form-group">
										<label for="bannerTitle">Tiêu đề banner:</label> <input
											value='${meta.getAttribute("bannerTitle")}' id="bannerTitle"
											name="bannerTitle" class="form-control" required="required" />
									</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="bannerMessage">Thông điệp banner:</label> <input
											value='${meta.getAttribute("bannerMessage")}'
											id="bannerMessage" name="bannerMessage" class="form-control"
											required="required" />
									</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="bannerImgUrl">Ảnh banner:</label> <input
											value='${meta.getAttribute("bannerImgUrl")}'
											id="bannerImgUrl" name="bannerImgUrl" class="form-control"
											required="required" />
									</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="catImg1">Ảnh danh mục 1:</label> <input
											value='${meta.getAttribute("catImg1")}' id="catImg1"
											name="catImg1" class="form-control" required="required" />
									</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="catImg2">Ảnh danh mục 2:</label> <input
											value='${meta.getAttribute("catImg2")}' id="catImg2"
											name="catImg2" class="form-control" required="required" />
									</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="catImg3">Ảnh danh mục 3:</label> <input
											value='${meta.getAttribute("catImg3")}' id="catImg3"
											name="catImg3" class="form-control" required="required" />
									</div>
								</div>
								<div class="card-body">
									<div class="form-group">
										<label for="catImg4">Ảnh danh mục 4:</label> <input
											value='${meta.getAttribute("catImg4")}' id="catImg4"
											name="catImg4" class="form-control" required="required" />
									</div>
								</div>
								<div class="card-footer">
									<button type="submit" class="btn btn-primary float-right">
										Lưu</button>
									<input type="reset" class="btn btn-secondary float-right mr-3"
										value="Đặt lại" />
								</div>
							</form>
						</div>
					</div>
					<!-- /.col-->
				</div>
			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->

		<!-- Main Footer -->
		<c:import url="include/footer.jsp" />
	</div>
	<!-- ./wrapper -->

	<!-- REQUIRED SCRIPTS -->
	<c:import url="include/baseJs.jsp" />
	<c:import url="include/customAdminJs.jsp" />
	<!-- Summernote -->
	<script
		src="${pageContext.servletContext.contextPath}/admin-resources/plugins/summernote/summernote-bs4.min.js"></script>

	<!-- Page specific script -->
	<script>
    $(function () {
        // Summernote
        $("#details").summernote();
    });

</script>
</body>
</html>
