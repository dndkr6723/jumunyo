package com.finalp.jumunyo.common;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class DealorderInterceptor extends HandlerInterceptorAdapter {
	
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
		HttpSession session = request.getSession(false);
		if(session.getAttribute("o_search_detail") != null) {
			System.out.println("세션체크");
			/*session.removeAttribute("o_search_detail");*/
		}
		return true;
	}

}
