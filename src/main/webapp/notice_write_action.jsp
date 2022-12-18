<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.itwill.shop.service.NoticeService"%>
<%@page import="com.itwill.shop.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
    
<%
	 if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("notice_list.jsp");
		return;
	}

	String title= request.getParameter("n_title");
	String content= request.getParameter("n_content");
	String date = request.getParameter("n_date");
	Notice newNotice = new Notice(0,title,content,null);
	NoticeService noticeService = new NoticeService();
	noticeService.insertNotice(newNotice);
	response.sendRedirect("notice_list.jsp");
%>
