package com.codegym.springshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codegym.springshop.dao.IMetaDataDAO;
import com.codegym.springshop.model.dto.MetaDataDTO;

@Service
public class MetaDataService implements IMetaDataService {

	@Autowired
	IMetaDataDAO metaDataDAO;
	
	@Override
	public MetaDataDTO getMetaData() {
		try {
			return metaDataDAO.getMetaData();
		} catch (Exception e) {
			e.printStackTrace();
			return new MetaDataDTO();
		}
	}

	@Override
	public boolean addAttribute(String attribute, String value) {
		try {
			return metaDataDAO.addAttribute(attribute, value);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateAttribute(String attribute, String value) {
		try {
			return metaDataDAO.updateAttribute(attribute, value);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteAttribute(String attribute) {
		try {
			return metaDataDAO.deleteAttribute(attribute);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateMetaData(MetaDataDTO dto) {
		try {
			return metaDataDAO.updateMetaData(dto);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
