package com.finalp.jumunyo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
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

import com.finalp.jumunyo.service.CustomerService;
import com.finalp.jumunyo.util.PagingVO;
import com.finalp.jumunyo.vo.CartVO;
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
public class CustomerController {
	
	@Autowired  //의존주입
	CustomerService service;
	
	//테스트용
	@RequestMapping("selectAll.do")
	public String select(Model model) throws Exception {
		
		List<UserVO> list = service.selectAll();
				
		model.addAttribute("list",list);
		
		return "selectAll";
	}
	
	// mapping 이름 최대한 안겹치게 써주시면 됩니다
	// return 쓸때 앞에 폴더명 적어주어야 할겁니다  ex) "customer/index"; 이런식으로
	// 자신의 이름이 적힌 주석 '사이에' 코드 적어주세요
	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	
	//start 메인페이지
	@RequestMapping("Index.do")
	public String loginPage(HttpServletRequest request,UserVO vo,HttpSession session) {
		Cookie[] cookies = request.getCookies();
		System.out.println(cookies);
		if(cookies != null) {
			for(Cookie tempCookie : cookies) {
				if(tempCookie.getName().equals("user_account")) {
					System.out.println(tempCookie.getValue());
					//쿠키값으로 대신 로그인 함
					/*session.setAttribute("userSession", vo);*/
					service.login2(tempCookie.getValue(),session,vo);
				}
			}
		}
		return "customer/customerIndex";
	}
	
	//아이디찾기 메인페이지
	@RequestMapping("idFindPage.do")
	public String idFindPage() {
		return "customer/idFind";
	}
	
	//마이페이지 메뉴 페이지
	@RequestMapping("mypageMenuPage.do")
	public String mypageMenuPage() {
		return "customer/mypageMenu";
	}
	
	//로그인
	@RequestMapping(value="loginCheck.do", method=RequestMethod.POST)
	public String login(UserVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException{
		String loginChk = request.getParameter("rememberme"); //자동로그인 체크
		String user_account = request.getParameter("user_account");
		boolean result = service.login(vo,session);
		if(loginChk != null) { //자동로그인이 체크 되어있으면..
			Cookie cookie = new Cookie("user_account", vo.getUser_account());
			cookie.setMaxAge(10800);
			cookie.setPath("/");
			response.addCookie(cookie);
		}	
		
		if(result) {
			return "customer/customerIndex";   //customerIndex로 다시 가는  prefix 설정 필요..			
		}else {
			return "customer/loginfail";  
		}
	}
	

	//로그아웃
	@RequestMapping("logOut.do")
	public String logOut(UserVO vo, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null) {
			for(Cookie tempCookie : cookies) {
				if(tempCookie.getName().equals("user_account")) {
					tempCookie.setMaxAge(0);
					tempCookie.setPath("/");
					response.addCookie(tempCookie);
				}
			}
		}
		return "customer/customerIndex";
	}
	
	//회원가입
	@RequestMapping("join.do")
	public String join(UserVO vo) {
		boolean result = service.join(vo); //회원가입 입력 결과를 담는다
		if(result) { //true이면
			return "include/result";
		} else {
		return "customer/joinfail";   //회원가입 실패시 모달 처리를 어떻게 해야할 지 질문 할것
		}
	}

	//마이페이지 - 내정보보기 - 비밀번호 확인 페이지
	@RequestMapping("mypageCheckPage.do")
	public String mypageCheckPage(UserVO vo) {
		return "customer/mypageCheck";
	}
	
	//마이페이지 - 내정보보기 - 비밀번호 확인 ajax
	@RequestMapping("mypageCheck.do")
	public void mypageCheck(UserVO uvo, HttpServletRequest request,HttpServletResponse response,HttpSession session) throws IOException {
		PrintWriter out = response.getWriter();
		String user_password = request.getParameter("user_password");
		String user_password2 = request.getParameter("sessionPassword");
		if(user_password2.equals(user_password)) {
			out.print("YES");
		}else {
			out.print("NO");
		}
	}
	
	//마이페이지 - 내정보보기 - 확인버튼
	@RequestMapping("mypageModifySubmit.do")
	public String mypageModifySubmit(UserVO uvo, Model model, HttpServletRequest request,HttpServletResponse response,HttpSession session){
		
		String user_password = request.getParameter("user_password");
		String user_password2 = request.getParameter("sessionPassword");
		if(user_password2.equals(user_password)) {
			return "customer/mypageModify";
		}else {	
			return "redirect:mypageCheckPage.do";
		}
	}
	
	//마이페이지 - 내정보보기 - 회원정보 수정하기
	@RequestMapping("updateUser.do")
	public String updateUser(UserVO uvo, Model model,HttpSession session){
		UserVO uvo2 = service.updateUser(uvo,session);
		
		return "customer/mypageModify";
	}
	
	//마이페이지 - 내정보보기 - 회원탈퇴
	@RequestMapping("deleteUser.do")
	public String deleteUser(UserVO uvo, Model model, HttpSession session){
		boolean result = service.deleteUser(uvo);
		session.invalidate();
		
		return "redirect:Index.do";
	}
	
	//회원가입,회원정보수정시 아이디 중복체크 (ajax)
	@RequestMapping("accountCheck.do")
	public void accountCheck(HttpServletRequest request,HttpServletResponse response) throws IOException {     
		//Ajax에서 넘어온 데이터(파라미터)를 vo에 담는다
		PrintWriter out = response.getWriter();
		String user_account = request.getParameter("user_account");
		boolean result = service.accountCheck(user_account);	//아이디 중복 체크를 한 결과를 담는다
		// false : 존재하는 아이디가 없다
		//true : 이미 존재하는 아이디가 있다
		System.out.println("result : "+  result);
		if(result == false) {  //ajax에게 결과를 돌려준다
			out.print("YES");
		} else {
			out.print("NO");
		}
	}
	
	//회원가입,회원정보수정시 닉네임 중복체크 (ajax)
	@RequestMapping("nicknameCheck.do")
	public void nicknameCheck(HttpServletRequest request,HttpServletResponse response) throws IOException {     
		//Ajax에서 넘어온 데이터(파라미터)를 vo에 담는다
		PrintWriter out = response.getWriter();
		String user_nickname = request.getParameter("user_nickname");
		boolean result = service.nicknameCheck(user_nickname);	//아이디 중복 체크를 한 결과를 담는다
		// false : 존재하는 아이디가 없다
		//true : 이미 존재하는 아이디가 있다
		if(result == false) {  //ajax에게 결과를 돌려준다
			out.print("YES");
		} else {
			out.print("NO");
		}
	}
	
	//회원가입,회원정보수정시 이메일 중복체크 (ajax)
	@RequestMapping("emailCheck.do")
	public void emailCheck(HttpServletRequest request,HttpServletResponse response) throws IOException {     
		//Ajax에서 넘어온 데이터(파라미터)를 vo에 담는다
		PrintWriter out = response.getWriter();
		String user_email = request.getParameter("user_email");
		boolean result = service.emailCheck(user_email);	//아이디 중복 체크를 한 결과를 담는다
		// false : 존재하는 이메일이 없다
		//true : 이미 존재하는 이메일이 있다
		if(result == false) {  //ajax에게 결과를 돌려준다
			out.print("YES");
		} else {
			out.print("NO");
		}
	}
	
	//회원가입시,회원정보수정시 비밀번호 확인 체크 (ajax)
	@RequestMapping("passwordCheck.do")
	public void passwordCheck(HttpServletRequest request, HttpServletResponse response) throws IOException {    
		//Ajax에서 넘어온 데이터(파라미터)를 vo에 담는다
		PrintWriter out = response.getWriter();
		String user_password = request.getParameter("user_password");
		String user_passwordCheck = request.getParameter("user_passwordCheck");
		System.out.println(user_password);
		System.out.println(user_passwordCheck);
		boolean result = user_passwordCheck.equals(user_password);
		System.out.println(result);
		if(result == true) {
			out.print("YES");
		}else {
			out.print("NO");
		}
	
	}
	//아이디 찾기
	@RequestMapping(value="accountFind.do", method=RequestMethod.POST)
	public String idFind(UserVO vo,Model model) throws IOException{
		UserVO result = service.accountFind(vo);
		boolean resultFalse = (result == null) ? false : true;
		if(resultFalse == false) {
			model.addAttribute("mResult", false);
		} else if ( resultFalse == true) {
			model.addAttribute("mUser_account", result.getUser_account());			
		}
		return "customer/idFind";	
	}
	
	//비밀번호 찾기
	@RequestMapping(value="passwordFind.do", method=RequestMethod.POST)
	public String passwordFind(UserVO vo, Model model) throws IOException{
		UserVO result = service.passwordFind(vo);
		boolean result2 = (result == null) ? false : true;
		String user_email = result.getUser_email();
		String user_password = result.getUser_password();
		System.out.println("이메일 보낼 주소" + user_email);
		if(result2 == true) {  //insert 성공하면
			model.addAttribute("mPasswordResult", true);
			model.addAttribute("mUser_email", user_email);
			model.addAttribute("mUser_changePassword", user_password);
			/*service.sendEmail(user_email, user_password);	*/	//초기화 된 비번을 이메일로 보내기
			
		} else if ( result2 == false) {	//insert실패하거나, 일치하는 정보가 없으면
			model.addAttribute("mPasswordResult", false);			
		}
		return "customer/idFind";	
	}
	
	//마이페이지 - 예약중인 주문 페이지 
		@RequestMapping("mypageReservationList.do")
		public String mypageReservationList(HttpSession session, UserVO vo, Model model) {
			//1. session 값 담기
			UserVO uvo = (UserVO) session.getAttribute("userSession");
			//2. 마이페이지 -  예약중인 주문 페이지 - orders 테이블 뽑기
			List<OrderVO> ovo = service.mypageReservationList(uvo);
			//3. mypageReservationList() 에서 뽑은 orders 로  restaurants 테이블 뽑기
			List<RestaurantVO> rvo = service.restaurantList(ovo);
			//4. mypageReservationList() 에서 뽑은 orders 로 menus 테이블 뽑기 -> menu_list 가공하기
			List mlist = service.menuList(ovo);
			//5. mypageReservationList() 에서 뽑은 orders 로 seat_ordes 테이블 뽑기
			List <SeatOrderVO> svo = service.seatOrdersList(ovo);
			
			model.addAttribute("orderList",ovo);
			model.addAttribute("restaurantList", rvo);
			model.addAttribute("menuNameList", mlist);
			model.addAttribute("seatOrderList", svo);
			return "customer/mypageReservationList";
		}
		
		//마이페이지 - 과거이용내역
		@RequestMapping("mypageOrderHistory.do")
		public String mypageOrderHistory(HttpSession session, UserVO vo, Model model) {
			//1. session 값 담기
			UserVO uvo = (UserVO) session.getAttribute("userSession");
			//2. 마이페이지 -  과거 이용 내역 주문 페이지 - orders 테이블 뽑기
			List<OrderVO> ovo = service.myPageOrderHistory(uvo);
			//4. mypageReservationList()에서 뽑은  orders로 Restaurants 테이블 뽑기
			List<RestaurantVO> rvo = service.myPageOrderHistory_rvo(ovo);
			//5. mypageReservationList() 에서 뽑은 orders 로 menus 테이블 뽑기 -> menu_list 가공하기
			List mlist = service.menuList(ovo);
			//3. orders 테이블로 reviews 테이블 찾기
			List<ReviewVO> reviewList = service.myPageOrderHistory_review(uvo); 
			
			model.addAttribute("orderList2",ovo);
			model.addAttribute("restaurantList2", rvo);
			model.addAttribute("menuNameList2", mlist);
			model.addAttribute("reviewList2", reviewList);
			
			return "customer/mypageOrderHistory";
		}
		
		//마이페이지 - 리뷰작성하기
		@RequestMapping("mypageInsertReview.do")
		public String mypageInsertReview(Model model,HttpServletRequest request, ReviewVO reviewVo){
			System.out.println("getParameter: " + request.getParameter("review_img"));
			String review_img = request.getParameter("review_img");
			reviewVo.setReview_img(review_img);
			System.out.println("getReview_img : " + reviewVo.getReview_img());
			boolean result = service.mypageInsertReview(reviewVo);	
			return "redirect:mypageOrderHistory.do";
		}
		
		//마이페이지 - 리뷰 작성 하는 페이지로 이동
		@RequestMapping("mypageInsertReviewPage.do")
		public String mypageInsertReviewPage(Model model, HttpServletRequest request) {
			String restaurant_name1 = request.getParameter("restaurant_name");
			String restaurant_id1 = request.getParameter("restaurant_id");
			model.addAttribute("mrestaurant_name", restaurant_name1);
			model.addAttribute("mrestaurant_id", restaurant_id1);
			
			
			return "customer/orderHistoryReview";
		}
		
		//마이페이지 - 1:1 문의 리스트
		@RequestMapping("mypageQuestionList.do")
		public String mypageQuestion(Model model,HttpSession session, UserVO vo){
			UserVO uvo = (UserVO) session.getAttribute("userSession");
			List<QuestionVO> qvo = service.customerQuestionList(uvo);
			List<QuestionCategoryVO> qcvo = service.categoryName(qvo);
		
			model.addAttribute("questionList1", qvo);
			model.addAttribute("questionList2", qcvo);
			
			return "customer/questionList";
		}
		
		//마이페이지 - 1:1문의 작성하기
		@RequestMapping("insertQuestion.do")
		public String insertQuestion(Model model, HttpServletRequest request, QuestionVO qvo) {
			System.out.println("qvo : " + qvo);
			boolean result = service.mypageInsertQuestion(qvo);
			return "redirect:mypageQuestionList.do";
		}

		//인덱스 - 메뉴 검색하기
		@RequestMapping("searchRestaurantName.do")
		public String searchRestaurantName(HttpServletRequest request, Model model,RestaurantVO rvo,PagingVO pagingVO,@RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) {
			List<RestaurantVO> rvolist = new ArrayList<RestaurantVO>();
			int total = service.countList2(rvo);
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {}
				cntPerPage = "10";
			pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println(pagingVO.toString());
			model.addAttribute("paging", pagingVO);
			rvolist = service.searchRestaurantName(rvo, pagingVO);
			List<Integer> rvoCount = service.countReviews(rvolist);//리뷰수 구하기
			
			model.addAttribute("rvolist",rvolist);
			model.addAttribute("rvoCount",rvoCount);
			model.addAttribute("check",1);
			model.addAttribute("mrestaurant_name",rvo.getRestaurant_name());
			return "customer/categorySearch";
		}
		
		//인덱스 - 메뉴 카테고리 눌러서 검색
		@RequestMapping("categorySearch.do")
		public String categorySearch(HttpServletRequest request, Model model,RestaurantVO rvo,PagingVO pagingVO,@RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) {
			List<RestaurantVO> rvolist = new ArrayList<RestaurantVO>();
			
			int total = service.countList3(rvo);
			if(nowPage == null && cntPerPage == null) {
				nowPage = "1";
				cntPerPage = "10";
			} else if(nowPage == null) {
				nowPage = "1";
			} else if(cntPerPage == null) {}
				cntPerPage = "10";
			pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			System.out.println(pagingVO.toString());
			model.addAttribute("paging", pagingVO);
			rvolist = service.categorySearch(rvo, pagingVO);
			List<Integer> rvoCount = service.countReviews(rvolist);//리뷰수 구하기

			model.addAttribute("rvolist",rvolist);
			model.addAttribute("rvoCount",rvoCount);
			model.addAttribute("check",2);
			model.addAttribute("mcategory_id",rvo.getCategory_id());
			return "customer/categorySearch";
		}
		
		//메뉴 검색 정렬 (별점,리뷰,등록날짜순)
		@RequestMapping("searchSort.do")
		public String searchSort(RestaurantVO rvo, HttpServletRequest request, PagingVO pagingVO, Model model, @RequestParam(value = "nowPage", required=false) String nowPage, @RequestParam(value = "cntPerPage", required=false) String cntPerPage) {
			String rvoSearchRestaurant_name = rvo.getRestaurant_name(); //검색한 매장이름을 담는다
			List<RestaurantVO> rvolist = new ArrayList<RestaurantVO>(); //정렬 결과를 담을 리스트
			List<Integer> rvoCount = new ArrayList<Integer>();
			int category_id = 	rvo.getCategory_id();	
			System.out.println("category_id : " + category_id);
			String calumn_name = request.getParameter("calumn_name");	//선택한 정렬순
			
			if(category_id != 0) { // 단어 검색 외
				//별점순일때 
				if(calumn_name.equals("restaurant_grade")) { 
					int total = service.countList1(rvoSearchRestaurant_name);
					if(nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "10";
					} else if(nowPage == null) {
						nowPage = "1";
					} else if(cntPerPage == null) {}
						cntPerPage = "10";
					pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					System.out.println(pagingVO.toString());
					model.addAttribute("paging", pagingVO);
					rvolist = service.categorySearch_sort(rvoSearchRestaurant_name, pagingVO, rvo.getCategory_id());
				}	
				//날짜순일때
					else if(calumn_name.equals("restaurant_date")) {  
					int total = service.countList1(rvoSearchRestaurant_name);
					if(nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "10";
					} else if(nowPage == null) {
						nowPage = "1";
					} else if(cntPerPage == null) {}
						cntPerPage = "10";
					pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					System.out.println(pagingVO.toString());
					model.addAttribute("paging", pagingVO);
					rvolist = service.categorySearch_sort2(rvoSearchRestaurant_name,pagingVO,rvo.getCategory_id());
				}
				//리뷰순일때	
					else if(calumn_name.equals("reviewCount")){   
					System.out.println("calumn_name : " + calumn_name);
					int total = service.countList1(rvoSearchRestaurant_name);
					System.out.println("total : " + total);
					if(nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "10";
					} else if(nowPage == null) {
						nowPage = "1";
					} else if(cntPerPage == null) {}
						cntPerPage = "10";
					pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					System.out.println(pagingVO.toString());
					model.addAttribute("paging", pagingVO);
					rvolist = service.categorySearch_sort3(rvoSearchRestaurant_name,pagingVO,rvo.getCategory_id());
					for(int i = 0 ; i < rvolist.size() ; i++) {
						System.out.println("rvolist : " +  rvolist.get(i));					
						}
				}		
			}else if( category_id == 0) {  //단어 검색 일 때
				//별점순일때 
				if(calumn_name.equals("restaurant_grade")) { 
					int total = service.countList1(rvoSearchRestaurant_name);
					if(nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "10";
					} else if(nowPage == null) {
						nowPage = "1";
					} else if(cntPerPage == null) {}
						cntPerPage = "10";
					pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					System.out.println(pagingVO.toString());
					model.addAttribute("paging", pagingVO);
					rvolist = service.categorySearch_sort4(rvoSearchRestaurant_name, pagingVO);
				}	
				//날짜순일때
					else if(calumn_name.equals("restaurant_date")) {  
					int total = service.countList1(rvoSearchRestaurant_name);
					if(nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "10";
					} else if(nowPage == null) {
						nowPage = "1";
					} else if(cntPerPage == null) {}
						cntPerPage = "10";
					pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					System.out.println(pagingVO.toString());
					model.addAttribute("paging", pagingVO);
					rvolist = service.categorySearch_sort5(rvoSearchRestaurant_name,pagingVO);
				}
				//리뷰순일때	
					else if(calumn_name.equals("reviewCount")){   
					System.out.println("calumn_name : " + calumn_name);
					int total = service.countList1(rvoSearchRestaurant_name);
					System.out.println("total : " + total);
					if(nowPage == null && cntPerPage == null) {
						nowPage = "1";
						cntPerPage = "10";
					} else if(nowPage == null) {
						nowPage = "1";
					} else if(cntPerPage == null) {}
						cntPerPage = "10";
					pagingVO = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
					System.out.println(pagingVO.toString());
					model.addAttribute("paging", pagingVO);
					rvolist = service.categorySearch_sort6(rvoSearchRestaurant_name,pagingVO);
					for(int i = 0 ; i < rvolist.size() ; i++) {
						System.out.println("rvolist : " +  rvolist.get(i));					
						}
					}
			}

			
			rvoCount = service.countReviews(rvolist);
			model.addAttribute("rvolist",rvolist);
			model.addAttribute("rvoCount",rvoCount);
			model.addAttribute("calumn_name",calumn_name);  //다음 페이지를 위해 정렬 정보 넘겨주기
			model.addAttribute("check",3);
			model.addAttribute("mrestaurant_name",rvo.getRestaurant_name());
			model.addAttribute("mcategory_id",rvo.getCategory_id());
			return "customer/categorySearch";
		}
		
		//카카오페이
		@RequestMapping("kakakopay.do")
		public String kakakopay() {
			return "customer/customerIndex";
		}
		
		
		
		
	
	
	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
		@RequestMapping("restaurant_detail.do")
		public String restaurantDetail(HttpSession session,RestaurantVO rvo) {
					
		System.out.println(rvo.getRestaurant_id());
		
			RestaurantVO res1 = (RestaurantVO)service.getOneStore(rvo.getRestaurant_id());
			ArrayList<MenuVO> menu_list1 = service.getStoreMenu(res1.getRestaurant_id());
			ArrayList<ReviewVO> review_list1 = service.getStoreReview(res1.getRestaurant_id());
			HashMap<String, ReplyVO> reply_list1 = service.getReviewReply(review_list1);
			System.out.println(reply_list1.get("1"));
			session.setAttribute("getOneStore", res1);
			session.setAttribute("getStoreMenu", menu_list1);
			session.setAttribute("getStoreReview", review_list1);
			session.setAttribute("getReviewReply", reply_list1);
			session.setAttribute("storeSession", res1);
			
			return "customer/restaurantDetail";
		}
		
		@RequestMapping("cart.do")
		public String ordering(Model model1, HttpSession session, HttpServletRequest request) {
			
			ArrayList<CartVO> cart_list1 = new ArrayList<CartVO>();
			
			int count3=1;
			int menu_price1 = -1;
			while(true) {
				String menu_id1 = request.getParameter("menuId-"+count3);
				
				if (menu_id1 == null) {
					break;
				}
				
				String menu_name1 = request.getParameter("menu_name-"+count3);
				menu_price1 = Integer.parseInt(request.getParameter("menu_price-"+count3));
				String tmp="";
				tmp = request.getParameter("menu_count"+count3);
				
				if (tmp != null && tmp!= "") {
					int menu_count1 = Integer.parseInt(tmp);
					CartVO cart1 = new CartVO();
					cart1.setCartmenu_id(menu_id1);
					cart1.setCartmenu_name(menu_name1);
					cart1.setCartmenu_price(menu_price1);
					cart1.setCartmenu_count(menu_count1);
					
					cart_list1.add(cart1);
				}
				
				count3++;
							
			}
			session.setAttribute("cart_list", cart_list1);
					
			HashMap<String, Object> seat_order1 = new HashMap<String, Object>();
			String date1 = (String)session.getAttribute("booking_date");
			String time1 = (String)session.getAttribute("booking_time");
			String time2 = date1 + " / " + time1;
			
			/*service.getOneUser(session);*/
			UserVO vo1 = (UserVO) session.getAttribute("userSession");
			
			System.out.println("name" +  vo1.getUser_name());
			System.out.println("tel" + vo1.getUser_tell());
			
			seat_order1.put("name", vo1.getUser_name());
			seat_order1.put("tel", vo1.getUser_tell());
			seat_order1.put("time", time2);
			
			model1.addAttribute("seat_order1",seat_order1);
			
			return "customer/orderConfirm";
		}
		
		@RequestMapping("payment.do")
		public String payment(HttpSession session, HttpServletRequest request) {
					
			OrderVO order1 = new OrderVO();
			int max_id_num = service.getMaxOrderId();
			UserVO user1 = (UserVO) session.getAttribute("userSession");
			RestaurantVO res1 = (RestaurantVO) session.getAttribute("storeSession");
			ArrayList<CartVO> cart_list1 = (ArrayList<CartVO>) session.getAttribute("cart_list");
			
			// OrderVO 객체 만드는 작업
			order1.setOrder_id(max_id_num + 1);
			order1.setUser_id(user1.getUser_id());
			order1.setRestaurant_id(res1.getRestaurant_id());
			
			int total_price = 0;
			String menu_list = "";
			for (int i=0; i<cart_list1.size(); i++) {
				total_price += cart_list1.get(i).getCartmenu_price() * cart_list1.get(i).getCartmenu_count();
				menu_list += cart_list1.get(i).getCartmenu_id() + "x" + cart_list1.get(i).getCartmenu_count() + ",";
			}
			menu_list = menu_list.substring(0, menu_list.length()-1);
			total_price -= user1.getUser_point();
			order1.setOrder_price(total_price);
			
			order1.setMenu_list(menu_list);
			if (session.getAttribute("booking_room") == null) {
				order1.setOrder_type("배달");
				order1.setOrder_confirm("식사완료");
			} else {
				order1.setOrder_type("좌석");
				order1.setOrder_confirm("이용전");
			}
			order1.setReview_check(0);
			
			
			SeatOrderVO seat_order1 = new SeatOrderVO();
			
			/*int seat_max_id = service.getMaxSeatId();*/
			
		/*	seat_order1.setSeat_order_id(seat_max_id + 1);*/
			
			String booking_date = (String) session.getAttribute("booking_date");
			String booking_time = (String) session.getAttribute("booking_time");
			String time = booking_date + " " + booking_time;
					
			seat_order1.setReservation_time(time);
			seat_order1.setRestaurant_id(res1.getRestaurant_id());
			seat_order1.setUser_id(user1.getUser_id());
			
			int room_id = 0;
			try {
				room_id = (Integer) session.getAttribute("booking_room");
				seat_order1.setRoom_id(room_id);
			} catch (Exception e) {
				System.out.println(e);
				if (session.getAttribute("booking_room") == null)
					System.out.println("예약하지 않았음");
			}
			
			seat_order1.setOrder_id(max_id_num + 1);
			String request1 = request.getParameter("requests");
			if (request1 != null && request1 != "") {
				seat_order1.setRequest(request1);
			} else {
				seat_order1.setRequest("요청사항 없음");
			}
			
			service.payment(session, order1, seat_order1);
			service.roomReserve(room_id);
			
			return "customer/customerIndex";
		}
		
		@RequestMapping("seat_order")
		public String getStoreRooms(Model model1, HttpSession session) {
			RestaurantVO res1 = (RestaurantVO) session.getAttribute("storeSession");
			List<RoomVO> room_list1 = service.getStoreRooms(res1.getRestaurant_id());
			model1.addAttribute("getStoreRooms", room_list1);
			
			return "customer/roomReservation";
		}
		
		@RequestMapping("seat_order.do")
		public String seatOrder(HttpServletRequest request, HttpSession session) {
			
			String booking_date = request.getParameter("booking_date");
			String booking_time = request.getParameter("booking_time");
			RestaurantVO res1 = (RestaurantVO) session.getAttribute("storeSession");
			List<RoomVO> room_list1 = service.getStoreRooms(res1.getRestaurant_id());
			int room_id = 0;
			int index = -1;
					
			index = Integer.parseInt(request.getParameter("seat"));	
			room_id = room_list1.get(index).getRoom_id();
			
			session.setAttribute("booking_date", booking_date);
			session.setAttribute("booking_time", booking_time);
			session.setAttribute("booking_room", room_id);;
			
			return "customer/restaurantDetail";
		}
		
		@RequestMapping("order.do")
		public String ordering(Model model1, HttpSession session) {
			
			HashMap<String, Object> seat_order1 = new HashMap<String, Object>();
			String time1 = (String)session.getAttribute("booking_date ") + (String)session.getAttribute("booking_time");
			UserVO vo1 = (UserVO) session.getAttribute("userSession");
			
			seat_order1.put("name", vo1.getUser_name());
			seat_order1.put("tel", vo1.getUser_tell());
			seat_order1.put("time", time1);
			
			model1.addAttribute("seat_order1",seat_order1);
			
			return "customer/orderConfirm";
		}
		
		@RequestMapping("seat_manage")
		public String getStoreRooms(HttpSession session, Model model1) {
			
			RestaurantVO res1 = (RestaurantVO) session.getAttribute("storeSession");
			ArrayList<RoomVO> room_list1 = (ArrayList<RoomVO>) service.getStoreRooms(res1.getRestaurant_id());
			model1.addAttribute("room_list",room_list1);
			
			return "roomModify";
		}
		
		@RequestMapping("getSeatOrders")
			public String getSeatOrders(Model model1, HttpSession session) {
				
				RestaurantVO res1 = (RestaurantVO) session.getAttribute("storeSession");
				ArrayList<SeatOrderVO> seat_orders = (ArrayList<SeatOrderVO>) service.getSeatOrders(res1.getRestaurant_id());
				
				model1.addAttribute("seat_orders", seat_orders);
				
				return "business/reservationList";
			}
		
		
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
	
 	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
 	
 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	
	
	
	

}
