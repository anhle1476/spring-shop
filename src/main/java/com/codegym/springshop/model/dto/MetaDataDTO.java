package com.codegym.springshop.model.dto;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class MetaDataDTO {
	private Map<String, String> metaData = new HashMap<>();

	public MetaDataDTO() {
	}

	public Map<String, String> getMetaData() {
		return metaData;
	}

	public void setMetaData(Map<String, String> metaData) {
		this.metaData = metaData;
	}

	public void setAttribute(String attribute, String value) {
		metaData.put(attribute, value);
	}

	public String getAttribute(String attribute) {
		return metaData.get(attribute);
	}

	public int size() {
		return metaData.size();
	}

	public Set<String> attributeSet() {
		return metaData.keySet();
	}

	@Override
	public String toString() {
		return "MetaDataDTO [" + metaData + "]";
	}

}
