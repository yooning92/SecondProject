<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
//String u_id = request.getParameter("u_id");
UserInfoService userInfoService = new UserInfoService();
userInfoService.remove(sUserId);
session.invalidate();
response.sendRedirect("shop_main.jsp");
%>