package com.codegym.springshop.dao.extractor;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

public class PaymentStatisticExtractor implements ResultSetExtractor<Map<String, Long>> {

	@Override
	public Map<String, Long> extractData(ResultSet rs) throws SQLException, DataAccessException {
		Map<String, Long> map = new HashMap<>();
		if (!rs.next())
			return map;
		
		ResultSetMetaData md = rs.getMetaData();
        int counter = md.getColumnCount();
        for (int loop = 1; loop <= counter; loop++) {
           String colName = md.getColumnLabel(loop);
           map.put(colName, rs.getLong(colName));
        }
        
		return map;
	}
	
}
