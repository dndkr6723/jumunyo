package com.finalp.jumunyo.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.finalp.jumunyo.service.MainService;
import com.finalp.jumunyo.util.PagingVO;
import com.finalp.jumunyo.vo.CategoryVO;
import com.finalp.jumunyo.vo.MenuVO;
import com.finalp.jumunyo.vo.OrderVO;
import com.finalp.jumunyo.vo.QuestionCategoryVO;
import com.finalp.jumunyo.vo.QuestionVO;
import com.finalp.jumunyo.vo.ReplyVO;
import com.finalp.jumunyo.vo.RestaurantVO;
import com.finalp.jumunyo.vo.ReviewVO;
import com.finalp.jumunyo.vo.RoomVO;
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
	
	@RequestMapping("goentrance")
	public String goentrance(Model model) throws Exception {
		// db의 category 테이블의 정보를 가지고와서 입점신청 페이지로
		List<CategoryVO> clist = service.goentrance();
		
		model.addAttribute("clist",clist);
		
		return "business/entranceApplication";
	}
	
	@RequestMapping("goquestion_send")
	public String goquestion_send(Model model) throws Exception {
		// db에 들려서 문의 카테고리 들고온 후 1:1 문의 작성 페이지로 이동
		List<QuestionCategoryVO> qclist = service.getQuestionCategory();
		
		model.addAttribute("qclist",qclist);
		
		return "business/questionSend";
	}
	
	@RequestMapping("entrance_request")
	public String entrance_request(RestaurantVO rvo) throws Exception {
		// 받은 값들로 입점신청 insert 로직
		//restaurant_accept : 0 미신청  ,1 신청중  ,2 입점완료
		
		service.entrance_request(rvo);
		
		return "business/businessIndex";
	}
	
	@RequestMapping("question_list") // 현재접속한 사람의 1:1문의 가져오기
	public String question_list(UserVO uvo,HttpSession session,Model model,PagingVO pagingVO, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
			UserVO uuvo = (UserVO) session.getAttribute("uvo");
			
			// 카테고리 참조를 위한 카테고리 불러오기
			List<QuestionCategoryVO> qcvo = service.getQuestionCategory();
			// 페이징
			int total = service.question_list_count(uuvo);
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {}
				cntPerPage = "10";
			pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", pagingVO);
			model.addAttribute("qlist", service.question_list_paging(pagingVO,uuvo));
			model.addAttribute("qcvo",qcvo);
			
		return "business/questionList";
	}
	
	@RequestMapping("question_send") // 1:1문의 보내기
	public String question_send(QuestionVO qvo) throws Exception {
		
		service.question_send(qvo);
		
		return "redirect:/question_list";
	}
	
	@RequestMapping("dealorder_list")
	public String dealorder_list(PagingVO pagingVO,HttpSession session, Model model, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
		// 사장님 매장id값으로 거래내역 출력
		RestaurantVO rrvo = (RestaurantVO) session.getAttribute("rvo");
		int total = service.dealOrder_count(rrvo);
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {}
			cntPerPage = "10";
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pagingVO);
		model.addAttribute("dealorder_list", service.dealOrder_paging(pagingVO,rrvo));
		return "business/dealRecord";
	}
	
	@RequestMapping(value="order_search_detail", method = RequestMethod.POST)
	public String order_search_detail(PagingVO pagingVO, HttpServletRequest rq ,HttpSession session, OrderVO ovo ,Model model, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
		// 거래내역 조건별 검색
		HashMap<String, Object> hm = new HashMap<String, Object>();
		RestaurantVO rrvo = (RestaurantVO) session.getAttribute("rvo");
		
		hm.put("restaurant_id",rrvo.getRestaurant_id());
		hm.put("far_time", rq.getParameter("far_time"));
		hm.put("last_time", rq.getParameter("last_time"));
		hm.put("min_price", rq.getParameter("min_price"));
		hm.put("max_price", rq.getParameter("max_price"));
		hm.put("order_type1", rq.getParameter("order_type1"));
		
		System.out.println("far_time :" + rq.getParameter("far_time"));
		System.out.println("last_time :" + rq.getParameter("last_time"));
		System.out.println("min_time :" + rq.getParameter("min_time"));
		System.out.println("max_time :" + rq.getParameter("max_time"));
		System.out.println("order_type1 :" + rq.getParameter("order_type1"));
		
		int total = service.order_search_detail_count(hm);
		System.out.println(total);
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {}
			cntPerPage = "10";
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		model.addAttribute("paging", pagingVO);
		model.addAttribute("dealorder_list", service.order_search_detail_paging(pagingVO,hm));
		
		return "business/dealRecord";
	}
	
	@RequestMapping("menu_list") 
	public String menu_list(MenuVO mvo ,HttpSession session,Model model, PagingVO pagingVO, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
		// 매장 id 값으로 매장 메뉴 출력
		RestaurantVO rrvo = (RestaurantVO) session.getAttribute("rvo");
		// 페이징
			int total = service.menu_list_count(rrvo);
			
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {}
				cntPerPage = "10";
			pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			model.addAttribute("paging", pagingVO);
			model.addAttribute("mlist", service.menu_list_paging(pagingVO,rrvo));
			
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
	
	@RequestMapping("go_roomlist") 
	public String go_roomlist(Model model,HttpSession session) throws Exception {
		// 매장의 id 값으로 해당 매장의 좌석 정보 다 출력
		RestaurantVO rvo = (RestaurantVO) session.getAttribute("rvo");
		
		List<RoomVO> rlist = service.go_roomlist(rvo);
		
		model.addAttribute("rlist",rlist);
		
		return "business/roomModify";
	}
	
	@RequestMapping("reservation_list") 
	public String reservation_list(Model model,HttpSession session, PagingVO pagingVO, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
		// 매장의 id 값으로 해당 매장의 예약정보 전부 출력
		RestaurantVO rvo = (RestaurantVO) session.getAttribute("rvo");
		
		// 페이징
		int total = service.reservation_list_count(rvo);
		
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {}
			cntPerPage = "10";
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		model.addAttribute("paging", pagingVO);
		model.addAttribute("mlist", service.reservation_list_paging(pagingVO,rvo));
		model.addAttribute("ulist",service.user_list());
		
		return "business/reservationList";
	}
	
	@RequestMapping("review_list") 
	public String review_list(Model model,HttpSession session) throws Exception {
		// 매장의 id 값으로 해당 매장의 리뷰 정보와 리뷰의 댓글들 전부 출력
		RestaurantVO rvo = (RestaurantVO) session.getAttribute("rvo");
		HashMap<String, Object[]> review_reply = service.review_list(rvo);
		List<ReviewVO> rvlist = new ArrayList<>();
		List<ReplyVO> rplist = new ArrayList<>();
		
		if(review_reply.get("1")!=null) {
			for(int i=0; i<review_reply.size(); i++) {
				Object [] imsi = review_reply.get(""+(i+1));
				ReplyVO rpvo = new ReplyVO();
				ReviewVO rvvo = (ReviewVO) imsi[0];
				if(!imsi[1].equals("0")) {
					rpvo = (ReplyVO) imsi[1];
				}
				rvlist.add(i, rvvo);
				rplist.add(i, rpvo);
			}
			
		}
		
		List<UserVO> ulist = service.user_list(); // 유저닉네임 참조를 위해 유저 목록 
		
		model.addAttribute("rvlist",rvlist).addAttribute("rplist",rplist).addAttribute("ulist",ulist);
		
		/*List<VisitorsBookBean> visitorsBook = vbDao.selectVisitorsBook();
        if(!visitorsBook.isEmpty()){
            for(VisitorsBookBean visitor : visitorsBook){
                visitor.setVb_article(visitor.getVb_article().replaceAll("\r\n|\r|\n", " "));
            } 
            	리뷰같은 string 띄어쓰기 줄바꿈 관한 참고문
        }*/
		
		return "business/reviewList";
	}
	
	@RequestMapping("room_delete") 
	public String room_delete(RoomVO rmvo ,HttpSession session, Model model, HttpServletRequest rq) throws Exception {
		// 좌석 아이디 값으로 좌석 삭제
		RestaurantVO rvo = (RestaurantVO) session.getAttribute("rvo");
		List<RoomVO> rlist = service.go_roomlist(rvo);
		model.addAttribute("rlist",rlist);
		
		String result = "";
		result = service.room_delete(rmvo);
			
		model.addAttribute("result",result);
			
		return "business/roomModify";
	}
	
	
	@RequestMapping("room_modify") 
	public String room_modify(RoomVO rmvo ,HttpSession session,HttpServletRequest rq ,Model model) throws Exception {
		// 매장의 id 값으로 해당 매장의 좌석 정보 다 출력
		
		RestaurantVO rvo = (RestaurantVO) session.getAttribute("rvo");
		
		String result = "";
		result = service.room_modify(rmvo);
			
		List<RoomVO> rlist = service.go_roomlist(rvo);
		model.addAttribute("rlist",rlist);
		model.addAttribute("result",result);
			
		return "business/roomModify";
	}
	
	@RequestMapping("room_add") 
	public String room_add(RoomVO rmvo ,Model model,HttpSession session) throws Exception {
		// 매장 세션 에서 매장 id 값 가져와서 좌석 등록 
		service.room_add(rmvo);
		
		return "redirect:/go_roomlist";
	}
	
	
	@RequestMapping("go_revenue_table") 
	public String go_revenue_table(HttpSession session, HttpServletRequest rq, Model model) throws Exception {
		// 매장 세션 에서 매장 id 값 가져와서 매출현황 깔아주기(매출 탑 3)
		RestaurantVO rvo = (RestaurantVO) session.getAttribute("rvo");
		String term = rq.getParameter("date_term");
		String date = rq.getParameter("start_date");
		
		int term_select = 0; // 기간 검사용
		if(term == null) {
			term_select = 1;
		} else {
			if(term.equals("하루")) {
				term_select = 1;
			}else if(term.equals("일주일")) {
				term_select = 2;
			}else if(term.equals("한달")) {
				term_select = 3;
			}
		}
		
		if(date == null) {
			date = "널";
		}
		
		// 매장id로 order 테이블 내용 1,2,3등 전부 대려오기
		HashMap<String, Object[]> imsi = service.menu_sales_top(rvo,term_select,date);
		HashMap<String, Object[]> top = new HashMap<String, Object[]>();
		top.put("1", imsi.get("1"));
		top.put("2", imsi.get("2"));
		top.put("3", imsi.get("3"));
		
		// 총 판매수량, 금액 가져오기
		Object[] total = imsi.get("total");
		/*NumberFormat nf = NumberFormat.getNumberInstance();*/
		
		model.addAttribute("top",top);
		model.addAttribute("term",term);
		model.addAttribute("date",date);
		model.addAttribute("total_mount",total[0]).addAttribute("total_price",total[1]);
		
		return "business/revenueTable";
	}
	

	@RequestMapping(value = "go_chart_data", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Integer> go_chart_data(@RequestParam(required = false)String select_date, @RequestParam(required = false)String compare_date
			,HttpSession session,HttpServletResponse rs, HttpServletRequest rq, Model model) throws Exception {
		// 그래프 보기 누르면 받아온 날짜의 데이터 가공해서 오기
		RestaurantVO rvo = (RestaurantVO) session.getAttribute("rvo");
		String sdate = select_date;
		String cdate = compare_date;
		HashMap<String, Integer> time_sales = service.menu_sales_time(rvo,sdate,cdate);
		
		return time_sales;
	}
	
	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	

}
