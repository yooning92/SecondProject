<%@page import="com.itwill.shop.service.QnaService"%>
<%@page import="com.itwill.shop.dto.qna.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Qna qna=new Qna();

	qna.setQ_no(
			Integer.parseInt(request.getParameter("q_no")));

	qna.setQ_title(request.getParameter("q_title"));
	qna.setU_id(request.getParameter("u_id"));
	qna.setQ_content(request.getParameter("q_content"));
	QnaService.getInstance().createReply(qna);
	
	String pageno = "1";
	if(request.getParameter("pageno")!=null){
		pageno=request.getParameter("pageno");
	}
	response.sendRedirect(
			String.format("qna_list.jsp?pageno=%s",pageno));
	
%>