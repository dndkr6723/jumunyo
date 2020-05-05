package com.finalp.jumunyo.service;

import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<CategoryVO> goentrance() {
		// db에서 카테고리 목록 대리고 입점신청 페이지로 이동
		return my.selectList("Main.goentrance");
	}
	
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


	@Override
	public List<RoomVO> go_roomlist(RestaurantVO rvo) {
		// 매장 id 값으로 매장 좌석정보 전부출력
		return my.selectList("Main.go_roomlist",rvo);
	}


	@Override
	public List<ReviewVO> review_list(RestaurantVO rvo) {
		// 매장 id 값으로 해당 매장의 리뷰 전부 출력
		return my.selectList("Main.review_list",rvo);
	}


	@Override
	public List<ReplyVO> reply_list(RestaurantVO rvo) {
		// 매장 id 값으로 해당 매장의 리뷰댓글 전부 출력
		return my.selectList("Main.reply_list",rvo);
	}


	@Override
	public String room_delete(RoomVO rmvo) {
		// room id 값으로 해당 좌석 데이터 삭제
		RoomVO check = my.selectOne("Main.room_check", rmvo);
		
		if(check.getRoom_check()==1) {
			return "예약이 있는 테이블은 삭제 할 수 없습니다.";
		} else {
			my.update("Main.room_delete",rmvo);
			return "삭제완료";
		}
	}
	
	@Override
	public String room_modify(RoomVO rmvo) {
		// room id 값으로 해당 좌석 데이터 수정
		RoomVO check = my.selectOne("Main.room_check", rmvo);
		
		if(check.getRoom_check()==1) {
			return "예약이 있는 테이블은 수정 할 수 없습니다.";
		} else {
			my.update("Main.room_modify",rmvo);
			return "수정완료";
		}
	}


	@Override
	public void room_add(RoomVO rmvo) {
		// session 매장 id 값과 함께 매장 좌석 추가
		my.insert("Main.room_add",rmvo);
		
	}


	@Override
	public void menu_sales_top(RestaurantVO rvo) {
		// session 에서 매장 id 값 가져와서 매출현황 페이지 최고매출 디폴트 값 출력(오늘 하루)
		String first_split [] = null;
		String second_split [] = null;

		HashMap<String, Integer> sales  = new HashMap<String, Integer>();
		HashMap<String, Integer> mount_price = new HashMap<String, Integer>();
		
		// 오늘날짜 뽑기
		Date now_date = new Date(System.currentTimeMillis());
		SimpleDateFormat time_form_date = new SimpleDateFormat("yy/MM/dd");
		SimpleDateFormat time_form_second = new SimpleDateFormat("yy/MM/dd/ HH:mm:ss");
		String date_str = time_form_date.format(now_date);
		
		// 오늘 날짜의 order 전부 뽑기
		List<OrderVO> ovol = my.selectList("Main.menu_sales_default", date_str);
		
		// menu id 를 키값으로 수량을 누적하는 hasp 맵 작성
		for(int i=0; i<ovol.size(); i++) {
			first_split = ovol.get(i).getMenu_list().split(",");
			
			for(int j=0; j<first_split.length; j++) {
				second_split = first_split[j].split("x");
				
				if(sales.containsKey(second_split[0])) {
					sales.put(second_split[0], (sales.get(second_split[0]) + Integer.parseInt(second_split[1])));
				} else {
					sales.put(second_split[0], Integer.parseInt(second_split[1]));
				}
			}
		}
		
		// 오늘 팔린 각각 메뉴의 수량x가격
		Set<String> keys = sales.keySet();

		for (String key : keys) {
			int value = sales.get(key); 
			System.out.println(key +":" + value);
			MenuVO mvo = my.selectOne("Main.menu_price",key);
			Integer sum = mvo.getMenu_price()*value;
			System.out.println(sum);
			mount_price.put(key,sum);

		}
		
		
		
	}
	
	@Override
	public HashMap<String, Integer> menu_sales_time(RestaurantVO rvo) {
		// 시간대별 매출 default
		int a = 0; //09~10:59
		int b = 0; //11~12:59
		int c = 0;; //13~14:59
		int d = 0;; //15~16:59 
		int e = 0;; //17~18:59
		int f = 0;; //19~20:59
		int g = 0;; //21~22:59
		
		// 오늘날짜 뽑기
		Date now_date = new Date(System.currentTimeMillis());
		SimpleDateFormat time_form_date = new SimpleDateFormat("yy/MM/dd");
		SimpleDateFormat time_form_second = new SimpleDateFormat("yy/MM/dd/ HH:mm:ss");
		SimpleDateFormat time_form_hour = new SimpleDateFormat("HH");
		String date_str = time_form_date.format(now_date);
		
		// 오늘날짜 시간대별로 뽑기
		List<OrderVO> ovol = my.selectList("Main.menu_sales_default", date_str);
		
		
		for(int i=0;i<ovol.size();i++) {
			String time_str = time_form_hour.format(ovol.get(i).getOrder_date());
			
			switch (time_str) {
			
			case "09":
				a = a + ovol.get(i).getOrder_price();
				break;
			case "10":
				a = a + ovol.get(i).getOrder_price();
				break;
			case "11":
				b = b + ovol.get(i).getOrder_price();
				break;
			case "12":
				b = b + ovol.get(i).getOrder_price();
				break;
			case "13":
				c = c + ovol.get(i).getOrder_price();
				break;
			case "14":
				c = c + ovol.get(i).getOrder_price();
				break;
			case "15":
				d = d + ovol.get(i).getOrder_price();
				break;
			case "16":
				d = d + ovol.get(i).getOrder_price();
				break;
			case "17":
				e = e + ovol.get(i).getOrder_price();
				break;
			case "18":
				e = e + ovol.get(i).getOrder_price();
				break;
			case "19":
				f = f + ovol.get(i).getOrder_price();
				break;
			case "20":
				f = f + ovol.get(i).getOrder_price();
				break;
			case "21":
				g = g + ovol.get(i).getOrder_price();
				break;
			case "22":
				g = g + ovol.get(i).getOrder_price();
				break;
			default:
				g = g + ovol.get(i).getOrder_price();
				break;
			}
			
		}
		
		int sum = a+b+c+d+e+f+g;
		
		HashMap<String, Integer> time_sales = new HashMap<>();
		time_sales.put("1", a);
		time_sales.put("2", b);
		time_sales.put("3", c);
		time_sales.put("4", d);
		time_sales.put("5", e);
		time_sales.put("6", f);
		time_sales.put("7", g);
		time_sales.put("8", sum);

		return time_sales;
		
		
	}
	
	
		 	//<!--~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ 권세현 end ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~-->

}
