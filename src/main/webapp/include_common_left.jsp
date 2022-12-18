<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
String sUserId=(String)session.getAttribute("sUserId");
%>
<ul>
	<!--비회원일경우  -->
	<%if(sUserId==null){ %>
	<li><a href="product_list.jsp">전체 상품</a></li><br>
	<li><a href="category_list.jsp?cg_no=1">선반 제품</a></li>
	<li><a href="category_list.jsp?cg_no=2">가구 제품</a></li>
	<li><a href="category_list.jsp?cg_no=3">가전 제품</a></li>
	<li><a href="category_list.jsp?cg_no=4">조명 제품</a></li>
	<li><a href="category_list.jsp?cg_no=5">주방 용품</a></li>
	<li><a href=""></a></li>
	<li><a href=""></a></li>
	<li><a href="notice_list.jsp">공지 게시판</a></li>
	<li><a href="qna_list.jsp">문의 게시판</a></li>
	
	
	<!--관리자일경우  -->
	<%}else if(sUserId.equals("admin")){ %>
	<li><h3></a>관리자 페이지</h3></li>
	<li><a href="product_write_form.jsp">상품 등록</a></li>
	<li><a href="notice_write_form.jsp">공지 작성</a></li>
	<li><a href="user_list.jsp">전체 회원 정보</a></li>
	<li>-------------------------</li>
	<li><a href=""></a></li>
	<li><a href="product_list.jsp">전체 상품</a></li><br>
	<li><a href="category_list.jsp?cg_no=1">선반 제품</a></li>
	<li><a href="category_list.jsp?cg_no=2">가구 제품</a></li>
	<li><a href="category_list.jsp?cg_no=3">가전 제품</a></li>
	<li><a href="category_list.jsp?cg_no=4">조명 제품</a></li>
	<li><a href="category_list.jsp?cg_no=5">주방 용품</a></li>
	<li><a href=""></a></li>
	<li><a href=""></a></li>
	<li><a href="notice_list.jsp">공지 게시판</a></li>
	<li><a href="qna_list.jsp">문의 게시판</a></li>
	<li><a href="review_admin_list.jsp">리뷰 게시판</a></li>
	<li><a href=""></a></li>
	<li><a href=""></a></li>
	
	<% }else{%><!--회원일경우  -->
	<li><a href="product_list.jsp">전체 상품</a></li><br>
	<li><a href="category_list.jsp?cg_no=1">선반 제품</a></li>
	<li><a href="category_list.jsp?cg_no=2">가구 제품</a></li>
	<li><a href="category_list.jsp?cg_no=3">가전 제품</a></li>
	<li><a href="category_list.jsp?cg_no=4">조명 제품</a></li>
	<li><a href="category_list.jsp?cg_no=5">주방 용품</a></li>
	<li><a href=""></a></li>
	<li><a href=""></a></li>
	<li><a href="notice_list.jsp">공지 게시판</a></li>
	<li><a href="qna_list.jsp">문의 게시판</a></li>
	<li><a href="review_list.jsp">리뷰 게시판</a></li>
	<% } %>
</ul>