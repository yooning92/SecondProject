<%@page import="com.itwill.shop.dto.review.Review"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login_check하지 않고, 하단에서 접근 막음 -->
<%
	String r_noStr = request.getParameter("r_no");
	String u_idStr = request.getParameter("u_id");
	//String p_noStr = request.getParameter("p_no");
	String sUserId = (String)session.getAttribute("sUserId");
	System.out.println(sUserId);
	
	//r_no없이 접근하는 경우
	if(r_noStr==null || r_noStr.equals("")) {
		 response.sendRedirect("review_list.jsp");
		 return;
	}
	
	//접근 경로 저장
	String review_access_route=
	(String)session.getAttribute("review_access_route");
	
	
	ReviewService reviewService = new ReviewService();
	
	Review findReview = new Review(Integer.parseInt(r_noStr),null,null,null,0,null,0,null,null);
	
	Review review = reviewService.selectByReviewNo(findReview);
	
	if(sUserId==null||!sUserId.equals("admin") && !sUserId.equals(review.getU_id())){
		out.println("<script>");
		out.println("alert('작성자만 삭제가능합니다');");
		out.println("location.href='review_view.jsp?r_no="+r_noStr+"';");
		out.println("</script>");
		return;
	}
	
	reviewService.deleteByReviewNo(new Review(Integer.parseInt(r_noStr),null,null,null,0,null,0,null,null));
	
	//(수정필요)현재, 해당 user의 review_list로 이동
	if(review_access_route.equals("review_list")) {
		response.sendRedirect("review_list.jsp");
	} else if(review_access_route.equals("review_product_list")) {
		response.sendRedirect("review_product_list.jsp");
	} else if(review_access_route.equals("review_admin_list")) {
		response.sendRedirect("review_admin_list.jsp");
	}


%>
