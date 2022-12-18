<%@page import="com.itwill.shop.service.NoticeService"%>
<%@page import="com.itwill.shop.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
	/* if(request.getMethod().equalsIgnoreCase("GET")){	
		response.sendRedirect("notice_list.jsp");
	}
 */
	String noStr = request.getParameter("n_no");	
	String n_title = request.getParameter("n_title");	
	String n_content = request.getParameter("n_content");	
	Notice notice = new Notice(Integer.parseInt(noStr),n_title,n_content,null);
	NoticeService noticeService = new NoticeService();
	noticeService.updateNotice(notice);
	response.sendRedirect("notice_view.jsp?n_no="+noStr);
%>


