<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="true"%>

<script>
//fetch Cart data
const fetchProductUrl = contextPath + '/fetch-products';

function getProductHtml(data, cartData) {
	return `<tr id="cart-row-${ data.id }">
	            <th class="pl-0 border-0" scope="row">
	                <div class="media align-items-center">
	                	<a class="reset-anchor d-block animsition-link" 
	                		href="${contextPath + '/product/' + data.id }">
	                		<img src="${ data.imgUrl }" width="70"/>
	                	</a>
	                  	<div class="media-body ml-3">
	                  		<strong class="h6">
	                  			<a class="reset-anchor animsition-link" 
	                  				href="${contextPath + '/product/' + data.id }">
	                  				${ data.name }
	                  			</a>
	                  		</strong>
	                  	</div>
	                </div>
	          	</th>
	          <td class="align-middle border-0">
	            <p class="mb-0 small">${ data.price }</p>
	          </td>
	          <td class="align-middle border-0">
	            <div class="border d-flex align-items-center justify-content-between px-3">
	            	<span class="small text-uppercase text-gray headings-font-family">
	            		Số lượng
	            	</span>
	                <div class="quantity">
	                    <button class="dec-btn p-0 cart-action"
	                    	data-cart-action="decrease"
							data-product-id="${ data.id }"
							data-product-price="${ data.price }">
	                    	<i class="fas fa-caret-left"></i>
	                    </button>
	                    <input class="form-control form-control-sm border-0 shadow-0 p-0" 
	                    	type="text" value="${ cartData[data.id] }"
	                    	id="quantity-${ data.id }" />
	                    <button class="inc-btn p-0 cart-action"
	                    	data-cart-action="increase"
							data-product-id="${ data.id }"
							data-product-price="${ data.price }">
	                    	<i class="fas fa-caret-right"></i>
	                    </button>
	                 </div>
	            </div>
	          </td>
	          <td class="align-middle border-0">
	            <p class="mb-0 small product-total" id="total-${ data.id }">
	            	${ Number(cartData[data.id]) * data.price }
	            </p>
	          </td>
	          <td class="align-middle border-0">
	          	<button class="btn btn-light reset-anchor cart-action"
	          		data-cart-action="remove"
					data-product-id="${ data.id }"
					data-product-price="${ data.price }"
	          	>
	          		<i class="fas fa-trash-alt small text-muted"></i>
	          	</button>
	          </td>
	        </tr>`;
}

function updateCartTotal() {
	const total = Array.from(document.getElementsByClassName("product-total"))
		.reduce((acc, current) => acc + Number(current.innerText), 0);
	$("#cart-total").html(total + " ₫");
}

function prepareCart() {
	const cartData = getCart();
	            
    $.post(fetchProductUrl, cartData)
    	.done((response) => {
    		let productData = JSON.parse(response);
    		let productsHtml = productData.reduce((acc,data) => acc + getProductHtml(data, cartData), "");
    		
    		$("#cart-table").html(productsHtml);
    		
    		// asign cart event listener
    		prepareCartAction();
    		updateCartTotal();
    	}
    );
}
prepareCart();
	
</script>