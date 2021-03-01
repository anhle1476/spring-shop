<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Spring | Home Page</title>
<meta name="description" content="Spring clothing shop">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="robots" content="all,follow">
<c:import url="includes/base-css.jsp" />
</head>
<body>
	<div class="page-holder bg-light">
		<!-- navbar-->
		<c:import url="includes/navbar.jsp" />
		<section class="py-5">
			<div class="container">
				<div class="row mb-5">
					<div class="col-lg-6">
						<!-- PRODUCT SLIDER-->
						<div class="row m-sm-0">
							<div class="col-sm-12 order-1 order-sm-2">
								<div class="owl-carousel product-slider">
									<a class="d-block" href="#">
										<img class="img-fluid" src="${ product.imgUrl }">
									</a>
								</div>
							</div>
						</div>
					</div>
					<!-- PRODUCT DETAILS-->
					<div class="col-lg-6">
						<h1>${ product.name }</h1>
						<p class="text-muted lead">${ product.price } ₫</p>
						<p class="text-small mb-4">${ product.details }</p>
						<div class="row align-items-stretch mb-4">
							<div class="col-sm-5 pr-sm-0">
								<div
									class="border d-flex align-items-center justify-content-between py-1 px-3 bg-white border-white">
									<span class="small text-uppercase text-gray mr-4 no-select">Số lượng trong giỏ hàng</span>
									<div class="quantity">
					                    <button class="dec-btn p-0 cart-action"
					                    	data-cart-action="decrease"
											data-product-id="${ product.id }"
											data-product-price="${ product.price }">
					                    	<i class="fas fa-caret-left"></i>
					                    </button>
					                    <input class="form-control form-control-sm border-0 shadow-0 p-0" 
					                    	type="text" value="0"
					                    	id="quantity-${ product.id }" />
					                    <button class="inc-btn p-0 cart-action"
					                    	data-cart-action="increase"
											data-product-id="${ product.id }"
											data-product-price="${ product.price }">
					                    	<i class="fas fa-caret-right"></i>
					                    </button>
					                 </div>
								</div>
							</div>
						</div>

						<br>
						<ul class="list-unstyled small d-inline-block">
							<li class="px-3 py-2 mb-1 bg-white"><strong
								class="text-uppercase">ID:</strong><span
								class="ml-2 text-muted">${ product.id }</span></li>
							<li class="px-3 py-2 mb-1 bg-white text-muted">
								<strong class="text-uppercase text-dark">Danh mục:</strong>
								<a class="reset-anchor ml-2" href="${pageContext.request.contextPath}/categories/${ product.category.id }">
									${ product.category.name }
								</a>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</section>

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
			

			function updateCartTotal() {
				const total = Array.from(document.getElementsByClassName("product-total"))
					.reduce((acc, current) => acc + Number(current.innerText), 0);
				$("#cart-total").html(total + " ₫");
			}
			
			prepareCartAction();
			const prodId = Number("${ product.id }");
			const prodCart = getCart();
			document.getElementById("quantity-" + prodId).value = !prodCart[prodId] ? 0 : prodCart[prodId];
		</script>
		<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
			integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
			crossorigin="anonymous">
	</div>
</body>
</html>