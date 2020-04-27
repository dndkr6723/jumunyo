package com.finalp.jumunyo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.jumunyo.vo.MenuVO;
import com.finalp.jumunyo.vo.OrderVO;
import com.finalp.jumunyo.vo.QuestionCategoryVO;
import com.finalp.jumunyo.vo.QuestionVO;
import com.finalp.jumunyo.vo.RestaurantVO;
import com.finalp.jumunyo.vo.UserVO;

@Repository
public class MainServiceImpl implements MainService {
	
	@Autowired
	SqlSessionTemplate my;

	@Override
	public List<UserVO> selectAll() {
		return  my.selectList("Main.selectAll");
	}

	
	// 자신의 이름이 적힌 주석 '사이에' 코드 적어주세요~
	
			//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	 	
	 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		 	
		 	
			
		 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		 	
		 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		 	
		 	
			
		 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		 	
		 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		 	
		 	
			
		 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	@Override
	public void entrance_request(RestaurantVO rvo) {
		// 입점신청
		my.insert("Main.entrance_request", rvo);
	}


	@Override
	public List<QuestionVO> question_list(UserVO uuvo) {
		// 현재 접속한 사람의 1:1 문의 리스트 가져오기
		return my.selectList("Main.question_list",uuvo);
	}


	@Override
	public List<QuestionCategoryVO> getQuestionCategory() {
		// 문의 카테고리 리스트 전부 가져오기
		return my.selectList("Main.getQuestionCategory");
	}

	@Override
	public void question_send(QuestionVO qvo) {
		// 사장님이 관리자에게 문의보내기
		my.insert("Main.question_send",qvo);
		
	}

	@Override
	public List<OrderVO> dealorder_list(RestaurantVO rvo) {
		// 사장님 매장id값으로 거래내역 모두 출력
		return my.selectList("Main.dealorder_list",rvo);
	}


	@Override
	public List<OrderVO> order_search_detail(HashMap<String, Object> hm) {
		// 거래내역 조건 검색
		return my.selectList("Main.order_search_detail",hm);
	}


	@Override
	public List<MenuVO> menu_list(RestaurantVO rvo) {
		// 매장 id 값으로 매장 메뉴 전체 출력
		return my.selectList("Main.menu_list",rvo);
	}


	@Override
	public MenuVO go_menu_modify(MenuVO mvo) {
		// 메뉴의 id 값으로 메뉴의 정보를 들고 수정페이지로 이동
		return my.selectOne("Main.go_menu_modify",mvo);
	}


	@Override
	public void menu_add(MenuVO mvo) {
		// 메뉴추가 메소드
		my.insert("Main.menu_add",mvo);
	}


	@Override
	public void menu_modify(MenuVO mvo) {
		// 메뉴의 아이디 값으로 메뉴의 정보 수정
		my.update("Main.menu_modify",mvo);
		
	}


	@Override
	public void menu_delete(MenuVO mvo) {
		// 메뉴의 아이디 값으로 메뉴 삭제
		my.delete("Main.menu_delete",mvo);
		
	}
	
	
		 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

}
