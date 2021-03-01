package com.codegym.springshop.propertyeditor;

import java.beans.PropertyEditorSupport;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.function.Function;
import java.util.stream.Collectors;

import com.codegym.springshop.model.OrderDetail;
import com.codegym.springshop.model.Detail;
import com.codegym.springshop.model.Product;
import com.codegym.springshop.service.IProductService;

public class OrderDetailPropertyEditor extends PropertyEditorSupport {

	private static final Function<Detail, String> DETAIL_MAPPER = detail -> String.format("%dx%d",
			detail.getProduct().getId(), detail.getQuantity());

	private IProductService productService;

	public OrderDetailPropertyEditor(IProductService productService) {
		this.productService = productService;
	}

	@Override
	public String getAsText() {
		try {			
			OrderDetail orderDetail = (OrderDetail) getValue();
			List<Detail> details = orderDetail.getDetails();
			
			return details.stream().map(DETAIL_MAPPER).collect(Collectors.joining(","));
		} catch (Exception ignored) {
			return "";
		}
	}

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		String[] productsWithQuantity = text.split(",");

		List<String> idList = new ArrayList<>();
		Map<Integer, Integer> idAndQuantity = new HashMap<>();

		for (String productWithQuantity : productsWithQuantity) {
			String[] parts = productWithQuantity.split("x");
			if (parts.length != 2)
				throw new IllegalArgumentException("Invalid order details");

			idList.add(parts[0]);

			int id = Integer.parseInt(parts[0]);
			int quantity = Integer.parseInt(parts[1]);
			idAndQuantity.put(id, quantity);
		}

		Map<Integer, Product> productMap = productService.getProductsIn(String.join(",", idList))
				.stream()
				.collect(Collectors.toMap(Product::getId, Function.identity()));

		OrderDetail orderDetail= new OrderDetail();

		for (Entry<Integer, Integer> entry : idAndQuantity.entrySet()) {
			Product product = productMap.get(entry.getKey());
			Detail detail = new Detail(product, entry.getValue());
			orderDetail.addDetail(detail);
		}

		setValue(orderDetail);
	}

}
