package com.codegym.springshop.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codegym.springshop.model.dto.MetaDataDTO;
import com.codegym.springshop.model.dto.NotificationDTO;
import com.codegym.springshop.service.IMetaDataService;

@Controller
public class AdminMetaDataController {

	@Autowired
	private IMetaDataService metaDataService;
	
	@GetMapping("/admin/metadata")
	public String showMetaDataPage(Model model) {
		MetaDataDTO metaData = metaDataService.getMetaData();
		model.addAttribute("meta", metaData);
		return "admin/admin-metadata-editor";
	}
	
	@PostMapping("/admin/metadata")
	public String processAddProduct(@RequestParam MultiValueMap<String, String> parameters, Model model) {
		MetaDataDTO metaData = new MetaDataDTO();
		metaData.setMetaData(parameters.toSingleValueMap());
		
		boolean result = metaDataService.updateMetaData(metaData);
		if (result == false) {
			model.addAttribute("meta", metaData);
			NotificationDTO notification = new NotificationDTO("bg-danger", "Đã có lỗi xảy ra. Cập nhật thông tin thất bại");
			model.addAttribute("notifications", new NotificationDTO[] {notification});
			return "admin/admin-metadata-editor";
		} else {			
			return "redirect:/admin/metadata";
		}
		
	}
}
