<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<script
	src="${pageContext.request.contextPath}/shop-resources/vendor/jquery/jquery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/shop-resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
 <script
	src="${pageContext.request.contextPath}/shop-resources/vendor/nouislider/nouislider.min.js"></script>
<script
	src="${pageContext.request.contextPath}/shop-resources/vendor/bootstrap-select/js/bootstrap-select.min.js"></script>
<script
	src="${pageContext.request.contextPath}/shop-resources/vendor/owl.carousel2/owl.carousel.min.js"></script>
<script
	src="${pageContext.request.contextPath}/shop-resources/vendor/owl.carousel2.thumbs/owl.carousel2.thumbs.min.js"></script>
<script
	src="${pageContext.request.contextPath}/shop-resources/js/front.js"></script>
<script>
	
	const contextPath = '${pageContext.request.contextPath}';
	// map product properties to modal when click
	const modalImg = document.getElementById("modal-img");
	const modalName = document.getElementById("modal-name");
	const modalPrice = document.getElementById("modal-price");
	const modalDesc = document.getElementById("modal-desc");
	function prepareModalAction() {
		Array.from(document.getElementsByClassName("toggle-btn")).forEach(btn => {
		    btn.addEventListener("click", ({target}) => {
		        const id = Number(target.id.slice(7));
		        const imgUrl = document.getElementById("product-img-" + id).src;
		        const name = document.getElementById("product-name-" + id).innerText;
		        const price = document.getElementById("product-price-" + id).innerText;
		        const desc = document.getElementById("product-desc-" + id).innerText;
		        const productUrl = contextPath + "/product/" + id;

		        modalImg.style.background = "url(" + imgUrl + ")";
		        modalImg.href = productUrl;
		        modalName.innerText = name;
		        modalName.href = productUrl;
		        modalPrice.innerText = price;
		        modalDesc.innerText = desc;
		        }
		    )
		})
	}


	function prepareCartAction() {
		updateNavbarCartCounter(getCart());
		
		Array.from(document.getElementsByClassName("cart-action")).forEach(btn => {
	    	btn.addEventListener("click", ({target}) => {
		        	const productId = target.getAttribute('data-product-id');
		        	const action = target.getAttribute('data-cart-action');
		        	const price = Number(target.getAttribute('data-product-price'));
		        	switch (action) {
		        		case "increase":
		        			increaseQuantity(productId, price);
		        			break;
		        		case "decrease":
		        			decreaseQuantity(productId, price);
		        			break;
		        		case "remove":
		        			removeProduct(productId, price);
		        	}
		        }
		    )
		})
	}
	
	const cartCounter = document.getElementById("cart-counter");
	
	function getCart() {
		const data = sessionStorage.getItem("cart");
		const cart = JSON.parse(data);
		return !cart ? {} : cart;	
	}
	
	function saveCart(cart) {
		const result = JSON.stringify(cart);
		updateNavbarCartCounter(cart);
		sessionStorage.setItem("cart", result);
	}
	
	function updateNavbarCartCounter(cart) {
		const keys = Object.keys(cart);
		cartCounter.innerText = keys.filter(key => Number(cart[key]) > 0).length;
	}
	
	function increaseQuantity(id, price) {
		const cart = getCart()
		
		if (!cart[id]) 
			cart[id] = 1;
		else 
			cart[id] = cart[id] + 1;
		
		console.log("inc " + id + ", price: " + price);
		if (price > 0) {
			$("#quantity-" + id ).val(cart[id]);
			$("#total-" + id ).html(cart[id] * price);
			updateCartTotal();
		}
		saveCart(cart);
	}
	
	function decreaseQuantity(id, price) {
		const cart = getCart();
		
		if (!cart[id]) 
			return;
		
		cart[id] = cart[id] - 1;
		
		console.log("dec " + id + ", price: " + price);
		if (price > 0) {
			$("#quantity-" + id ).val(cart[id]);
			$("#total-" + id ).html(cart[id] * price);
			updateCartTotal();
		}
		
		saveCart(cart);
	}
	
	function removeProduct(id, price) {
		const cart = getCart();
		cart[id] = undefined;
		
		console.log("remove " + id + ", price: " + price);
		if (price > 0) {
			$("#cart-row-" + id ).remove();
			updateCartTotal();
		}
		
		saveCart(cart);
	}
	
	
	
</script>