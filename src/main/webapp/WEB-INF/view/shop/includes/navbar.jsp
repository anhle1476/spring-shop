<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="header bg-white">
	<div class="container px-0 px-lg-3">
		<nav class="navbar navbar-expand-lg navbar-light py-3 px-lg-0">
			<a class="navbar-brand" href="${pageContext.request.contextPath}/"><span
				class="font-weight-bold text-uppercase text-dark">Spring Shop</span></a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item">
						<!-- Link--> 
						<a class="nav-link" href="${pageContext.request.contextPath}/">Trang chủ</a>
					</li>
					
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" id="pagesDropdown" href="#"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Danh mục</a>
						<div class="dropdown-menu mt-3" aria-labelledby="pagesDropdown">
								<a class="dropdown-item border-0 transition-link" 
									href="${pageContext.request.contextPath}/categories">
									Tất cả
								</a>
							<c:forEach items="${ catDto.categories }" var="category">
								<a class="dropdown-item border-0 transition-link" 
									href="${pageContext.request.contextPath}/categories/${category.id}">
									${ category.name }
								</a>
							</c:forEach>
						</div>
					</li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" 
						href="${pageContext.request.contextPath}/cart">
							<i class="fas fa-dolly-flatbed mr-1 text-gray"></i>Giỏ hàng <small
							class="text-gray">(<span id="cart-counter">0</span>)</small>
					</a></li>
					<li class="nav-item">
						<a class="nav-link" 
							target="_blank"
							href="${pageContext.request.contextPath}/login"> <i
							class="fas fa-user-alt mr-1 text-gray"></i>Login
					</a></li>
				</ul>
			</div>
		</nav>
	</div>
</header>
