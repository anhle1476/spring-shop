package com.codegym.springshop.service;

import com.codegym.springshop.model.dto.MetaDataDTO;

public interface IMetaDataService {
	MetaDataDTO getMetaData();
	
	boolean addAttribute(String attribute, String value);
	
	boolean updateAttribute(String attribute, String value);
	
	boolean deleteAttribute(String attribute);
	
	boolean updateMetaData(MetaDataDTO dto);
}
