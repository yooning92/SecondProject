<%@page import="com.itwill.shop.dto.OrderItem"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="com.itwill.shop.dto.review.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("shop_main.jsp");
	return;
}
String r_noStr=
request.getParameter("r_no");
String r_title=
request.getParameter("r_title");                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         
String r_content=
request.getParameter("r_content");
String r_ratingStr=
request.getParameter("r_rating");

Review review = new Review(Integer.parseInt(r_noStr), r_title, r_content, null, Integer.parseInt(r_ratingStr), null, 0, sUserId, null);
ReviewService reviewService = new ReviewService();
reviewService.updateByReviewNo(review);

response.sendRedirect("review_list.jsp");

%>
