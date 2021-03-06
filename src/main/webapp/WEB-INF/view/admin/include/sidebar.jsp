<%@page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <!-- Brand Logo -->
    <a href="${pageContext.servletContext.contextPath}/" class="brand-link">
        <img
                src="${pageContext.servletContext.contextPath}/admin-resources/dist/img/AdminLTELogo.png"
                alt="AdminLTE Logo"
                class="brand-image img-circle elevation-3"
                style="opacity: 0.8"
        />
        <span class="brand-text font-weight-light">SPRING SHOP</span>
    </a>

    <!-- Sidebar -->
    <div class="sidebar">
        <!-- Sidebar user panel (optional) -->
        <div class="user-panel mt-3 pb-3 mb-3 d-flex">
            <div class="info">
                <a href="${pageContext.servletContext.contextPath}/admin"
                   class="d-block">${user.username}</a>
            </div>
        </div>

        <!-- Sidebar Menu -->
        <nav class="mt-2">
            <ul
                    class="nav nav-pills nav-sidebar flex-column"
                    data-widget="treeview"
                    role="menu"
                    data-accordion="false"
            >
                <!-- Account controller -->
                <li class="nav-item">
                    <a href="${pageContext.servletContext.contextPath}/admin" class="nav-link">
                        <i class="nav-icon fas fa-tachometer-alt"></i>
                        <p>Dashboard</p>
                    </a>
                </li>
                <!-- /account-controller -->

                    <!-- Page controller -->
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-store"></i>
                            <p>
                                Quản lý cửa hàng
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                                <!-- products -->
                                <li class="nav-item">
                                    <a href="${pageContext.servletContext.contextPath}/admin/products"
                                       class="nav-link">
                                        <i class="fas fa-boxes nav-icon"></i>
                                        <p>Sản phẩm</p>
                                    </a>
                                </li>
                                <!-- /products -->
                                <!-- categories -->
                                <li class="nav-item">
                                    <a href="${pageContext.servletContext.contextPath}/admin/categories"
                                       class="nav-link">
                                        <i class="fas fa-tags nav-icon"></i>
                                        <p>Danh mục</p>
                                    </a>
                                </li>
                                <!-- /categories -->
                                <!-- categories -->
                                <li class="nav-item">
                                    <a href="${pageContext.servletContext.contextPath}/admin/metadata"
                                       class="nav-link">
                                        <i class="fas fa-cogs nav-icon"></i>
                                        <p>Tùy chỉnh</p>
                                    </a>
                                </li>
                                <!-- /categories -->
                        </ul>
                    </li>

                    <!-- Bills controller -->
                    <li class="nav-item menu-open">
                        <a href="#" class="nav-link">
                            <i class="nav-icon fas fa-file-invoice-dollar"></i>
                            <p>
                                Quản lý đơn hàng
                                <i class="right fas fa-angle-left"></i>
                            </p>
                        </a>
                        <ul class="nav nav-treeview">
                                <!-- new bills -->
                                <li class="nav-item">
                                    <a href="${pageContext.servletContext.contextPath}/admin/unconfirmed" class="nav-link">
                                        <i class="fas fa-money-bill nav-icon"></i>
                                        <p>Chưa xác minh</p>
                                    </a>
                                </li>
                                <!-- /new-bills -->
                                <!-- processing bills -->
                                <li class="nav-item">
                                    <a href="${pageContext.servletContext.contextPath}/admin/processing" class="nav-link">
                                        <i class="fas fa-truck nav-icon"></i>
                                        <p>Đang xử lý</p>
                                    </a>
                                </li>
                                <!-- /processing-bills -->
                                <!-- paid bills -->
                                <li class="nav-item">
                                    <a href="${pageContext.servletContext.contextPath}/admin/paid" class="nav-link">
                                        <i class="fas fa-wallet nav-icon"></i>
                                        <p>Đã thanh toán</p>
                                    </a>
                                </li>
                                <!-- /paid-bills -->
                        </ul>
                    </li>
                    <!-- /posts-controller -->
            </ul>
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>