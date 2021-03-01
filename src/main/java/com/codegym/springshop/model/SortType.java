package com.codegym.springshop.model;

public enum SortType {
	DEFAULT("default"),
	BY_PRICE_ASC("price-asc"),
	BY_PRICE_DESC("price-desc");
	
	private String value;
	
	SortType(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}
	
	public static SortType parseValue(String value) {
		for (SortType type : SortType.values()) {
			if (type.getValue().equalsIgnoreCase(value))
				return type;
		}
		return DEFAULT;
	}
	
}
