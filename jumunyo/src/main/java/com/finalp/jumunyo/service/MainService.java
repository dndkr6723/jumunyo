package com.finalp.jumunyo.service;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;

import com.finalp.jumunyo.util.PagingVO;
import com.finalp.jumunyo.vo.CategoryVO;
import com.finalp.jumunyo.vo.MenuVO;
import com.finalp.jumunyo.vo.OrderVO;
import com.finalp.jumunyo.vo.QuestionCategoryVO;
import com.finalp.jumunyo.vo.QuestionVO;
import com.finalp.jumunyo.vo.RestaurantVO;
import com.finalp.jumunyo.vo.RoomVO;
import com.finalp.jumunyo.vo.SeatOrderVO;
import com.finalp.jumunyo.vo.UserVO;

public interface MainService {
	
	public List<UserVO> selectAll();
	
	// 자신의 이름이 적힌 주석 '사이에' 코드 적어주세요~
	
		//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	 	
	 	
		
	 	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	 	
	 	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	 	
	 	
		
	 	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	 	
	 	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	 	
	 	
		
	 	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	
	public List<CategoryVO> goentrance();
	
	public void entrance_request(RestaurantVO rvo);
	
	public int question_list_count(UserVO uuvo);
	public List<QuestionVO> question_list_paging(PagingVO pagingVO, UserVO uuvo);
	
	public List<QuestionCategoryVO> getQuestionCategory();
	
	public void question_send(QuestionVO qvo);
	
	public int dealOrder_count (RestaurantVO rrvo);
	public List<OrderVO> dealOrder_paging(PagingVO pgvo, RestaurantVO rvo);
	
	public int order_search_detail_count(HashMap<String, Object> hm);
	public List<OrderVO> order_search_detail_paging(PagingVO pgvo, HashMap<String, Object> hm);
	
	public int menu_list_count(RestaurantVO rvo);
	public List<MenuVO> menu_list_paging(PagingVO pgvo, RestaurantVO rvo);
	
	public MenuVO go_menu_modify(MenuVO mvo);
	
	public void menu_add(MenuVO mvo);
	
	public void menu_modify(MenuVO mvo);
	
	public void menu_delete(MenuVO mvo);
	
	public List<RoomVO> go_roomlist(RestaurantVO rvo);
	
	public int reservation_list_count(RestaurantVO rvo);
	public List<SeatOrderVO> reservation_list_paging(PagingVO pgvo, RestaurantVO rvo);
	
	public HashMap<String, Object[]> review_list(RestaurantVO rvo);
	
	public String room_delete(RoomVO rmvo);
	
	public String room_modify(RoomVO rmvo);
	
	public void room_add(RoomVO romvo);
	
	public HashMap<String, Object[]> menu_sales_top(RestaurantVO rvo,int term_select,String date) throws ParseException;
	
	public HashMap<String, Integer> menu_sales_time(RestaurantVO rvo,String sdate,String cdate);
	
	public List<UserVO> user_list();
	
	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

}
