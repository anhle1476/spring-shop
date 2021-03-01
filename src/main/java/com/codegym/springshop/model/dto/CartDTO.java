package com.codegym.springshop.model.dto;

import java.util.LinkedHashMap;
import java.util.Map;

import com.codegym.springshop.model.Product;

public class CartDTO {

	private Map<Product, Integer> cart = new LinkedHashMap<>();

	public CartDTO() {}
	
	public Map<Product, Integer> getCart() {
		return cart;
	}

	public void setCart(Map<Product, Integer> cart) {
		this.cart = cart;
	}


	public int getProductQuantity(Product product) {
		Integer quantity = cart.get(product);
		return quantity == null ? 0 : quantity;
	}
	
	public void increaseQuantity(Product product) {
		int quantity = getProductQuantity(product);
		cart.put(product, quantity + 1);
	}

	public void decreaseQuantity(Product product) {
		int quantity = getProductQuantity(product);
		if (quantity - 1 == 0) {
			removeProduct(product);
		} else {			
			cart.put(product, quantity - 1);
		}
	}
	
	public void removeProduct(Product product) {
		cart.remove(product);
	}
	

	@Override
	public String toString() {
		return "CartDTO [cart=" + cart + "]";
	}
	
	
	
}
