package com.finalp.jumunyo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import java.util.Properties;
import java.util.Random;

import javax.servlet.http.HttpSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.finalp.jumunyo.util.PagingVO;
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


@Repository    //DAO 구성
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired   //의존주입
	SqlSessionTemplate my;  //SqlSession을 구현

	@Override
	public List<UserVO> selectAll() {
		return  my.selectList("Customer.selectAll");
	}

	// 자신의 이름이 적힌 주석 '사이에' 코드 적어주세요~
	
	
	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	
	//로그인
	@Override
	public boolean login(UserVO vo, HttpSession session) {
		UserVO uvo = my.selectOne("Customer.login", vo);  //select문을 실행하면서 넘어온 레코드들 중  조건만에 해당 하는 레코드 하나만 uvo에 담는다
		boolean result = (uvo == null) ? false : true; //레코드가 안 넘어오면 false, 넘어오면 true
		//selectOne(쿼리문 아이디, 조건) : select문을 실행하면서 조건도 전달하여 반환되는 레코드(디비에서 가로줄)을  uvo에 담는다.
		//selectList :  SQL에서 온 많은 레코드들 모두 반환
		if (result) {    //true이면 세션에 레코드를 등록
			session.setAttribute("userSession", uvo);
		}
		return result;
	}
	
	//로그2
	@Override
	public boolean login2(String value, HttpSession session, UserVO vo) {
		   //true이면 세션에 레코드를 등록
		System.out.println("value" + value);
		UserVO uvo = my.selectOne("Customer.login2", value);
		boolean result = (uvo == null) ? false : true;
		System.out.println(uvo);
		if (result) { 
			session.setAttribute("userSession",uvo);
		}
		return result;
	}
	

	//회원가입
	@Override
	public boolean join(UserVO vo) { 
		int uvo =  my.insert("Customer.join", vo); //insert문을 실행하고 object의 값을 테이블에 추가
		if(uvo > 0) {  //성공하면
			return true;
		}else {
			return false;
		}
	}
	
	//회원가입시 아이디 중복 체크
	@Override
	public boolean accountCheck(String user_account) {
		//존재하는 아이디가 있는지 체크
		UserVO uvo = my.selectOne("Customer.accountCheck", user_account); //넘어온 레코드중 입력 조건에 아이디 하나만 담는다
		boolean result = (uvo == null) ? false : true; 
		//null: 현재 존재하는 아이디가 없다 -> false
		// 이미 존재하는 아이디가 있다 -> true
		return result;
		
	}

	//회원가입 닉네임 중복 체크
	@Override
	public boolean nicknameCheck(String user_nickname) {
		UserVO uvo = my.selectOne("Customer.nicknameCheck", user_nickname); //넘어온 레코드중 입력 조건에 닉네임 하나만 담는다
		boolean result = (uvo == null) ? false : true; 
		return result;
	}

	//회원가입 이메일 중복 체크
	@Override
	public boolean emailCheck(String user_email) {
		UserVO uvo = my.selectOne("Customer.emailCheck", user_email); //넘어온 레코드중 입력 조건에 이메일 하나만 담는다
		boolean result = (uvo == null) ? false : true; 
		return result;
	}

	//아이디 찾기
	@Override
	public UserVO accountFind(UserVO vo) {
		UserVO uvo = my.selectOne("Customer.accountFind", vo);
		return uvo;
	}	
	
	//비밀번호 초기화 하고  랜덤 비밀번호 만들기
	@Override
	public UserVO passwordFind(UserVO vo) {
		UserVO uvo = my.selectOne("Customer.passwordFind", vo);
		if(uvo != null) {	//해당하는 정보가 있으면
			String user_password = randomPassword();   //랜덤 비밀번호 만들기
			uvo.setUser_password(user_password); //랜덤비밀번호를 uvo에 다시 담기
			int result = my.update("Customer.randomPassword", uvo); //insert한 결과를 담는다
			System.out.println("초기화를 한 결과 result=" + result);
			UserVO uvo2 = my.selectOne("Customer.passwordFind", vo); //초기화 후 vo를 다시 담는다
			return uvo2;
		}
		return uvo;   //해당하는 정보가 없거나 insert 실패하면
	}
	
	//랜덤 비밀번호 만들기
	private String randomPassword() {
		String tmp = "abcdefghijklmnopqrstuvwxyz0123456789";
		char[] tmp2 = tmp.toCharArray();     //문자열을 char 배열로 담는다
		Random random = new Random();
		char[] tmp3 = new char[10];		//임시비번을 랜덤으로 만들어서 담을 배열
		int length = tmp2.length;		//tmp2의 길이를 담는다
		for(int i = 0 ; i < 10; i++) { 
			int index = random.nextInt(length);  //랜덤으로 뽑힌 숫자를 담는다
			tmp3[i] = tmp2[index];
		}
		String pw = tmp3.toString();
		System.out.println("랜덤비밀번호 " + pw);
		return pw;
	}

	//이메일로 랜덤비밀번호 보내기 (미구현..)
	@Override
	public void sendEmail(String user_email, String user_password) {
		String host     = "smtp.naver.com";
		  final String user   = "jm93924@naver.com"; // 메일을 보내는 관리자 아이디
		  final String password  = "219r3bn11co!"; // 비밀번호

		  String to = user_email;

		  // Get the session object
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");
			/*Session session = new Session();*/		
	}

	//마이페이지 -  예약중인 주문 페이지 - orders 테이블 뽑기
	@Override
	public List<OrderVO> mypageReservationList(UserVO uvo) {
		System.out.println(uvo);
		List<OrderVO> orderList = my.selectList("Customer.ordersList", uvo);
		return orderList;
	}

	//mypageReservationList() 에서 뽑은 orders 로  restaurants 테이블 뽑기
	@Override
	public List<RestaurantVO> restaurantList(List<OrderVO> ovo) {
		OrderVO ovo2 = null;
		RestaurantVO rvo = null;
		List<RestaurantVO> restaurantListVo = new ArrayList<RestaurantVO>();
		
		for(int i = 0; i < ovo.size(); i++) {
			ovo2 = ovo.get(i);
			rvo = my.selectOne("Customer.restaurantList", ovo2);
			restaurantListVo.add(rvo);
			System.out.println("1:" + restaurantListVo.get(i));
		}
		return restaurantListVo;
	}

	@Override
	// mypageReservationList() 에서 뽑은 orders 로 menus 테이블 뽑기 -> menu_list 가공하기
	public List menuList(List<OrderVO> ovo) {

		// menu_name, menu_id 가져오기
		List mNameVo = new ArrayList();
		List<MenuVO> mvo = null;
		OrderVO ovo2 = null;
		String mvoMenuName = null;
		int mvoMenuId = 0;
		List mvoMenuName2 = new ArrayList();
		List mvoMenuId2 = new ArrayList();

		String[] first = null;
		/*String[] second = null;*/
		int firstLength;

		for (int i = 0; i < ovo.size(); i++) {// for 1
			String result = "";
			ovo2 = ovo.get(i); // order list를 ovo에 담기
			mvo = my.selectList("Customer.menuList", ovo2);
			first = ovo.get(i).getMenu_list().split(",");// 0 = [5x2] , 1 = [6x1] , 2 = [4x3]
			for(int a =  0; a < first.length ; a++) {
				System.out.println("first : " + first[a]);
				}

			// menu list split 1
			for (int x = 0; x < first.length; x++) {// for 2
				mvoMenuName = mvo.get(x).getMenu_name();
				mvoMenuId = mvo.get(x).getMenu_id();
				mvoMenuName2.add(x, mvoMenuName);
				mvoMenuId2.add(x, Integer.toString(mvoMenuId));				
				System.out.println("mvoMenuName2 : " +  mvoMenuName2.get(x));
				System.out.println("mvoMenuId2 : " +  mvoMenuId2.get(x));
			} // for2 and
			for(int q = 0 ; q < ovo.size() ; q++) {
			}
				/*mvoMenuId2.get(i).add(Integer.toString(mvoMenuId));*/

			firstLength = first.length * 2;
			String[] second = new String[firstLength];              // 배열크기 [6]
			// menu list split 2
			for (int z = 0; z < first.length; z++) {// for 3              6
					second  = first[z].split("x"); // [5][2][6][1][4][3]
					for(int a =  0; a < second.length ; a++) {
					System.out.println("second : " + second[a]);
					}
				
				/*if (!mvoMenuId2.isEmpty()) {*/// if 1
					for (int j = 0; j < first.length; j++) {// for 4
						if (mvoMenuId2.get(j).equals(second[0])) {// if 2
							result += mvoMenuName2.get(j) + "/" + second[1] + " ";
							System.out.println("result :" + result);
						} // if 2 and
					} // for 4 and
				 // if 1 and
			} // for 3 and
			mNameVo.add(i, result);
		} // for 1 and
		return mNameVo;
	}

	//예약중인 페이지 - mypageReservationList() 에서 뽑은 orders 로 seat_ordes 테이블 뽑기
	@Override
	public List<SeatOrderVO> seatOrdersList(List<OrderVO> ovo) {
		OrderVO ovo2 = null;
		SeatOrderVO svo = null;
		List<SeatOrderVO> seatOrderListVo = new ArrayList<SeatOrderVO>();
		
		for(int i = 0; i < ovo.size(); i++) {
			ovo2 = ovo.get(i);
			svo = my.selectOne("Customer.seatOrdersList", ovo2);
			seatOrderListVo.add(svo);
			/*System.out.println("seatOrderListVo : " + seatOrderListVo.get(i));*/
		}
		return seatOrderListVo;
	}
	
	//과거내용내역 페이지 - orders 테이블 뽑기
	@Override
	public List<OrderVO> myPageOrderHistory(UserVO uvo) {
		List<OrderVO> ovo = my.selectList("myPageOrderHistory", uvo);
		for(int i = 0 ; i < ovo.size() ; i++) {
			//여기서 주문서 칼럼 갯수 많큼 reviews 테이블 생성
			/*System.out.println("ovo :  " + ovo.get(i));*/
		}
		return ovo;
	}
	
	
	// myPageOrderHistory() 에서 뽑은 orders 로  restaurants 테이블 뽑기
		@Override
		public List<RestaurantVO> myPageOrderHistory_rvo(List<OrderVO> ovo) {
			OrderVO ovo2 = null;
			RestaurantVO rvo = null;
			List<RestaurantVO> restaurantListVo = new ArrayList<RestaurantVO>();
			
			for(int i = 0; i < ovo.size(); i++) {
				ovo2 = ovo.get(i);
				rvo = my.selectOne("Customer.restaurantList", ovo2);
				restaurantListVo.add(rvo);
				System.out.println("1:" + restaurantListVo.get(i));
			}
			return restaurantListVo;
		}

		//orders 테이블로 reviews 테이블 찾기
		@Override
		public List<ReviewVO> myPageOrderHistory_review(UserVO uvo) {
			List<ReviewVO> reviewVo = my.selectList("Customer.reviewsList", uvo);
			ReviewVO rvo = null;
			
			for(int i = 0 ; i < reviewVo.size() ; i++) {
				System.out.println("reviewVo : " + reviewVo.get(i));
			}
			return reviewVo;
		}

		//session으로  리뷰 insert 하기
		@Override
		public boolean mypageInsertReview(ReviewVO reviewVo) {
			System.out.println("reviewVo 10 : " + reviewVo);
			int a = my.insert("Customer.reviewInsert", reviewVo);
			if(a > 0) {  //성공하면
				return true;
			}else {
				return false;
			}
		}

		/*회원의 1:1 문의 리스트 1 회원이 보낸 내용*/
		@Override
		public List<QuestionVO> customerQuestionList(UserVO uvo) {
			List<QuestionVO> questionList1 = my.selectList("Customer.customerQuestionList", uvo);
			
			for(int i = 0 ; i < questionList1.size() ; i++) {
				System.out.println("questionList1 :" + questionList1.get(i));
			}
			return questionList1;
		}

		//1:1문의 카테고리 이름
		@Override
		public List<QuestionCategoryVO> categoryName(List<QuestionVO> qvo) {
			QuestionVO qvo2 = null;
			QuestionCategoryVO qcvo = null;
			List<QuestionCategoryVO> qcvoList = new ArrayList<QuestionCategoryVO>();
			for(int i = 0 ; i < qvo.size() ; i++) {
				qvo2 = qvo.get(i);
			}
			
			
			for(int i = 0 ; i < qvo.size() ; i++) {
				qcvo = my.selectOne("Customer.categoryName", qvo2);
				qcvoList.add(qcvo);
				System.out.println("qcvoList :" + qcvoList.get(i));
			}
			return qcvoList;
		}
		
		//마이페이지 - 1:1문의 작성하기
		@Override
		public boolean mypageInsertQuestion(QuestionVO qvo) {
			System.out.println("6: " + qvo);
			int a = my.insert("Customer.questionInsert", qvo);
			if(a > 0) {  //성공하면
				return true;
			}else {
				return false;
			}
		}

		//마이페이지 - 내정보보기 - 회원정보 수정하기
		@Override
		public UserVO updateUser(UserVO uvo,HttpSession session) {
			int result = 0;
			UserVO uvo2 = null;
			if(uvo.getUser_nickname() != null){
				result = my.update("Customer.updateUser_nickname", uvo);
			}else if(uvo.getUser_email() != null) {
				result = my.update("Customer.updateUser_email", uvo);
			}else if(uvo.getUser_password() != null) {
				result = my.update("Customer.updateUser_password", uvo);
			}else if(uvo.getUser_tell() != null) {
				result = my.update("Customer.updateUser_tell", uvo);
			}else if(uvo.getUser_address() != null) {
				result = my.update("Customer.updateUser_address", uvo);
			}
			
			if(result > 0) {  //성공하면
				uvo2 = my.selectOne("Customer.updateSession", uvo);
				session.setAttribute("userSession", uvo2);
				return uvo2;
			}
			return uvo2;
		}

		//회원탈퇴
		@Override
		public boolean deleteUser(UserVO uvo) {
			int a = my.delete("Customer.deleteUser", uvo);
			if(a > 0) {  //성공하면
				return true;
			}else {
				return false;
			}
		}

		// 매장이름으로 검색
		@Override
		public List<RestaurantVO> searchRestaurantName(RestaurantVO rvo, PagingVO pagingVO) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("restaurant_name", rvo.getRestaurant_name());
			map.put("start",pagingVO.getStart() );
			map.put("end", pagingVO.getEnd());
			return my.selectList("Customer.searchRestaurantName",map);
		}

		//인덱스 - 메뉴 카테고리 눌러서 검색
		@Override
		public List<RestaurantVO> categorySearch(RestaurantVO rvo,PagingVO pagingVO) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("category_id", rvo.getCategory_id());
			map.put("start",pagingVO.getStart());
			map.put("end", pagingVO.getEnd());
			return my.selectList("Customer.categorySearch",map);
		}

		//리뷰수 계산하기
		@Override
		public List<Integer> countReviews(List<RestaurantVO> rvolist) {
			RestaurantVO rvo = null;
			int reviewVo = 0;
			List<Integer> resultView = new ArrayList<Integer>();	
			for(int i = 0 ; i < rvolist.size() ; i++) {
				int num = rvolist.get(i).getRestaurant_id();
				reviewVo = my.selectOne("Customer.reviewsCounts", num);
				resultView.add(reviewVo);
			}
			return resultView;
		}

		//검색 후 정렬(별점순)
		@Override
		public List<RestaurantVO> categorySearch_sort(String restaurant_name, PagingVO paging, int category_id) {
			/*RestaurantVO rvo = new RestaurantVO();
			rvo.setRestaurant_name(restaurant_name);*/
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("restaurant_name", restaurant_name);
			map.put("start", paging.getStart());
			map.put("end", paging.getEnd());
			map.put("category_id", category_id);
			return my.selectList("Customer.sortList1", map);
		}

		//검색 후 정렬(날짜순)
		@Override
		public List<RestaurantVO> categorySearch_sort2(String restaurant_name, PagingVO paging, int category_id) {
			/*RestaurantVO rvo = new RestaurantVO();
			rvo.setRestaurant_name(restaurant_name);*/
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("restaurant_name", restaurant_name);
			map.put("start", paging.getStart());
			map.put("end", paging.getEnd());
			map.put("category_id", category_id);
			List list1 = my.selectList("Customer.sortList2", map);
			for(int i = 0 ; i < list1.size() ; i++) {
				System.out.println("sortList3 list2 : " +list1.get(i));
			}
			return my.selectList("Customer.sortList2", map);
		}

		//검색 후 정렬(리뷰순)
		@Override
		public List<RestaurantVO> categorySearch_sort3(String restaurant_name, PagingVO paging, int category_id) {
			/*RestaurantVO rvo = new RestaurantVO();*/
			System.out.println("restaurant_name : " + restaurant_name);
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("restaurant_name", restaurant_name);
			map.put("start", paging.getStart());
			map.put("end", paging.getEnd());
			map.put("category_id", category_id);
			List list1 = my.selectList("Customer.sortList3", map);
			for(int i = 0 ; i < list1.size() ; i++) {
				System.out.println("sortList3 list1 : " +list1.get(i));
			}
			return my.selectList("Customer.sortList3", map);
		}

		//리뷰,날짜,별점 순 정렬 갯수 (페이징)
		@Override
		public int countList1(String rvoSearchRestaurant_name) {
			RestaurantVO rvo = new RestaurantVO();
			rvo.setRestaurant_name(rvoSearchRestaurant_name);
			return my.selectOne("Customer.countList1", rvo);
		}

		// 검색 후 갯수 (페이징)
		@Override
		public int countList2(RestaurantVO rvo) {
			RestaurantVO rvo2 = new RestaurantVO();
			rvo2.setRestaurant_name(rvo.getRestaurant_name());
			return my.selectOne("Customer.countList2", rvo2);
		}
		
		// 카테고리 클릭 후 갯수 (페이징)
		@Override
		public int countList3(RestaurantVO rvo) {
		/*	RestaurantVO rvo2 = new RestaurantVO();
			rvo2.setRestaurant_name(rvo.getRestaurant_name());*/
			return my.selectOne("Customer.countList3", rvo);
		}

		//단어 검색 후 정렬 (별점순)
		@Override
		public List<RestaurantVO> categorySearch_sort4(String restaurant_name, PagingVO paging) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("restaurant_name", restaurant_name);
			map.put("start", paging.getStart());
			map.put("end", paging.getEnd());
			return my.selectList("Customer.sortList4", map);
		}

		//단어 검색 후 정렬 (날짜순)
		@Override
		public List<RestaurantVO> categorySearch_sort5(String restaurant_name, PagingVO paging) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("restaurant_name", restaurant_name);
			map.put("start", paging.getStart());
			map.put("end", paging.getEnd());
			return my.selectList("Customer.sortList5", map);
		}

		//단어 검색 후 정렬 (리뷰순)
		@Override
		public List<RestaurantVO> categorySearch_sort6(String restaurant_name, PagingVO paging) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("restaurant_name", restaurant_name);
			map.put("start", paging.getStart());
			map.put("end", paging.getEnd());
			return my.selectList("Customer.sortList6", map);
		}

	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	


	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	 	
		@Override
		public RestaurantVO getOneStore(int restaurant_id) {
			
			RestaurantVO res1 = my.selectOne("Customer.getOneStore", restaurant_id);
			
			return res1;
		}

		@Override
		public ArrayList<MenuVO> getStoreMenu(int restaurant_id) {
			
			List<MenuVO> menu_list1 = my.selectList("Customer.getStoreMenu", restaurant_id);
			
			return (ArrayList<MenuVO>)menu_list1;
		}

		@Override
		public ArrayList<ReviewVO> getStoreReview(int restaurant_id) {
			
			List<ReviewVO> review_list1 = my.selectList("Customer.getStoreReview", restaurant_id);
			
			return (ArrayList<ReviewVO>)review_list1;
		}
		

		@Override
		public HashMap<String, ReplyVO> getReviewReply(List<ReviewVO> review_list1) {
			
			HashMap<String, ReplyVO> reply_list1 = new HashMap<String, ReplyVO>();
			ReplyVO vo1 = null;
			
			for (int i=0; i<review_list1.size(); i++) {
				int review_id1 = review_list1.get(i).getReview_id();
				vo1 = my.selectOne("Customer.getReviewReply", review_id1);
				if(vo1 != null) {
					reply_list1.put(""+review_id1, vo1);
				}else {
					ReplyVO tmp = new ReplyVO();
					tmp.setReply_content("댓글없음");
					reply_list1.put(""+review_id1, tmp);
				}
				
			}
			
			return reply_list1;
		}

		@Override
		public void getOneUser(HttpSession session) {
			
			UserVO user1 = new UserVO();
			String user_name = "최원준";
			user1 = my.selectOne("getOneUser", user_name);
			session.setAttribute("login_info", user1);
		}
		
		@Override
		public void payment(HttpSession session, OrderVO order1, SeatOrderVO seat_order1) {
			
			my.update("ordering_insert", order1);
			String time = seat_order1.getReservation_time();
			if (time != null && !time.contains("null")) { // date와 time중 하나라도 null이면
				my.update("seat_order_insert",seat_order1);
			}
					
			session.removeAttribute("cart_list");
			session.removeAttribute("booking_date");
			session.removeAttribute("booking_time");
			session.removeAttribute("booking_rooms");
		}

		@Override
		public int getMaxOrderId() {
			
			int max_id = my.selectOne("getMaxOrderId");
			
			return max_id;
		}

		@Override
		public int getMaxSeatId() {
			
			int max_id = my.selectOne("getMaxSeatId");
			
			return max_id;
		}
		
		@Override
		public List<RoomVO> getStoreRooms(int restaurant_id) {
			
			List<RoomVO> room_list1 = my.selectList("getStoreRooms", restaurant_id);
			
			return room_list1;
		}
		 	
		@Override
		public List<SeatOrderVO> getSeatOrders(int restaurant_id) {
			
			List<SeatOrderVO> seat_orders = my.selectList("getSeatOrders", restaurant_id);
			
			return seat_orders;
		}

		@Override
		public void roomReserve(int room_id) {
			my.update("roomReserve", room_id);
		} 	
		
		
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		 	
		 	
			
		 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		 	
		 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		 	
		 	
			
		 	
			
		 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
		 	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

}
