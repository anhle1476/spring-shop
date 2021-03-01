package com.codegym.springshop.controller.shop;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codegym.springshop.model.Order;
import com.codegym.springshop.model.OrderDetail;
import com.codegym.springshop.model.Product;
import com.codegym.springshop.propertyeditor.OrderDetailPropertyEditor;
import com.codegym.springshop.service.IPaymentService;
import com.codegym.springshop.service.IProductService;

@Controller
public class CartPageController {
	
	@Autowired
	IPaymentService paymentService;

	@Autowired
	private IProductService productService;

	@GetMapping("/cart")
	public String showCartPage() {
		return "shop/cart";
	}

	@GetMapping("/cart/payment")
	public String showPaymentPage(@ModelAttribute("order") Order order) {
		return "shop/payment";
	}
	
	@PostMapping("/cart/payment")
	public String processPayment(@ModelAttribute("order") Order order, HttpSession session) {
		boolean result = paymentService.addPayment(order);
		if (!result) {
			return "shop/payment";
		}
		session.setAttribute("payment-success", true);
		return "redirect:/cart/payment/success";
	}
	
	@GetMapping("/cart/payment/success")
	public String showPaymentPage(@ModelAttribute("order") Order order, HttpSession session) {
		Object obj = session.getAttribute("payment-success");
		if (obj == null)
			return "redirect:/cart/payment";
		
		session.removeAttribute("payment-success");
		return "shop/payment-success";
	}

	@PostMapping("/fetch-products")
	public void getCartProducts(@RequestParam MultiValueMap<String, String> parameters, HttpServletResponse response)
			throws IOException {

		String productIds = String.join(",", parameters.toSingleValueMap().keySet());
		List<Product> products = productService.getProductsIn(productIds);

		String result = stringifyProducts(products);

		response.setHeader("Content-Type", "text/html; charset=UTF-8");
		response.getWriter().write(result);
	}

	private String stringifyProducts(List<Product> products) {
		return "[" + products.stream()
			.map(product -> productToJSON(product)).collect(Collectors.joining(",")) + "]";
	}

	private String productToJSON(Product product) {
		String template = "{\"id\":%d,\"name\":\"%s\",\"price\":%d,\"imgUrl\":\"%s\"}";
		return String.format(template, product.getId(), product.getName(), product.getPrice(), product.getImgUrl());
	}

	@InitBinder
	public void initBinder(WebDataBinder binder) {
		OrderDetailPropertyEditor orderDetailPropertyEditor = new OrderDetailPropertyEditor(productService);
		binder.registerCustomEditor(OrderDetail.class, "orderDetail", orderDetailPropertyEditor);
	}
}
