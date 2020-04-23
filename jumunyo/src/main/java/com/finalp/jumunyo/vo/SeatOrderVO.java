package com.finalp.jumunyo.vo;

import java.util.Date;

public class SeatOrderVO {
	
	private int seat_order_id;
	private Date reservation_time;
	private int restaurant_id;
	private int user_id;
	private int room_id;
	private int order_id;
	private String request;
	
	
	public int getSeat_order_id() {
		return seat_order_id;
	}
	public void setSeat_order_id(int seat_order_id) {
		this.seat_order_id = seat_order_id;
	}
	public Date getReservation_time() {
		return reservation_time;
	}
	public void setReservation_time(Date reservation_time) {
		this.reservation_time = reservation_time;
	}
	public int getRestaurant_id() {
		return restaurant_id;
	}
	public void setRestaurant_id(int restaurant_id) {
		this.restaurant_id = restaurant_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getRoom_id() {
		return room_id;
	}
	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}
	public int getOrder_id() {
		return order_id;
	}
	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
	
	

}
