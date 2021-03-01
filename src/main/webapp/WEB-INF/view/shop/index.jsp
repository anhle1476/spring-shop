<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Spring Shop | Home Page</title>
<meta name="description" content="Spring clothing shop">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<c:import url="includes/base-css.jsp" />

</head>
<body>
	<div class="page-holder">
		<!-- navbar-->
		<c:import url="includes/navbar.jsp"></c:import>
		<!--  Modal -->
		<c:import url="includes/modal.jsp" />
		<!-- HERO SECTION-->
		<div class="container">
			<section
				class="hero pb-3 bg-cover bg-center d-flex align-items-center"
				style='background: url(${meta.getAttribute("bannerImgUrl")})'>
				<div class="container py-5">
					<div class="row px-4 px-lg-5">
						<div class="col-lg-6">
							<p class="text-muted small text-uppercase mb-2">${meta.getAttribute("bannerTitle")}</p>
							<h1 class="h2 text-uppercase mb-3">${meta.getAttribute("bannerMessage")}</h1>
							<a class="btn btn-dark" href="${pageContext.request.contextPath}/categories">Danh mục sản phẩm</a>
						</div>
					</div>
				</div>
			</section>
			<!-- CATEGORIES SECTION-->
			<section class="pt-5">
				<header class="text-center">
					<p class="small text-muted small text-uppercase mb-1">Chỉ có tại Spring shop</p>
					<h2 class="h5 text-uppercase mb-4">Các danh mục tiêu biểu</h2>
				</header>
				<div class="row">
					<div class="col-md-4 mb-4 mb-md-0">
						<a class="category-item" href="${pageContext.request.contextPath}/categories/${ topCategories.get(0).id }"><img
							class="img-fluid"
							src='${meta.getAttribute("catImg1")}'
							alt=""><strong class="category-item-title">${ topCategories.get(0).name }</strong></a>
					</div>
					<div class="col-md-4 mb-4 mb-md-0">
						<a class="category-item mb-4" href="${pageContext.request.contextPath}/categories/${ topCategories.get(1).id }"><img
							class="img-fluid"
							src='${meta.getAttribute("catImg2")}'
							alt=""><strong class="category-item-title">${ topCategories.get(1).name }</strong></a><a
							class="category-item" href="${pageContext.request.contextPath}/categories/${ topCategories.get(2).id }">
							<img class="img-fluid"
							src='${meta.getAttribute("catImg3")}'
							alt=""><strong class="category-item-title">${ topCategories.get(2).name }</strong></a>
					</div>
					<div class="col-md-4">
						<a class="category-item" href="${pageContext.request.contextPath}/categories/${ topCategories.get(3).id }"><img
							class="img-fluid"
							src='${meta.getAttribute("catImg4")}'
							alt=""><strong class="category-item-title">${ topCategories.get(3).name }</strong></a>
					</div>
				</div>
			</section>
			<!-- TRENDING PRODUCTS-->
			<section class="py-5">
				<header>
					<p class="small text-muted small text-uppercase mb-1">Cập nhật xu hướng</p>
					<h2 class="h5 text-uppercase mb-4">Các sản phẩm mới nhất</h2>
				</header>
				<div class="row">
				<!-- <div class="badge text-white badge-primary">Sale</div> -->
				<!-- <div class="badge text-white badge-info">New</div> -->
				<!-- <div class="badge text-white badge-danger">Sold</div> -->
					<c:forEach items="${ lastedProducts }" var="product">
						
					
					<!-- PRODUCT-->
					<div class="col-lg-4 col-sm-6">
										<div class="product text-center">
											<div class="mb-3 position-relative">
												<a class="d-block" href="${pageContext.request.contextPath}/product/${ product.id }">
													<img
													class="img-fluid w-100" src="${ product.imgUrl }"
													alt="${ product.name } image" id="product-img-${ product.id }" />
												</a>
												<div class="product-overlay">
													<ul class="mb-0 list-inline">
														<li class="list-inline-item m-0 p-0"><button
															class="btn btn-sm btn-dark cart-action"
															data-cart-action="increase"
															data-product-id="${ product.id }"
															>
																Thêm vào giỏ hàng</button></li>
														<li class="list-inline-item mr-0">
															<a class="btn btn-sm btn-outline-dark toggle-btn" href="#productView"
																data-toggle="modal" id="toggle-${ product.id }">
																<i class="fas fa-expand"></i>
															</a>
														</li>
													</ul>
												</div>
											</div>
											<h6>
												<a class="reset-anchor"
													href="${pageContext.request.contextPath}/product/${ product.id }"
													id="product-name-${ product.id }">
													${ product.name } </a>
											</h6>
											<p class="small text-muted" id="product-price-${ product.id }">${ product.price } ₫</p>
											<p class="d-none" id="product-desc-${ product.id }">${ product.details }</p>
										</div>
									</div>
					</c:forEach>
					
				</div>
			</section>
			<!-- SERVICES-->
			<section class="py-5 bg-light">
				<div class="container">
					<div class="row text-center">
						<div class="col-lg-4 mb-3 mb-lg-0">
							<div class="d-inline-block">
								<div class="media align-items-end">
									<svg class="svg-icon svg-icon-big svg-icon-light">
                      <use xlink:href="#delivery-time-1"> </use>
                    </svg>
									<div class="media-body text-left ml-3">
										<h6 class="text-uppercase mb-1">Miễn phí vận chuyển</h6>
										<p class="text-small mb-0 text-muted">Free ship toàn quốc</p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4 mb-3 mb-lg-0">
							<div class="d-inline-block">
								<div class="media align-items-end">
									<svg class="svg-icon svg-icon-big svg-icon-light">
                      <use xlink:href="#helpline-24h-1"> </use>
                    </svg>
									<div class="media-body text-left ml-3">
										<h6 class="text-uppercase mb-1">Hỗ trợ 24/7</h6>
										<p class="text-small mb-0 text-muted">Liên hệ tổng đài 19001xxx </p>
									</div>
								</div>
							</div>
						</div>
						<div class="col-lg-4">
							<div class="d-inline-block">
								<div class="media align-items-end">
									<svg class="svg-icon svg-icon-big svg-icon-light">
                      <use xlink:href="#label-tag-1"> </use>
                    </svg>
									<div class="media-body text-left ml-3">
										<h6 class="text-uppercase mb-1">Giá cả cạnh tranh</h6>
										<p class="text-small mb-0 text-muted">Thấp nhất thị trường</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
			<!-- NEWSLETTER-->
			<!-- <section class="py-5">
				<div class="container p-0">
					<div class="row">
						<div class="col-lg-6 mb-3 mb-lg-0">
							<h5 class="text-uppercase">Let's be friends!</h5>
							<p class="text-small text-muted mb-0">Nisi nisi tempor
								consequat laboris nisi.</p>
						</div>
						<div class="col-lg-6">
							<form action="#">
								<div class="input-group flex-column flex-sm-row mb-3">
									<input class="form-control form-control-lg py-3" type="email"
										placeholder="Enter your email address"
										aria-describedby="button-addon2">
									<div class="input-group-append">
										<button class="btn btn-dark btn-block" id="button-addon2"
											type="submit">Subscribe</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section> -->
		</div>
		<c:import url="includes/footer.jsp" />
		<!-- JavaScript files-->
		<c:import url="includes/base-js.jsp" />
		<script>
			// ------------------------------------------------------- //
			//   Inject SVG Sprite - 
			//   see more here 
			//   https://css-tricks.com/ajaxing-svg-sprite/
			// ------------------------------------------------------ //
			function injectSvgSprite(path) {

				var ajax = new XMLHttpRequest();
				ajax.open("GET", path, true);
				ajax.send();
				ajax.onload = function(e) {
					var div = document.createElement("div");
					div.className = 'd-none';
					div.innerHTML = ajax.responseText;
					document.body
							.insertBefore(div, document.body.childNodes[0]);
				}
			}
			// this is set to BootstrapTemple website as you cannot 
			// inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
			// while using file:// protocol
			// pls don't forget to change to your domain :)
			injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');
			
			// map product properties to modal when click
			prepareModalAction()
			// asign cart event listener
			prepareCartAction()
		</script>
		<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
			integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
			crossorigin="anonymous">
	</div>
</body>
</html>