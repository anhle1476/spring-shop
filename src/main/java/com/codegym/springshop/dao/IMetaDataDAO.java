package com.codegym.springshop.dao;

import com.codegym.springshop.model.dto.MetaDataDTO;

public interface IMetaDataDAO {
	MetaDataDTO getMetaData();
	
	boolean addAttribute(String attribute, String value);
	
	boolean updateAttribute(String attribute, String value);
	
	boolean deleteAttribute(String attribute);
	
	boolean updateMetaData(MetaDataDTO dto);
}
