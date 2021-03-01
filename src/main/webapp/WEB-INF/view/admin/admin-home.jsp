<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <c:import url="include/baseHeader.jsp"/>
    <title>Admin | Dashboard</title>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <!-- Navbar -->
    <c:import url="include/navbar.jsp"/>
    <!-- /.navbar -->

    <!-- Main Sidebar Container -->
    <c:import url="include/sidebar.jsp"></c:import>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <div class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1 class="m-0">Dashboard</h1>
                    </div>
                    <!-- /.col -->
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
        </div>
        <!-- /.content-header -->

        <!-- Main content -->
        <section class="content">
            <!-- Default box -->
            <div class="card card-solid">
                <div class="card-body pb-0">
                    <div class="row d-flex align-items-stretch">
                        <div class="col-12 col-sm-6">
                            <div class="card card-info">
                                <div class="card-header">
                                    <h3 class="card-title">Thống kê</h3>
                                </div>
                                <div class="card-body">
                                    <h3 class="lead"><b>Số đơn hàng</b></h3>
                                    <ul class="ml-4 fa-ul text-muted">
                                        <li class="my-3">
				                          <span class="fa-li">
				                          	<i class="fas fa-money-bill"></i>
				                          </span>
                                          Chưa xác minh: ${statistic.get("newOrders")}
                                        </li>
                                        <li class="my-3">
				                          <span class="fa-li">
				                          	<i class="fas fa-truck"></i>
				                          </span>
                                          Đang xử lý: ${statistic.get("processingOrders")}
                                        </li>
                                        <li class="my-3">
                                            <span class="fa-li">
                                            	<i class="fas fa-wallet"></i>
                                            </span>
                                            Đã thanh toán: ${statistic.get("paidOrders")}
                                        </li>
                                        <li class="my-3">
                                            <span class="fa-li">
                                            	<i class="fas fa-box-open"></i>
                                            </span>
                                            <strong>Tổng giá trị đặt hàng:</strong> ${statistic.get("totalOrdersValue")} ₫
                                        </li>
                                        <li class="my-3">
                                            <span class="fa-li">
                                            	<i class="fas fa-crown"></i>
                                            </span>
                                            <strong>Tổng doanh thu (đã thanh toán):</strong> ${statistic.get("totalRevenue")} ₫
                                        </li>
                                    </ul>
                                </div>
                                
                            </div>
                        </div>
                        <div class="col-12 col-sm-6">
                            <div class="card card-info my-0">
                                <div class="card-header">
                                    <h3 class="card-title">Đổi mật khẩu</h3>
                                </div>
                                <!-- /.card-header -->
                                <!-- Change password form start -->
                                <form:form method="post" 
                                	action="${pageContext.servletContext.contextPath}/admin/change-password"
                                	onsubmit="return confirm('Bạn có chắc chắn muốn đổi mật khẩu không?')"
                                	modelAttribute="changePassword"
                                	>
                                	<form:hidden path="id"/>
                                    <div class="card-body">
                                        <div class="form-group row mb-1">
                                            <label for="current-password" class="col-form-label"
                                            >Mật khẩu hiện tại</label
                                            >
                                            <form:input
                                                    type="password"
                                                    cssClass="form-control"
                                                    path="currentPassword"
                                                    id="current-password"
                                                    placeholder="Mật khẩu hiện tại"
                                                    required="required"
                                            />
                                        </div>
                                        <div class="form-group row mb-1">
                                            <label for="new-password" class="col-form-label">
                                            	Mật khẩu mới
                                            </label>
                                            <form:input
                                                    type="password"
                                                    class="form-control"
                                                    path="newPassword"
                                                    id="new-password"
                                                    placeholder="Mật khẩu mới"
                                                    required="required"
                                            />
                                        </div>
                                    </div>
                                    <!-- /.card-body -->
                                    <div class="card-footer">
                                        <button type="submit" class="btn btn-info float-right my-2">
                                            <i class="fas fa-check"></i> Xác nhận
                                        </button>
                                    </div>
                                    <!-- /.card-footer -->
                                </form:form>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.card-body -->
            </div>
            <!-- /.card -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <c:import url="include/footer.jsp"></c:import>
</div>
<!-- ./wrapper -->

<!-- REQUIRED SCRIPTS -->
<c:import url="include/baseJs.jsp"></c:import>
<c:import url="include/customAdminJs.jsp" />
</body>
</html>