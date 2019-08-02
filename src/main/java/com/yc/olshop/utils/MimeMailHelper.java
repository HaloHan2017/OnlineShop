package com.yc.olshop.utils;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

/**
 * MimeMessageHelper的基本用法 Created by IntelliJ IDEA. User: Administrator Date:
 * 12-6-13 Time: 上午11:19 To change this template use File | Settings | File
 * Templates.
 */
public class MimeMailHelper {

	private JavaMailSender javaMailSender;

	public void setJavaMailSender(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}

	public int sendEmail(String to, String subject, String content) {

		MimeMessage message = javaMailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);

		try {
			helper.setTo(to);// toXXX邮箱
			helper.setFrom("1006653740@qq.com"); // from XXX邮箱
			helper.setSubject(subject);
			helper.setText(content);
			javaMailSender.send(message);
			return 1;
		} catch (MessagingException e) {
			e.printStackTrace();
			return 0;
		}

	}
}
