package com.codegym.springshop.controller.admin;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.codegym.springshop.service.ICategoryService;
import com.codegym.springshop.service.IPaymentService;
import com.codegym.springshop.service.IProductService;
import com.codegym.springshop.service.PaymentService;

@Controller
public class AdminDeleteRequestController {
	
	@Autowired
	IProductService productService;
	@Autowired
	ICategoryService categoryService;
	@Autowired
	IPaymentService paymentService;
	
	@ResponseBody
	@PostMapping("/admin/prequest-processor")
	public void handleDeleteRequest(
				@RequestParam("action") String action,
				@RequestParam("objId") int objId,
				HttpServletResponse response
			) throws IOException {
		
		
		String template = "{\"request\":\"%s\",\"objId\":%d,\"isSuccess\": %s,\"message\":\"%s\"}";
		boolean isSuccess;
		String message;
		switch (action) {
		case "delete-product":
			isSuccess = productService.deleteObj(objId);
			message = "Xóa sản phẩm " + getResultStr(isSuccess);
			break;
		case "delete-category":
			isSuccess = categoryService.deleteObj(objId);
			message = "Xóa danh mục " + getResultStr(isSuccess);
			break;
		case "delete-order":
			isSuccess = paymentService.deletePayment(objId);
			message = "Xóa đơn hàng " + getResultStr(isSuccess);
			break;
		default:
			isSuccess = false;
			message = "Hành động thất bại. Đã có lỗi xảy ra!";
		}
		response.setHeader("Content-Type", "text/html; charset=UTF-8");
		response.getWriter().write(String.format(template, action, objId, isSuccess, message));
		
	}

	private String getResultStr(boolean isSuccess) {
		return isSuccess ? " thành công." : " thất bại.";
	}

}
