<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="org.apache.catalina.User"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="com.itwill.shop.dto.review.ReviewListPageMakerDto"%>
<%@page import="com.itwill.shop.dto.review.PageInputDto"%>
<%@page import="com.itwill.shop.dto.review.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 로그인한 고객의 리뷰를 보여주는 페이지 -->	
<%@include file="login_check.jspf"%>  

<%
	/*
	if(request.getMethod().equalsIgnoreCase("GET")&&sUserId==null){
	    response.sendRedirect("shop_main.jsp");		  
		 return;
	}
	*/
	UserInfoService userInfoService = new UserInfoService();
	UserInfo userInfo = userInfoService.findUser(sUserId);
	OrderService orderService = new OrderService();
	
	//리뷰 조회
	ReviewService reviewService = new ReviewService();
	
	ArrayList<Review> reviewList=
	reviewService.selectAllByUserId(new Review(0,null,null,null,0,null,0,sUserId,null));
	//review 접근경로
	session.setAttribute("review_access_route", "review_list");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">
	function boardCreate() {
		location.href = "board_write.jsp";
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
			<!-- outline table start -->
				<table border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td><br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=userInfo.getU_name() %>님의 리뷰 리스트</b>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
								</tr>
							</table> <br /> <!-- list -->
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
									<tr>
										<td width=30 align=center bgcolor="E6ECDE">No.</td>
										<td width=70 align=center bgcolor="E6ECDE">주문번호</td>
										<td width=70 align=center bgcolor="E6ECDE">주문일</td>
										<td width=80 align=center bgcolor="E6ECDE">상품</td>
										<td width=100 align=center bgcolor="E6ECDE">상품명</td>
										<td width=170 align=center bgcolor="E6ECDE">제목</td>
										<td width=70 align=center bgcolor="E6ECDE">별점</td>
										<td width=100 align=center bgcolor="E6ECDE">작성일</td>
										<td width=70 align=center bgcolor="E6ECDE">조회수</td>
									</tr>
									<%
										int i=0;
										for (Review review:reviewList) {
											i++;
											Order order = 
													orderService.findOrderDetailByOrderItemNo(review.getOrderItem().getOi_no());
											Product product=order.getOrderItemList().get(0).getProduct(); 
													//orderService.findProductByOrderItemNo(review.getOrderItem().getOi_no());
									%>
									<tr>
										<input type="hidden" name="r_no" value='<%=review.getR_no() %>'>
										<td width=30 bgcolor="ffffff"  align="center">
										<%=i %>
										</td>
										<td width=70 bgcolor="ffffff" align="center">
										<a href='order_detail.jsp?o_no=<%=order.getO_no()%>'>
										<%=order.getO_no() %>
										</a>
										</td>
										<td width=70 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<%=order.getO_date() %>
										</td>
										<td width=80 bgcolor="ffffff" style="padding-left: 10px; padding-top: 10px" align="left">
											<a href='product_detail.jsp?p_no=<%=product.getP_no()%>&cg_no=<%=product.getCategory().getCg_no()%>'>
											<img width="60px" height="58px" src="image/product/<%=product.getP_image()%>" border="0">
											</a>
										</td>
										<td width=100 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<a href='product_detail.jsp?p_no=<%=product.getP_no()%>&cg_no=<%=product.getCategory().getCg_no()%>'>
											<%=product.getP_name()%>
											</a>
										</td>
										<td width=170 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<a href='review_view.jsp?r_no=<%=review.getR_no()%>'>
											<%=review.getR_title()%>
											</a>
										</td>
										<!-- r_rating start -->
										<td width=70 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%for(int j=0;j<review.getR_rating();j++) {%>
											<img width="10px" height="10x" src="image/ui/star_rating.png" border="0">
											<%} %>
										</td>
										<!-- r_rating end -->
										<td width=100 bgcolor="ffffff" align="center"><%=review.getR_date()%>
										</td>
										<td width=70  bgcolor="ffffff" align="center"><%=review.getR_click_count()%>
										</td>
									</tr>
									<%
										}
									%>
								</table>
								<!-- /list -->
							</form> <br>
							
											<table border="0" cellpadding="0" cellspacing="1" width="590">
												<tr>
													<td align="center">
													
													
													</td>
												</tr>
											</table>
											<!-- button -->
											<!-- 
											<table border="0" cellpadding="0" cellspacing="1" width="590">
												<tr>
													<td align="right"><input type="button" value="게시물 생성"
														onclick="boardCreate();" /></td>
												</tr>
											</table>
											 -->
							</td>
						</tr>
					</table><!-- outline table end -->
					
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