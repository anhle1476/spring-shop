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
				<div class="row mb-5 d-flex justify-content-center align-items-center card" >
					<div class="card-body text-center">
						<h2>Đặt hàng thành công</h2>
						<a href="${pageContext.request.contextPath}/"
							class="btn btn-primary btn-block">
							Quay về lại trang chủ
						</a>
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
			

			/*
			function updateCartTotal() {
				const total = Array.from(document.getElementsByClassName("product-total"))
					.reduce((acc, current) => acc + Number(current.innerText), 0);
				$("#cart-total").html(total + " ₫");
			}
 			*/
 			
 			sessionStorage.removeItem("cart");
 			
			prepareCartAction();
			//const prodId = Number("${ product.id }");
			//const prodCart = getCart();
			//document.getElementById("quantity-" + prodId).value = !prodCart[prodId] ? 0 : prodCart[prodId];
		</script>
		<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
			integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
			crossorigin="anonymous">
	</div>
</body>
</html>