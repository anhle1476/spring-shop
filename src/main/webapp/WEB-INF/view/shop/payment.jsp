<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
	<div class="page-holder">
		<!-- navbar-->
		<c:import url="includes/navbar.jsp" />
		
		<div class="container">
			<!-- HERO SECTION-->
			<section class="py-5 bg-light">
				<div class="container">
					<div class="row px-4 px-lg-5 py-lg-4 align-items-center">
						<div class="col-lg-6">
							<h1 class="h2 text-uppercase mb-0">Thanh toán</h1>
						</div>
						<div class="col-lg-6 text-lg-right">
							<nav aria-label="breadcrumb">
								<ol class="breadcrumb justify-content-lg-end mb-0 px-0">
									<li class="breadcrumb-item">
										<a href="${pageContext.request.contextPath}/">Trang chủ</a>
									</li>
									<li class="breadcrumb-item">
										<a href="${pageContext.request.contextPath}/cart">Giỏ hàng</a>
									</li>
									<li class="breadcrumb-item active" aria-current="page">Thanh toán</li>
								</ol>
							</nav>
						</div>
					</div>
				</div>
			</section>
			<section class="py-5">
				<!-- BILLING ADDRESS-->
				<h2 class="h5 text-uppercase mb-4">Thông tin đơn hàng</h2>
				<div class="row">
					<div class="col-lg-8">
						<form:form method="post" modelAttribute="order" onsubmit="confirmOrder()">
							<form:hidden path="orderDetail" id="orderDetail"/>
							<div class="row">
								<div class="col-lg-12 form-group">
									<label class="text-small text-uppercase" for="name">Họ và tên</label>
									<form:input path="paymentInfo.name" id="name" 
										cssClass="form-control form-control-lg" 
										required="required" 
										placeholder="VD: Nguyễn Văn A"
										/>
								</div>
								<div class="col-lg-6 form-group">
									<label class="text-small text-uppercase" for="email">Email</label>
									<form:input path="paymentInfo.email" id="email" 
										cssClass="form-control form-control-lg" 
										type="email"
										required="required" 
										placeholder="VD: nguyenvana@gmail.com"
										/>
								</div>
								<div class="col-lg-6 form-group">
									<label class="text-small text-uppercase" for="phone">Số điện thoại</label>
									<form:input path="paymentInfo.phone" id="phone" 
										cssClass="form-control form-control-lg" 
										required="required" 
										placeholder="VD: 0391085xxx"
										/>
								</div>
								<div class="col-lg-12 form-group">
									<label class="text-small text-uppercase" for="address">Địa chỉ</label>
									<form:input path="paymentInfo.address" id="address" 
										cssClass="form-control form-control-lg" 
										required="required" 
										placeholder="VD: 39 Phạm Thị Liên, phường X, thành phố Y"
										/>
								</div>
								<div class="col-lg-12 form-group">
									<button class="btn btn-dark" type="submit">Đặt hàng</button>
								</div>
							</div>
						</form:form>
					</div>
					<!-- ORDER SUMMARY-->
					<div class="col-lg-4">
						<div class="card border-0 rounded-0 p-lg-4 bg-light">
							<div class="card-body">
								<h5 class="text-uppercase mb-4">Sản phẩm</h5>
								<ul class="list-unstyled mb-0" id="payment-products">
									<!-- 
									<li class="d-flex align-items-center justify-content-between">
										<strong class="small font-weight-bold">Red digital smartwatch </strong>
										<span class="text-muted small">
											<span>$250250250</span>x<span>1</span>
										</span>
									</li>
									 -->
								</ul>
								<ul class="list-unstyled mb-0">
									<li class="d-flex align-items-center justify-content-between"><strong
										class="text-uppercase small font-weight-bold" >Tổng cộng</strong>
										<span id="payment-total">0</span>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</section>
		</div>
		
		<c:import url="includes/footer.jsp" />
		<!-- JavaScript files-->
		<c:import url="includes/base-js.jsp" />
		<c:import url="includes/payment-js.jsp" />
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
			
		</script>
		<!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
		<link rel="stylesheet"
			href="https://use.fontawesome.com/releases/v5.7.1/css/all.css"
			integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
			crossorigin="anonymous">
	</div>
</body>
</html>