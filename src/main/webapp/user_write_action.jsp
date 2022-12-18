<%@page import="java.net.URLEncoder"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("shop_main.jsp");
		return;
	}

	String u_id = request.getParameter("u_id");
	String u_pw = request.getParameter("u_pw");
	String u_name = request.getParameter("u_name");
	String u_email = request.getParameter("u_email");
	String u_address = request.getParameter("u_address");
	String u_phone = request.getParameter("u_phone");
	UserInfo newUser=new UserInfo(u_id,u_pw,u_name,u_email,u_address,u_phone);
	UserInfoService userInfoService=new UserInfoService();
	int result=userInfoService.create(newUser);
	
	if(result==-1){
		/*##################아이디 중복#################*/
		String msg=u_id+ "는 이미 존재하는 아이디입니다.";
		request.setAttribute("msg", msg);
		request.setAttribute("fuser", newUser);
		
		RequestDispatcher rd=
		request.getRequestDispatcher("user_write_form.jsp");
		rd.forward(request, response);
		
	}else if(result==1){
		/*##################회원가입성공#################*/
		response.sendRedirect("user_login_form.jsp");
	}
%>
