package com.codegym.springshop.controller.admin;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.codegym.springshop.model.User;
import com.codegym.springshop.model.dto.NotificationDTO;
import com.codegym.springshop.service.IPaymentService;
import com.codegym.springshop.service.IUserService;

@Controller
public class AdminDashboardController {
	
	@Autowired
	IPaymentService paymentService;
	@Autowired
	IUserService userService;

	@GetMapping("/admin")
	public String showDashboard(Model model, @SessionAttribute("user") User user) {
		Map<String, Long> statistic = paymentService.getStatistic();
		model.addAttribute("statistic", statistic);
		
		User changePassword = new User(user.getId());
		model.addAttribute("changePassword", changePassword);
		return "admin/admin-home";
	}
	
	@PostMapping("/admin/change-password")
	public String processChangePassword(@ModelAttribute("changePassword") User user, HttpSession session) {
		boolean result = userService.changePassword(user);
		String noteType;
		String message;
		if (result) {
			noteType = NotificationDTO.SUCCESS;
			message = "Đổi mật khẩu thành công.";
		} else {
			noteType = NotificationDTO.FAILED;
			message = "Sai mật khẩu. Đổi mật khẩu thất bại.";
		}
		
		NotificationDTO dto = new NotificationDTO(noteType, message);
		session.setAttribute("notifications", new NotificationDTO[] {dto} );
		return "redirect:/admin";
	}
}
