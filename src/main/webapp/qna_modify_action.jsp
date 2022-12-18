<%@page import="com.itwill.shop.service.QnaService"%>
<%@page import="com.itwill.shop.dto.qna.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%    
 //post 요청인 경우 요청 데이터에 한글 문자셋으로 설정
if (request.getMethod().toLowerCase().equals("post")) {
	 
}

//1. Qna 객체를 만들고 사용자가 입력한 데이터를 저장
Qna qna = new Qna();
qna.setQ_no(Integer.parseInt(request.getParameter("q_no")));
qna.setQ_title(request.getParameter("q_title"));
qna.setU_id(request.getParameter("u_id"));
qna.setQ_content(request.getParameter("q_content"));

//2. 데이터베이스에 변경된 내용 적용
QnaService.getInstance().updateQna(qna);
String pageno = "1";
if (request.getParameter("pageno") != null) {
	pageno = request.getParameter("pageno");
}
//3. qna_view.jsp로 이동
response.sendRedirect(
	String.format("qna_view.jsp?q_no=%d&pageno=%s",
	qna.getQ_no(), pageno));
%>
    
