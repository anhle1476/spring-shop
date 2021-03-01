package com.codegym.springshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codegym.springshop.model.Order;
import com.codegym.springshop.model.PaymentStatus;
import com.codegym.springshop.service.IPaymentService;

@Controller
public class AdminPaymentController {

	@Autowired
	IPaymentService paymentService;

	@GetMapping("/admin/unconfirmed")
	public String showUnconfirmedPaymentsPage(Model model) {

		List<Order> orders = paymentService.showAllPayments(PaymentStatus.UNCONFIRMED);
		model.addAttribute("orders", orders);

		return "admin/admin-unconfirmed-orders";
	}
	

	@GetMapping("/admin/processing")
	public String showProcessingPaymentsPage(Model model) {

		List<Order> orders = paymentService.showAllPayments(PaymentStatus.PROCESSING);
		model.addAttribute("orders", orders);

		return "admin/admin-processing-orders";
	}
	

	@GetMapping("/admin/paid")
	public String showPaidPaymentsPage(Model model) {

		List<Order> orders = paymentService.showAllPayments(PaymentStatus.PAID);
		model.addAttribute("orders", orders);

		return "admin/admin-paid-orders";
	}
	
	@GetMapping("/admin/order/{orderId}")
	public String showOrderEditor(
			@PathVariable("orderId") int id, 
			Model model) {
		Order order = paymentService.showPaymentById(id);
		if (order == null)
			return "redirect:/admin";
		
		model.addAttribute("order", order);
		return "admin/admin-order-editor";
	}
	

	@PostMapping("/admin/order/{orderId}")
	public String processEditOrder(
			@PathVariable("orderId") int id, 
			@RequestParam("statusCode") int statusCode,
			@ModelAttribute("order") Order order) {
		boolean result = paymentService.editPaymentInfo(order);
		if (!result)
			return "redirect:/admin/order/" + id;
		
		return getRedirectPageFromStatusCode(statusCode);
	}
	
	@GetMapping("/admin/order/next-state/{orderId}")
	public String processOrderToNextStep(
			@PathVariable("orderId") int id, 
			@RequestParam(name = "from", defaultValue = "1") int from,
			Model model) {
		paymentService.changePaymentStatus(id);
		return getRedirectPageFromStatusCode(from);
	}
	
	private String getRedirectPageFromStatusCode(int statusCode) {
		PaymentStatus status = PaymentStatus.getPaymentStatus(statusCode);
		
		if (status == PaymentStatus.PAID)
			return "redirect:/admin/paid";
		
		if (status == PaymentStatus.PROCESSING)
			return "redirect:/admin/processing";
		
		return "redirect:/admin/unconfirmed";
	}
	

}
