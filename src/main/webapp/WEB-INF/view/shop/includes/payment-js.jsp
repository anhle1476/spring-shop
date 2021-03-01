<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="true"%>

<script>

function confirmOrder() {
	const message = "Bạn có chắc chắn những thông tin trên là đúng và xác nhận đặt hàng không?";
	if (!confirm(message))
		return false
	console.log("xoa session");
	/* sessionStorage.removeItem("cart"); */
}

//fetch Cart data
const fetchProductUrl = contextPath + '/fetch-products';

function updateOrderDetailField(cart) {
	const value = Object.keys(cart)
		.filter(prod => cart[prod] > 0)
		.map(prod => prod + "x" + cart[prod])
		.join(",");
	
	$("#orderDetail").val(value);
}

function getProductHtml(data, cartData) {
	if (cartData[data.id] < 1)
		return "";
	
	return `<li class="d-flex align-items-center justify-content-between">
				<strong class="small font-weight-bold">${data.name}</strong>
				<span class="text-muted small">
					<span>${data.price}</span>x<span>${ cartData[data.id] }</span>
				</span>
			</li>
			<li class="border-bottom my-2"></li>`;
}

function preparePayment() {
	const cartData = getCart();
	
	updateOrderDetailField(cartData);
	            
    $.post(fetchProductUrl, cartData)
    	.done((response) => {
    		const productData = JSON.parse(response);
    		const productsHtml = productData.reduce((acc,data) => acc + getProductHtml(data, cartData), "");
    		$("#payment-products").html(productsHtml);
    		const totalPrice = productData.reduce((acc, data) => acc + (data.price * Number(cartData[data.id])), 0);
    		$("#payment-total").html(totalPrice + " ₫");
    	}
    );
}

prepareCartAction();
preparePayment();
	
</script>