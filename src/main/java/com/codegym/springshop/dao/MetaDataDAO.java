package com.codegym.springshop.dao;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.codegym.springshop.dao.extractor.MetaDataExtractor;
import com.codegym.springshop.model.dto.MetaDataDTO;

@Repository
public class MetaDataDAO implements IMetaDataDAO {
	
	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public MetaDataDTO getMetaData() {
		String sql = "SELECT `attribute`, `value` FROM `metaData`";
		return jdbcTemplate.query(sql, new MetaDataExtractor());
	}

	@Override
	public boolean addAttribute(String attribute, String value) {
		String sql = "INSERT INTO `metaData`(`attribute`, `value`) VALUES (?, ?)";
		return jdbcTemplate.update(sql, attribute, value) == 1;
	}

	@Override
	public boolean updateAttribute(String attribute, String value) {
		String sql = "UPDATE `metaData` SET `value` = ? WHERE `attribute` = ?";
		return jdbcTemplate.update(sql, attribute, value) == 1;
	}

	@Override
	public boolean deleteAttribute(String attribute) {
		String sql = "DELETE FROM `metaData` WHERE `attribute` = ?";
		return jdbcTemplate.update(sql, attribute) == 1;
	}

	@Override
	@Transactional
	public boolean updateMetaData(MetaDataDTO dto) {
		String sql = "UPDATE `metaData` SET `value` = ? WHERE `attribute` = ?";
		List<Object[]> batchArgs = new ArrayList<>();
		for (String attribute : dto.attributeSet()) {
			String value = dto.getAttribute(attribute);
			batchArgs.add(new Object[] {value, attribute});
		}
		
		int[] rowsAffected = jdbcTemplate.batchUpdate(sql, batchArgs);
		for (int row : rowsAffected ) {
			if (row != 1) {
				throw new RuntimeException("Invalid row affected number " + Arrays.toString(rowsAffected));
			}
		}
		return true;
	}

	
}
