package com.codegym.springshop.dao.extractor;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.codegym.springshop.model.dto.MetaDataDTO;

public class MetaDataExtractor implements ResultSetExtractor<MetaDataDTO> {

	@Override
	public MetaDataDTO extractData(ResultSet rs) throws SQLException, DataAccessException {
		MetaDataDTO dto = new MetaDataDTO();
		
		while (rs.next()) {
			String attribute = rs.getString("attribute");
			String value = rs.getString("value");
			dto.setAttribute(attribute, value);
		}
		
		return dto;
	}

}
