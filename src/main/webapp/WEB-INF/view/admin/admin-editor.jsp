<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<c:import url="include/baseHeader.jsp" />
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
							<h1>${ product == null || product.id == 0 ? "Tạo sản phẩm" : "Sửa sản phẩm"}</h1>
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
							<form:form method="post" modelAttribute="product">
								<%-- <input type="hidden" name="post-id" value="${product.id}"> --%>
								<form:hidden path="id" />
								<div class="card-body">
									<div class="form-group">
										<label for="name">Tên sản phẩm:</label>
										<form:input id="name" path="name" cssClass="form-control"
											required="required" />
									</div>
									<div class="form-group">
										<label for="imgUrl">Hình ảnh:</label>
										<form:input id="imgUrl" path="imgUrl" cssClass="form-control"
											required="required" />
									</div>
									<div class="form-group">
										<label for="price">Đơn giá (VND):</label>
										<form:input type="number" min="0" max="2147483000" step="1"
											id="price" path="price" cssClass="form-control"
											required="required" />
									</div>
									<div class="form-group">
										<label for="details">Chi tiết sản phẩm</label>
										<form:textarea id="details" path="details"
											cssClass="form-control" required="required" />

									</div>
									<div class="form-group">
										<label for="category">Danh mục:</label>
										<form:select path="category.id" cssClass="form-control"
											id="category" required="required">
											<option value="" ${ product.id == 0 ? "selected" : "" }
												disabled>--Chọn thể loại sản phẩm--</option>
											<c:forEach items="${ categories }" var="category">
												<form:option value="${ category.id }">
													${ category.name }
												</form:option>
											</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="card-footer">
									<button type="submit" class="btn btn-primary float-right">
										Hoàn tất</button>
									<input type="reset" class="btn btn-secondary float-right mr-3"
										value="Đặt lại" />
								</div>
							</form:form>
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
		$(function() {
			// Summernote
			$("#details").summernote();
		});
	</script>
</body>
</html>
