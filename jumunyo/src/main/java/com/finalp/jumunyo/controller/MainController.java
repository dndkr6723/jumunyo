package com.finalp.jumunyo.controller;



import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finalp.jumunyo.service.MainService;
import com.finalp.jumunyo.vo.MenuVO;
import com.finalp.jumunyo.vo.OrderVO;
import com.finalp.jumunyo.vo.QuestionCategoryVO;
import com.finalp.jumunyo.vo.QuestionVO;
import com.finalp.jumunyo.vo.RestaurantVO;
import com.finalp.jumunyo.vo.UserVO;


@Controller
public class MainController {
	
	@Autowired
	MainService service;
	
	@RequestMapping("selectAll")
	public String select(Model model) throws Exception {
		
		List<UserVO> list = service.selectAll();
				
		model.addAttribute("list",list);
		
		return "selectAll";
	}
	
	// mapping 이름 최대한 안겹치게 써주시면 됩니다
	// return 쓸때 앞에 폴더명 적어주어야 할겁니다  ex) "customer/index"; 이런식으로
	// 자신의 이름이 적힌 주석 '사이에' 코드 적어주세요
	
	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
	@RequestMapping("ready")
	public String ready(Model model,HttpSession session) throws Exception {
		
		UserVO uvo = new UserVO();
		uvo.setUser_id(1);
		uvo.setUser_account("power");
		uvo.setUser_password("1541");
		uvo.setUser_address("서울 서울 부산 찍고");
		uvo.setUser_tell("111-1111-1111");
		uvo.setUser_nickname("닉네임");
		uvo.setUser_name("세현");
		uvo.setUser_level(2);
		uvo.setUser_point(3000);
		uvo.setUser_email("dndkr6723@naver.com");
		
		RestaurantVO rvo = new RestaurantVO();
		rvo.setRestaurant_id(1);
		rvo.setUser_id(2);
		rvo.setRestaurant_name("피자헛");
		rvo.setRestaurant_tell("222-2222-2222");
		rvo.setRestaurant_address("서울어딘가");
		rvo.setRestaurant_owner("5조팀");
		rvo.setRestaurant_businessnumber(15151515);
		rvo.setRestaurant_businessnumber_img("등록증사본");
		rvo.setCategory_id(1);
		rvo.setRestaurant_accept(0);
		rvo.setRestaurant_grade(3000);
		
		session.setAttribute("uvo", uvo);
		session.setAttribute("rvo", rvo);
		
		return "business/businessIndex";
	}
	
	@RequestMapping("gomenu") // 사업자 인덱스에서 사업자 menu로
	public String gomenu() throws Exception {
		
		return "business/businessMenu";
	}
	
	@RequestMapping("goentrance") // 입점신청페이지로
	public String goentrance() throws Exception {
		
		return "business/entranceApplication";
	}
	
	@RequestMapping("goquestion_send") // 입점신청페이지로
	public String goquestion_send() throws Exception {
		
		return "business/questionSend";
	}
	
	@RequestMapping("entrance_request") // 입점신청페이지로
	public String entrance_request(RestaurantVO rvo) throws Exception {
		//restaurant_accept : 0 미신청  ,1 신청중  ,2 입점완료
		
		service.entrance_request(rvo);
		
		return "business/businessIndex";
	}
	
	@RequestMapping("question_list") // 현재접속한 사람의 1:1문의 가져오기
	public String question_list(UserVO uvo,HttpSession session,Model model) throws Exception {
			UserVO uuvo = (UserVO) session.getAttribute("uvo");
			
			List<QuestionVO> list = service.question_list(uuvo);
			List<QuestionCategoryVO> qcvo = service.getQuestionCategory();
			
			model.addAttribute("qlist",list).addAttribute("qcvo",qcvo);
			
		return "business/questionList";
	}
	
	@RequestMapping("question_send") // 1:1문의 보내기
	public String question_send(QuestionVO qvo) throws Exception {
		
		service.question_send(qvo);
		
		return "redirect:/question_list";
	}
	
	@RequestMapping("dealorder_list") // 사장님 매장id값으로 거래내역 출력
	public String dealorder_list(RestaurantVO rvo,HttpSession session,Model model) throws Exception {
		RestaurantVO rrvo = (RestaurantVO) session.getAttribute("rvo");
		
		List<OrderVO> olist = (List<OrderVO>) service.dealorder_list(rrvo);
		
		model.addAttribute("olist",olist);
		
		return "business/dealRecord";
	}
	
	@RequestMapping(value="order_search_detail", method = RequestMethod.POST)
	public String order_search_detail(HttpServletRequest rq ,HttpSession session, OrderVO ovo ,Model model) throws Exception {
		// 거래내역 조건별 검색
		HashMap<String, Object> hm = new HashMap<String, Object>();
		RestaurantVO rrvo = (RestaurantVO) session.getAttribute("rvo");
		
		hm.put("restaurant_id",rrvo.getRestaurant_id());
		hm.put("far_time", rq.getParameter("far_time"));
		hm.put("last_time", rq.getParameter("last_time"));
		hm.put("min_price", rq.getParameter("min_price"));
		hm.put("max_price", rq.getParameter("max_price"));
		hm.put("order_type1", rq.getParameter("order_type1"));
		
		List<OrderVO> olist = service.order_search_detail(hm);
		model.addAttribute("olist",olist);
		
		return "business/dealRecord";
	}
	
	@RequestMapping("menu_list") 
	public String menu_list(MenuVO mvo ,HttpSession session,Model model) throws Exception {
		// 매장 id 값으로 매장 메뉴 출력
		RestaurantVO rrvo = (RestaurantVO) session.getAttribute("rvo");
		
		List<MenuVO> mlist = (List<MenuVO>) service.menu_list(rrvo);
		
		model.addAttribute("mlist",mlist);
		
		return "business/menuList";
	}
	
	@RequestMapping("go_menu_add") 
	public String menu_add() throws Exception {
		// 메뉴 리스트 페이지에서 menuAdd 페이지로 이동
		
		return "business/menuAdd";
	}
	
	
	@RequestMapping("go_menu_modify") 
	public String go_menu_modify(MenuVO mvo ,Model model) throws Exception {
		// 메뉴의 id 값으로 메뉴의 정보와 함께 menuAdd 로 이동만!
		
		MenuVO mmvo = service.go_menu_modify(mvo);
		
		model.addAttribute("mvo",mmvo);
		
		return "business/menuAdd";
	}
	
	
	@RequestMapping("menu_add") 
	public String menu_add(MenuVO mvo) throws Exception {
		// 매장의 메뉴 추가
		
		service.menu_add(mvo);
		
		return "redirect:/menu_list";
	}
	
	
	@RequestMapping("menu_modify") 
	public String menu_modify(MenuVO mvo) throws Exception {
		// 메뉴의 id 값으로 메뉴 수정
		
		service.menu_modify(mvo);
		
		return "redirect:/menu_list";
	}
	
	
	@RequestMapping("menu_delete") 
	public String menu_delete(MenuVO mvo) throws Exception {
		// 메뉴의 id 값으로 메뉴 삭제
		
		service.menu_delete(mvo);
		
		return "redirect:/menu_list";
	}
	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	

}
