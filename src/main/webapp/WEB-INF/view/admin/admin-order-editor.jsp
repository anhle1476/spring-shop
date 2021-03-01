<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>

<c:import url="include/baseHeader.jsp" />
<title>Admin | Unconfirmed Orders</title>

<!-- DataTables -->
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/admin-resources/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css" />
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/admin-resources/plugins/datatables-responsive/css/responsive.bootstrap4.min.css" />

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
							<h1>Chi tiết đơn hàng</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-md-9">
							<div class="card card-outline card-info">
								<form:form method="post" modelAttribute="order">
									<input type="hidden" name="statusCode" value="${order.paidTime != null ? 3 : order.confirmedTime != null ? 2 : 1}"/> 
									<form:hidden path="id" />
									<div class="card-body">
										<h5 class="text-bold">Thông tin thanh toán</h5>
										<hr/>
										<div class="form-group">
											<label for="name">Tên khách hàng:</label>
											<form:input id="name" path="paymentInfo.name"
												cssClass="form-control" required="required" />
										</div>
										<div class="form-group">
											<label for="email">Email:</label>
											<form:input id="email" path="paymentInfo.email"
												cssClass="form-control" type="email" required="required" />
										</div>
										<div class="form-group">
											<label for="phone">Số điện thoại:</label>
											<form:input id="phone" path="paymentInfo.phone"
												cssClass="form-control" required="required" />
										</div>
										<div class="form-group">
											<label for="address">Địa chỉ:</label>
											<form:textarea id="address" path="paymentInfo.address"
												cssClass="form-control" required="required" />

										</div>
									</div>
									<div class="card-footer">
										<button type="submit" class="btn btn-primary float-right">
											Cập nhật thông tin</button>
										<input type="reset" class="btn btn-secondary float-right mr-3"
											value="Đặt lại" />
									</div>
								</form:form>
							</div>
						</div>
						<!-- /.col-->

						<div class="col-md-3">
							<div class="card card-outline card-info">
								<div class="card-body">
									<h5 class="text-bold">Trạng thái đơn hàng:</h5>
									<p>
										<strong class="text-uppercase"> ${	order.paidTime != null 
												? "Đã thanh toán" 
												: order.confirmedTime != null 
												? "Đang xử lý"
												: "Chưa xác minh"  }
										</strong>
									</p>
									<c:if test="${order.createdTime != null}">
										<p>Giờ đặt mua:</p>
										<p>
											<fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss"
												value="${order.createdTime}" />
										</p>
									</c:if>
									<c:if test="${order.confirmedTime != null}">
										<p>Giờ xác nhận:</p>
										<p>
											<fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss"
												value="${order.confirmedTime}" />
										</p>
									</c:if>
									<c:if test="${order.paidTime != null}">
										<p>Giờ thanh toán:</p>
										<p>
											<fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss"
												value="${order.paidTime}" />
										</p>
									</c:if>
								</div>
							</div>
						</div>
						<!-- /.col-->
					</div>
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title mt-2">Danh sách sản phẩm</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table id="posts-table" class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Sản phẩm</th>
												<th>Loại hàng</th>
												<th>Đơn giá (₫)</th>
												<th>Số lượng</th>
												<th>Tổng tiền (₫)</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${order.orderDetail.details}" var="detail">
												<tr>
													<th>${detail.product.name}</th>
													<td>${detail.product.category.name}</td>
													<td>${detail.product.price}</td>
													<td>${detail.quantity}</td>
													<td>${detail.product.price * detail.quantity}</td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<th>Sản phẩm</th>
												<th>Loại hàng</th>
												<th>Đơn giá (₫)</th>
												<th>Số lượng</th>
												<th>Tổng tiền (₫)</th>
											</tr>
										</tfoot>
									</table>
							
								</div>
								<!-- /.card-body -->
								<div class="card-footer">
									<h6 class="text-bold">Tổng giá trị:</h6>
									<h2>
										<strong class="text-uppercase">${order.totalPrice} ₫</strong>
									</h2>
								</div>
							</div>
							<!-- /.card -->
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container-fluid -->
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
	<!-- DataTables  & Plugins -->
	<script
		src="${pageContext.servletContext.contextPath}/admin-resources/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/admin-resources/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/admin-resources/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
	<script
		src="${pageContext.servletContext.contextPath}/admin-resources/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>

	<!-- Page specific script -->
	<c:import url="include/postTableJs.jsp">
		<c:param name="tableAction" value="delete-order" />
	</c:import>
</body>
</html>
