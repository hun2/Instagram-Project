package com.example.demo.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.model.User;

@Component
public class PermissionInterceptor implements HandlerInterceptor {

	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Override
	//웹 => 서버 보낼떄 컨트롤러 전에 필터링
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws IOException {
		
		//세션이 있는지 확인
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("loginUser");
		
		//요청 url path 가져오기
		String uri = request.getRequestURI();
		log.info("[################# prehandle] uri:{}", uri);
		
		
		//비로그인 && /main/board
		if (user == null && (
				uri.startsWith("/main/board-view") || 
				uri.startsWith("/main/my-list") ||  
				uri.startsWith("/main/other-list") || 
				uri.startsWith("/main/logout"))
												 ) {
			response.sendRedirect("/main/sign-in-view");
			return false;
		}
		
		//로그인 && /main/sign-in-view
		if(user != null && uri.startsWith("/main/sign-in-view")) {
			response.sendRedirect("/main/board-view");
			return false;
		}
		return true;
		
	}
}
