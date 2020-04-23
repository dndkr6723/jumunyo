package com.finalp.jumunyo.vo;

import java.util.Date;

public class ReviewVO {
	
	private int review_id;
	private String review_content;
	private Date review_date;
	private double review_grade;
	private int user_id;
	private int restaurant_id;
	
	
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public double getReview_grade() {
		return review_grade;
	}
	public void setReview_grade(double review_grade) {
		this.review_grade = review_grade;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getRestaurant_id() {
		return restaurant_id;
	}
	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}
	
	
	

}
