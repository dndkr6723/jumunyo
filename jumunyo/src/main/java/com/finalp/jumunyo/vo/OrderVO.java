package com.finalp.jumunyo.vo;

import java.util.Date;

public class OrderVO {
	
	private int order_id;
	private int user_id;
	private int restaurant_id;
	private int order_price;
	private String order_confirm;
	private Date order_date;
	private String menu_list;
	private String order_type;
	private int review_check;
	
	
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
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
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public String getOrder_confirm() {
		return order_confirm;
	}
	public void setOrder_confirm(String order_confirm) {
		this.order_confirm = order_confirm;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getMenu_list() {
		return menu_list;
	}
	public void setMenu_list(String menu_list) {
		this.menu_list = menu_list;
	}
	public String getOrder_type() {
		return order_type;
	}
	public void setOrder_type(String order_type) {
		this.order_type = order_type;
	}
	public int getReview_check() {
		return review_check;
	}
	public void setReview_check(int review_check) {
		this.review_check = review_check;
	}
	

}
