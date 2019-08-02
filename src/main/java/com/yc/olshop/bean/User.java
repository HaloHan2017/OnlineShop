package com.yc.olshop.bean;

import java.util.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

public class User {
	private Integer uid;
	// 用户名不能为空，长度3-10，必须是英文和数字
	@NotBlank(message = "用户名不能为空")
	@Size(min = 4, max = 10, message = "用户名长度必须3-10")
	@Pattern(regexp = "^[a-zA-Z0-9]{3,9}$", message = "用户名必须包含字母和数字")
	private String username;

	// 密码不能为空，长度5-15，必须是英文和数字
	@NotBlank(message = "密码不能为空")
	@Size(min = 5, max = 15, message = "密码长度必须5-15")
	@Pattern(regexp = "^[a-zA-Z0-9]{4,14}$", message = "密码必须包含字母和数字")
	private String password;

	// 姓名不能为空，且长度3-15，格式必须为中文或英文
	@NotBlank(message = "姓名不能为空")
	@Size(min = 3, max = 15, message = "姓名长度必须3-15")
	@Pattern(regexp = "^[\u4e00-\u9fa5a-zA-Z]{2,14}", message = "姓名必须是英文或者汉字")
	private String name;

	// 性别不能为空
	// @NotNull(message = "性别不能为空")
	private String sex;

	// 手机号不能为空，且格式需正确
	@NotBlank(message = "手机号不能为空")
	@Pattern(regexp = "0?(13|14|15|18|17)[0-9]{9}", message = "手机号格式不正确")
	private String phone;

	private String email;

	private Date regtime;

	private String head;

	private Integer scores;

	private String level;

	// 附加属性，确认密码
	@NotBlank(message = "确认密码不能为空")
	@Size(min = 5, max = 15, message = "确认密码长度必须5-15")
	@Pattern(regexp = "^[a-zA-Z0-9]{4,14}$", message = "确认密码必须包含字母和数字")
	private String repassword;

	private Integer state;

	// 该等级的用户数量
	private Integer levelCount;

	// 用户总数量
	private Integer userCount;

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getLevelCount() {
		return levelCount;
	}

	public void setLevelCount(Integer levelCount) {
		this.levelCount = levelCount;
	}

	public Integer getUserCount() {
		return userCount;
	}

	public void setUserCount(Integer userCount) {
		this.userCount = userCount;
	}

	public String getRepassword() {
		return repassword;
	}

	public void setRepassword(String repassword) {
		this.repassword = repassword;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex == null ? null : sex.trim();
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone == null ? null : phone.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public Date getRegtime() {
		return regtime;
	}

	public void setRegtime(Date regtime) {
		this.regtime = regtime;
	}

	public String getHead() {
		return head;
	}

	public void setHead(String head) {
		this.head = head == null ? null : head.trim();
	}

	public Integer getScores() {
		return scores;
	}

	public void setScores(Integer scores) {
		this.scores = scores;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level == null ? null : level.trim();
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", username=" + username + ", password=" + password + ", name=" + name + ", sex="
				+ sex + ", phone=" + phone + ", email=" + email + ", regtime=" + regtime + ", head=" + head
				+ ", scores=" + scores + ", level=" + level + ", repassword=" + repassword + ", state=" + state
				+ ", levelCount=" + levelCount + ", userCount=" + userCount + "]";
	}

}