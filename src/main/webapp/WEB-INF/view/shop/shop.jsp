<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Spring | Categories</title>
<meta name="description" content="Spring clothing shop">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<c:import url="includes/base-css.jsp" />


</head>
<body>
	<div class="page-holder">
		<!-- navbar-->
		<c:import url="includes/navbar.jsp" />
		<!--  Modal -->
		<c:import url="includes/modal.jsp" />
		<div class="container">
			<!-- HERO SECTION-->
			<section class="py-5 bg-light">
				<div class="container">
					<div class="row px-4 px-lg-5 py-lg-4 align-items-center">
						<div class="col-lg-6">
							<h1 class="h2 text-uppercase mb-0">SẢN PHẨM</h1>
						</div>
						<div class="col-lg-6 text-lg-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb justify-content-lg-end mb-0 px-0">
									<li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/">Trang
											chủ</a></li>
									<li class="breadcrumb-item active" aria-current="page">Danh
										mục sản phẩm</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</section>
			<section class="py-5">
				<div class="container p-0">
					<div class="row">
						<!-- SHOP SIDEBAR-->
						<div class="col-lg-3 order-2 order-lg-1">
							<h5 class="text-uppercase mb-4">CÁC DANH MỤC</h5>
							<!-- CATEGORIES -->

							<div
								class='py-2 px-4 ${ dto.categoryId == 0 ? "bg-dark" : "bg-light" } mb-3'>
								<a href="${pageContext.request.contextPath}/categories"
									class="small text-uppercase ${ dto.categoryId == 0 ? "text-white" : "text-dark" } font-weight-bold" >
									tất cả </a>
							</div>
							<c:forEach items="${ catDto.categories }" var="category">
								<div
									class='py-2 px-4 ${ category.id == dto.categoryId ? "bg-dark" : "bg-light" } mb-3'>
									<a href="${pageContext.request.contextPath}/categories/${category.id}?page=1"
										class="small text-uppercase ${ category.id == dto.categoryId ? "text-white" : "text-dark" } font-weight-bold" >
										${ category.name } </a>
								</div>
							</c:forEach>
							<!-- PRICE RANGE -->
							<!-- 							
							<h6 class="text-uppercase mb-4">Price range</h6>
							<div class="price-range pt-4 mb-5">
								<div id="range"></div>
								<div class="row pt-2">
									<div class="col-6">
										<strong class="small font-weight-bold text-uppercase">From</strong>
									</div>
									<div class="col-6 text-right">
										<strong class="small font-weight-bold text-uppercase">To</strong>
									</div>
								</div>
							</div> 
							-->

						</div>
						<!-- SHOP LISTING-->
						<div class="col-lg-9 order-1 order-lg-2 mb-5 mb-lg-0">
							<div class="row mb-3 align-items-center">
								<div class="col-12">
									<!-- SORT ORDER -->
									<!-- 
									<ul
										class="list-inline d-flex align-items-center justify-content-lg-end mb-0">
										<li class="list-inline-item"><select
											class="selectpicker ml-auto" name="sorting" data-width="200"
											data-style="bs-select-form-control"
											data-title="Mới nhất">
												<option value="default">Mới nhất</option>
												<option value="price-asc">Giá thấp nhất</option>
												<option value="price-desc">Giá cao nhất</option>
										</select></li>
									</ul> 
									-->
								</div>
							</div>
							<div class="row">
								<!-- PRODUCT-->
								<c:forEach items="${ dto.products }" var="product">
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
														<li class="list-inline-item m-0 p-0 cart-action"><button
															class="btn btn-sm btn-dark"
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
							<!-- PAGINATION-->
							<nav aria-label="Page navigation example">
								<ul
									class="pagination justify-content-center justify-content-lg-end">
									<c:set var="pageUrl"
										value='${pageContext.request.contextPath}/categories/${ dto.categoryId == 0 ? "" : dto.categoryId }' />
									<li class='page-item ${ dto.page - 1 == 0 ? "disabled" : "" }'>
										<a class="page-link" href='${pageUrl}?page=${ dto.page - 1 }'
										aria-label="Previous"> <span aria-hidden="true">«</span>
									</a>
									</li>

									<c:forEach begin="1" end="${ dto.maxPage }" var="pageLink">
										<li
											class='page-item ${ pageLink == dto.page ? "active" : "" }'>
											<a class="page-link" href='${pageUrl}?page=${pageLink}'>${pageLink}</a>
										</li>
									</c:forEach>
									<li
										class='page-item ${ dto.page + 1 > dto.maxPage ? "disabled" : "" }'>
										<a class="page-link" href='${pageUrl}?page=${dto.page + 1}'
										aria-label="Next"> <span aria-hidden="true">»</span>
									</a>
									</li>
								</ul>
							</nav>
						</div>
					</div>
				</div>
			</section>
		</div>

		<c:import url="includes/footer.jsp" />		
		<!-- JavaScript files-->
		<c:import url="includes/base-js.jsp" />
		<!-- Nouislider Config-->
		<script>
			var range = document.getElementById('range');
			noUiSlider.create(range, {
				range : {
					'min' : 0,
					'max' : 2000
				},
				step : 5,
				start : [ 100, 1000 ],
				margin : 300,
				connect : true,
				direction : 'ltr',
				orientation : 'horizontal',
				behaviour : 'tap-drag',
				tooltips : true,
				format : {
					to : function(value) {
						return '$' + value;
					},
					from : function(value) {
						return value.replace('', '');
					}
				}
			});
		</script>
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