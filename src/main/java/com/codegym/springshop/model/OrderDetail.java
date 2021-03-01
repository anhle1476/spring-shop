package com.codegym.springshop.model;

import java.util.ArrayList;
import java.util.List;

public class OrderDetail {
	private List<Detail> details = new ArrayList<>();

	public OrderDetail() {}
	
	public List<Detail> getDetails() {
		return details;
	}

	public void setDetails(List<Detail> details) {
		this.details = details;
	}
	
	public void addDetail(Detail detail ) {
		this.details.add(detail);
	}

	@Override
	public String toString() {
		return "OrderDetail [details=" + details + "]";
	}

}
