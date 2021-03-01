package com.codegym.springshop.model.dto;

public class NotificationDTO {
	public static final String SUCCESS = "bg-success";
	public static final String FAILED = "bg-danger";
	
	String className;
	String message;
	
	public NotificationDTO() {}
	
	public NotificationDTO(String className, String message) {
		this.className = className;
		this.message = message;
	}
	public String getClassName() {
		return className;
	}
	public void setClassName(String className) {
		this.className = className;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	@Override
	public String toString() {
		return "Notification[className=" + className + ", message=" + message + "]";
	}
	
	
}
