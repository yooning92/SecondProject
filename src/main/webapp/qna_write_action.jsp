<%@page import="com.itwill.shop.service.QnaService"%>
<%@page import="com.itwill.shop.dto.qna.Qna"%>
<%@page import="java.util.Date"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("qna_list.jsp");
		return;
	}

	String title= request.getParameter("q_title");
	String content= request.getParameter("q_content");
	String date = request.getParameter("q_date");
	String writer = sUserId;
	
	Qna qna = new Qna(0,title,content,null,null, 0,0,0,0,writer);
	QnaService qnaService = new QnaService();
	qnaService.createQna(qna);
	response.sendRedirect("qna_list.jsp"); 
%>
