<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>

<c:import url="include/baseHeader.jsp" />
<title>Admin | Processing Orders</title>

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
							<h1>Đơn hàng đang xử lý</h1>
						</div>
					</div>
				</div>
				<!-- /.container-fluid -->
			</section>

			<!-- Main content -->
			<section class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="card">
								<div class="card-header">
									<h3 class="card-title mt-2">Danh sách đơn hàng</h3>
								</div>
								<!-- /.card-header -->
								<div class="card-body">
									<table id="posts-table"
										class="table table-bordered table-hover">
										<thead>
											<tr>
												<th>Mã đơn</th>
												<th>Tên khách hàng</th>
												<th>Email</th>
												<th>Số điện thoại</th>
												<th>Địa chỉ</th>
												<th>Tổng tiền (₫)</th>
												<th>Giờ đặt hàng</th>
												<th>Giờ xác minh</th>
												<th>Hành động</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${orders}" var="order">
												<tr id="tableRow-${order.id}">
													<th>${order.id}</th>
													<td>${order.paymentInfo.name}</td>
													<td>${order.paymentInfo.email}</td>
													<td>${order.paymentInfo.phone}</td>
													<td>${order.paymentInfo.address}</td>
													<td>${order.totalPrice}</td>
													<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss"
															value="${order.createdTime}" /></td>
													<td><fmt:formatDate pattern="dd-MM-yyyy HH:mm:ss"
															value="${order.confirmedTime}" /></td>
													<td>
														<a class="btn btn-success btn-sm btn-edit"
															title="Đã thanh toán"
															href="${pageContext.servletContext.contextPath}/admin/order/next-state/${order.id}?from=2">
															<i class="fas fa-money-check-alt"></i>
														</a>
														<a class="btn btn-secondary btn-sm btn-edit"
															title="Xem & Chỉnh sửa"
															href="${pageContext.servletContext.contextPath}/admin/order/${order.id}">
															<i class="fas fa-eye"></i>
														</a>
														<button class="btn btn-dark btn-sm btn-edit delete-btn"
															title="Xóa" id="row-${order.id}">
															<i class="fas fa-trash"></i>
														</button>
													</td>
												</tr>
											</c:forEach>
										</tbody>
										<tfoot>
											<tr>
												<th>Mã đơn</th>
												<th>Tên khách hàng</th>
												<th>Email</th>
												<th>Số điện thoại</th>
												<th>Địa chỉ</th>
												<th>Tổng tiền (₫)</th>
												<th>Giờ đặt hàng</th>
												<th>Giờ xác minh</th>
												<th>Hành động</th>
											</tr>
										</tfoot>
									</table>
								</div>
								<!-- /.card-body -->
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
