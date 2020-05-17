package com.finalp.jumunyo.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import com.finalp.jumunyo.service.BusinessService;
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
import com.finalp.jumunyo.vo.SeatOrderVO;
import com.finalp.jumunyo.vo.UserVO;

@Controller
public class BusinessController {
	
	@Autowired  //의존주입
	BusinessService service;
	
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
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/order_search_detail", method = {RequestMethod.POST,RequestMethod.GET})
	public String order_search_detail(PagingVO pagingVO, HttpServletRequest rq ,HttpSession session, OrderVO ovo ,Model model, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
		// 거래내역 조건별 검색
		HashMap<String, Object> hm = new HashMap<String, Object>();
		RestaurantVO rrvo = (RestaurantVO) session.getAttribute("rvo");
		String first_search = (String) rq.getParameter("first_search");
		
		// 모달창을 띄워서 검색하면 first_search 값을 보냄. 그냥 페이징으로 왔으면 session 찾아서 진행
		if(first_search == null) {
			hm = (HashMap<String, Object>)session.getAttribute("o_search_detail");
		} else if(first_search.equals("first_search")) {
			hm.put("restaurant_id",rrvo.getRestaurant_id());
			hm.put("far_time", rq.getParameter("far_time"));
			hm.put("last_time", rq.getParameter("last_time"));
			hm.put("min_price", rq.getParameter("min_price"));
			hm.put("max_price", rq.getParameter("max_price"));
			hm.put("order_type1", rq.getParameter("order_type1"));
			
			session.setAttribute("o_search_detail", hm); // 검색후 페이징을 위한 검색 조건 세션띄우기
		}
		
		int total = service.order_search_detail_count(hm);
		
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
		model.addAttribute("relist", service.reservation_list_paging(pagingVO,rvo));
		model.addAttribute("ulist",service.user_list());
		
		List<SeatOrderVO> svo = service.reservation_list_paging(pagingVO,rvo);
		for(int i=0;i<svo.size(); i++) {
			String time = svo.get(i).getReservation_time();
			int id = svo.get(i).getOrder_id();
			System.out.println(time);
			System.out.println(id);
		}
		
		return "business/reservationList";
	}
	
	@RequestMapping("review_list") 
	public String review_list(Model model,HttpSession session, PagingVO pagingVO, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) throws Exception {
		// 매장의 id 값으로 해당 매장의 리뷰 정보와 리뷰의 댓글들 전부 출력
		RestaurantVO rvo = (RestaurantVO) session.getAttribute("rvo");
		
		int total = service.review_list_count(rvo);
				
		if(nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if(nowPage == null) {
			nowPage = "1";
		} else if(cntPerPage == null) {}
			cntPerPage = "5";
		pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		HashMap<String, Object[]> review_reply = service.review_list_paging(pagingVO,rvo);
		
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
		
		model.addAttribute("paging", pagingVO);
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
	
	@RequestMapping(value = "reply_modify", method = RequestMethod.POST)
	public @ResponseBody String reply_modify(@RequestParam(required = false)String reply_content, @RequestParam(required = false)String new_reply_content
			,HttpSession session,HttpServletResponse rs, HttpServletRequest rq, Model model) throws Exception {
		// 이전 댓글의 내용을 가지고 사장님 리뷰 댓글 수정
		String rp_content = reply_content;
		String nrp_content = new_reply_content;
		
		String result = service.reply_modify(rp_content,nrp_content);
		
		if(result.equals("성공")) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	@RequestMapping(value = "reply_delete", method = RequestMethod.POST)
	public @ResponseBody String reply_delete(@RequestParam(required = false)String reply_content
			,HttpSession session,HttpServletResponse rs, HttpServletRequest rq, Model model) throws Exception {
		// 이전 댓글의 내용을 가지고 사장님 리뷰 댓글 수정
		String rp_content = reply_content;
		
		String result = service.reply_delete(rp_content);
		
		if(result.equals("성공")) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	@RequestMapping(value = "reply_add", method = RequestMethod.POST)
	public @ResponseBody String reply_add(@RequestParam(required = false)String reply_content, @RequestParam(required = false)String review_id
			,HttpSession session,HttpServletResponse rs, HttpServletRequest rq, Model model) throws Exception {
		// 매장 id 와 리뷰 id 가지고 댓글 추가 
		RestaurantVO rvo = (RestaurantVO) session.getAttribute("rvo");
		
		int rt_id = rvo.getRestaurant_id();
		String rp_content = reply_content;
		String rv_id = review_id;
		
		String result = service.reply_add(rt_id,rp_content,rv_id);
		
		if(result.equals("성공")) {
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	@RequestMapping("room_delete") 
	public String room_delete(RoomVO rmvo ,HttpSession session, Model model, HttpServletRequest rq) throws Exception {
		// 좌석 아이디 값으로 좌석 삭제
		RestaurantVO rvo = (RestaurantVO) session.getAttribute("rvo");
		
		String result = "";
		result = service.room_delete(rmvo);
		
		List<RoomVO> rlist = service.go_roomlist(rvo);
			
		model.addAttribute("rlist",rlist);
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
		
		if(date == null) { // 처음 들어왔을때 날짜 값 default 주기
			Date now_date = new Date(System.currentTimeMillis());
			SimpleDateFormat date_to_string = new SimpleDateFormat("yy-MM-dd");
			date = date_to_string.format(now_date);
		}
		
		// 매장id로 order 테이블 내용 1,2,3등 전부 대려오기
		HashMap<String, Object[]> imsi = service.menu_sales_top(rvo,term_select,date);
		HashMap<String, Object[]> top = new HashMap<String, Object[]>();
		top.put("1", imsi.get("1"));
		top.put("2", imsi.get("2"));
		top.put("3", imsi.get("3"));
		
		// 총 판매수량, 금액 가져오기
		Object[] total = imsi.get("total");
		
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

}
