package com.codegym.springshop.model;

public class User {
	private int id;
	private String username;
	private String currentPassword;
	private String newPassword;

	public User() {
	}

	public User(int id) {
		this.id = id;
	}

	public User(int id, String username) {
		this.id = id;
		this.username = username;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getCurrentPassword() {
		return currentPassword;
	}

	public void setCurrentPassword(String currentPassword) {
		this.currentPassword = currentPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + "]";
	}
}
