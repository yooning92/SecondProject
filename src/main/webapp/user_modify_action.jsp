<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("shop_main.jsp");
		return;
	}
	//request.setCharacterEncoding("UTF-8");
	String u_name=request.getParameter("u_name");
	String u_pw=request.getParameter("u_pw");
	String u_email=request.getParameter("u_email");
	String u_address=request.getParameter("u_address");
	String u_phone=request.getParameter("u_phone");
	
	UserInfoService userInfoService=new UserInfoService();
	int updateRowCont=userInfoService.update(new UserInfo(sUserId,u_pw,u_name,u_email,u_address,u_phone));
	response.sendRedirect("user_view.jsp");
%>