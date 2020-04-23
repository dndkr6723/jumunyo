package com.finalp.jumunyo.vo;

import java.util.Date;

public class QuestionVO {
	
	private int question_id;
	private int question_category_id;
	private int user_id_send;
	private String question_title;
	private String question_image;
	private String question_check;
	private Date question_date;
	private int user_id_receive;
	
	
	public int getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(int question_id) {
		this.question_id = question_id;
	}
	public int getQuestion_category_id() {
		return question_category_id;
	}
	public void setQuestion_category_id(int question_category_id) {
		this.question_category_id = question_category_id;
	}
	public int getUser_id_send() {
		return user_id_send;
	}
	public void setUser_id_send(int user_id_send) {
		this.user_id_send = user_id_send;
	}
	public String getQuestion_title() {
		return question_title;
	}
	public void setQuestion_title(String question_title) {
		this.question_title = question_title;
	}
	public String getQuestion_image() {
		return question_image;
	}
	public void setQuestion_image(String question_image) {
		this.question_image = question_image;
	}
	public String getQuestion_check() {
		return question_check;
	}
	public void setQuestion_check(String question_check) {
		this.question_check = question_check;
	}
	public Date getQuestion_date() {
		return question_date;
	}
	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}
	public int getUser_id_receive() {
		return user_id_receive;
	}
	public void setUser_id_receive(int user_id_receive) {
		this.user_id_receive = user_id_receive;
	}
	
	

}
