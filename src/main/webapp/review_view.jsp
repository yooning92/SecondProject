<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="com.itwill.shop.dto.review.Review"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 비회원 유저도 접근가능 -> login check(X) -->
<%
	/*
	if(request.getMethod().equalsIgnoreCase("GET")){
	    response.sendRedirect("review_list.jsp");		  
		 return;
	}
	*/

	//접근 경로 저장
	String review_access_route=
	(String)session.getAttribute("review_access_route");
	//세션아이디 저장
	//session.Attribute("sUserId", );
	
	String r_noStr=
	request.getParameter("r_no");

	if(r_noStr==null || r_noStr.equals("")){
	    response.sendRedirect("shop_main.jsp");		  
		 return;
	}
	
	ReviewService reviewService = new ReviewService();
	
	Review findReview = new Review(Integer.parseInt(r_noStr),null,null,null,0,null,0,null,null);
	
	Review review = reviewService.selectByReviewNo(findReview);

	// 놓친부분
	if(review==null){
	    response.sendRedirect("product_detail.jsp?p_no=200&cg_no=2");		  
		 return;
	}
	
	//reviewService.updateClickCountByReviewNo(review);
	
	OrderService orderService = new OrderService();
	Order order=
	orderService.findOrderDetailByOrderItemNo(review.getOrderItem().getOi_no());
	
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script language="JavaScript">
	
	function reviewUpdate() {
		document.f.action = "review_modify_form.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	
	function reviewRemove() {
		if (confirm("정말 삭제 하시겠습니까?")) {
			document.f.action = "review_remove_action.jsp";
			document.f.method='POST';
			document.f.submit();
		}
	}
	
	function reviewList() {
		document.f.action = "review_list.jsp";
		document.f.method='POST';
		document.f.submit();
	}

	function review_product_List() {
		document.f.action = "review_product_list.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	function review_admin_List() {
		document.f.action = "review_admin_list.jsp";
		document.f.method='POST';
		document.f.submit();
	}
		
	function order_detail() {
		document.f.action = "order_detail.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	
	function product_detail() {
		document.f.action = "product_detail.jsp";
		document.f.method='POST';
		document.f.submit();
	}
	
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<!-- container start-->
	<div id="container">
		<!-- header start -->
		<div id="header">
			<!-- include_common_top.jsp start-->
			<jsp:include page="include_common_top.jsp" />
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp" />
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp; <b> 내일의집 - 리뷰 내용 보기 </b>
									</td>
								</tr>
							</table> <br> <!-- view Form  -->
							<!-- 
							 -->
							<form name="f" method="post">
								<input type="hidden" name="r_no" value="<%=review.getR_no()%>">
								<input type="hidden" name="u_id" value="<%=review.getU_id()%>">
								<input type="hidden" name="p_no" value="<%=order.getOrderItemList().get(0).getProduct().getP_no()%>">
								<input type="hidden" name="cg_no" value="<%=order.getOrderItemList().get(0).getProduct().getCategory().getCg_no()%>">
								<input type="hidden" name="o_no" value="<%=order.getO_no()%>">
								
								<table border="0" cellpadding="0" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=review.getU_id()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품명</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=order.getOrderItemList().get(0).getProduct().getP_name() %>
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품이미지</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<img width="60px" height="58px" src="image/product/<%=order.getOrderItemList().get(0).getProduct().getP_image()%>" border="0">
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=review.getR_title()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">내용</td>
										<td width=490 bgcolor="ffffff" height="180px" style="padding-left: 10px" align="left"><%=review.getR_content().replace("\n","<br/>")%><br />

										</td>
									</tr>

								</table>

							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center>
									<!-- <input type="button" value="글쓰기" onClick="boardCreate()"> &nbsp; --> 
										<!-- <input type="button" value="답글쓰기" onClick="boardReplyCreate()"> &nbsp; --> 
										<input type="button" value="수정" onClick="reviewUpdate()"> &nbsp; 
										<input type="button" value="삭제" onClick="reviewRemove()"> &nbsp; 
										<%if(review_access_route.equals("review_list")) {%>
										<input type="button" value="나의 리뷰 리스트" onClick="reviewList()"> &nbsp;
										<input type="button" value="주문상세보기" onClick="order_detail()">
										
										<%} else if(review_access_route.equals("review_product_list")) {%>
										<input type="button" value="리뷰리스트 돌아기기" onClick="review_product_List()"> &nbsp; 
										<input type="button" value="상품으로 돌아가기" onClick="product_detail()">
										
										<%} else if(review_access_route.equals("review_admin_list")) {%>
										<input type="button" value="리뷰 리스트" onClick="review_admin_List()">

										<%} else if(review_access_route.equals("order_list")) {%>
										<input type="button" value="나의 리뷰 리스트" onClick="reviewList()"> &nbsp; 
										<input type="button" value="주문상세보기" onClick="order_detail()">

										<%} %>
									</td>
								</tr>
							</table></td>
					</tr>
				</table>
			</div>
			<!-- include_content.jsp end-->
			<!-- content end -->
		</div>
		<!--wrapper end-->
		<div id="footer">
			<!-- include_common_bottom.jsp start-->
			<jsp:include page="include_common_bottom.jsp" />
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>