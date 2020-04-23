package com.finalp.jumunyo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.finalp.jumunyo.service.MainService;
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
	
	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	
	
	
	

}
