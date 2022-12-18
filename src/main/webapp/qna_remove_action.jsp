<%@page import="com.itwill.shop.service.QnaService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Integer q_no = null;
	Integer pageno = 1;
	try {
		q_no = Integer.valueOf(request.getParameter("q_no"));
		pageno = Integer.valueOf(request.getParameter("pageno"));
	} catch (Exception ex) {
	}
	
	QnaService qnaService = new QnaService();
	int revCount = qnaService.removeQna(q_no);
	
	if(revCount==0){
		out.print("<script> alert('"+"삭제실패"+"');" +"location.href='qna_list.jsp'; </script>");
	}else if(revCount==1){
		out.print("<script> alert('"+"삭제성공"+"');" +"location.href='qna_list.jsp'; </script>");
	}
	
%>




