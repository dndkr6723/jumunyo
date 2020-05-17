package com.finalp.jumunyo.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

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
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

public interface CustomerService {
	
	public List<UserVO> selectAll();
	
	// 자신의 이름이 적힌 주석 '사이에' 코드 적어주세요~
	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	
	//로그인
	public boolean login(UserVO vo,HttpSession session);

	//자동로그인
	public boolean login2(String value, HttpSession session, UserVO vo);
	
	//회원가입
	public boolean join(UserVO vo);

	//회원가입 시 아이디 중복 체크
	public boolean accountCheck(String user_account);

	//회원가입 닉네임 중복 체크
	public boolean nicknameCheck(String user_nickname);

	//회원가입 이메일 중복 체크
	public boolean emailCheck(String user_email);

	//아이디 찾기
	public UserVO accountFind(UserVO vo);

	//비밀번호 찾기
	public UserVO passwordFind(UserVO vo);

	//이메일로 랜덤비밀번호 보내기
	public void sendEmail(String user_email, String user_password);

	//마이페이지 -  예약중인 주문 페이지 - orders 테이블 뽑기
	public List<OrderVO> mypageReservationList(UserVO uvo);

	//mypageReservationList() 에서 뽑은 orders 로  restaurants 테이블 뽑기
	public List<RestaurantVO> restaurantList(List<OrderVO> ovo);

	// mypageReservationList() 에서 뽑은 orders 로 menus 테이블 뽑기 -> menu_list 가공하기
	public List menuList(List<OrderVO> ovo);

	//mypageReservationList() 에서 뽑은 orders 로 seat_ordes 테이블 뽑기
	public List<SeatOrderVO> seatOrdersList(List<OrderVO> ovo);

	//마이페이지 -  과거이용내역 페이지 - orders 테이블 뽑기
	public List<OrderVO> myPageOrderHistory(UserVO uvo);

	// myPageOrderHistory() 에서 뽑은 orders 로  restaurants 테이블 뽑기
	List<RestaurantVO> myPageOrderHistory_rvo(List<OrderVO> ovo);

	//3. orders 테이블로 reviews 테이블 찾기
	public List<ReviewVO> myPageOrderHistory_review(UserVO uvo);

	//session으로  리뷰 insert 하기
	public boolean mypageInsertReview(ReviewVO reviewVo);

	/*회원의 1:1 문의 리스트 1 회원이 보낸 내용*/
	public List<QuestionVO> customerQuestionList(UserVO uvo);
	
	//마이페이지 - 1:1문의 작성하기
	public boolean mypageInsertQuestion(QuestionVO qvo);

	//마이페이지 - 내정보보기 - 회원정보 수정하기
	public UserVO updateUser(UserVO uvo, HttpSession session);

	//회원탈퇴
	public boolean deleteUser(UserVO uvo);
	
	// 매장 이름으로 검색
	public List<RestaurantVO> searchRestaurantName(RestaurantVO rvo, PagingVO pagingVO);
	
	//인덱스 - 메뉴 카테고리 눌러서 검색
	public List<RestaurantVO> categorySearch(RestaurantVO rvo, PagingVO pagingVO);

	//리뷰수 계산하기
	public  List<Integer> countReviews(List<RestaurantVO> rvolist);

	//1:1문의 카테고리 이름
	public List<QuestionCategoryVO> categoryName(List<QuestionVO> qvo);

	//검색 후 별점순 정렬
	public List<RestaurantVO> categorySearch_sort(String rvoSearchRestaurant_name, PagingVO pageing, int category_id);
	
	//검색 후 날짜순 정렬
	public List<RestaurantVO> categorySearch_sort2(String rvoSearchRestaurant_name, PagingVO paging, int category_id);

	//검색 후 리뷰순 정렬
 	public List<RestaurantVO> categorySearch_sort3(String rvoSearchRestaurant_name, PagingVO paging, int category_id);

 	//리뷰,날짜,별점 순 정렬 갯수 (페이징)
 	public int countList1(String rvoSearchRestaurant_name);
 	
 	// 검색 후 갯수 (페이징)
 	public int countList2(RestaurantVO rvo);
 	
 	// 카테고리 클릭 후  갯수 (페이징)
	public int countList3(RestaurantVO rvo);

	
	// 단어 검색 후 정렬 일 때
	public List<RestaurantVO> categorySearch_sort4(String rvoSearchRestaurant_name, PagingVO pagingVO);

	public List<RestaurantVO> categorySearch_sort5(String rvoSearchRestaurant_name, PagingVO pagingVO);

	public List<RestaurantVO> categorySearch_sort6(String rvoSearchRestaurant_name, PagingVO pagingVO);
	
	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이보라 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	
	
		//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
 	
	public RestaurantVO getOneStore(int restaurant_id);

	public ArrayList<MenuVO> getStoreMenu(int restaurant_id);

	public ArrayList<ReviewVO> getStoreReview(int restaurant_id);

	public HashMap<String, ReplyVO> getReviewReply(List<ReviewVO> review_list1);

	public void getOneUser(HttpSession session);
	
	public void payment(HttpSession session, OrderVO order1, SeatOrderVO seat_order1);
	public int getMaxOrderId();
	public int getMaxSeatId();
	
	public List<RoomVO> getStoreRooms(int restaurant_id);
	public List<SeatOrderVO> getSeatOrders(int restaurant_id);

	public void roomReserve(int room_id);
	
	
	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 이종명 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	 	
	 	
		
	 	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	 	
	 	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 최원준 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->
	 	
	 	
		
	 	
	 	
		
	 	
	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 start ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

	 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

}
