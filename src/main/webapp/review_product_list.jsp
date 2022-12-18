<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="com.itwill.shop.dto.OrderItem"%>
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
<!-- 비회원 유저도 접근가능 -> login check(X) -->
<%
if(request.getMethod().equalsIgnoreCase("GET")){
    response.sendRedirect("product_list.jsp");		  
	 return;
}

String p_noStr= request.getParameter("p_no");
String cg_noStr= request.getParameter("cg_no");
if(cg_noStr==null ||cg_noStr.equals("")){
	 response.sendRedirect("product_list.jsp");		  
	 return;
}
//게시물조회
ReviewService reviewService = new ReviewService();
OrderService orderService =new OrderService();
ProductService productService = new ProductService();

Product product = new Product(Integer.parseInt(p_noStr),null,0,null,null,0,new Category(Integer.parseInt(cg_noStr),null));
product=
productService.productSelectByNo_Cg_No(product);

ArrayList<Review> reviewList=
reviewService.selectAllByProductNoCgNo(new Review(0,null,null,null,0,null,0,null,
													new OrderItem(0,0,0,
																	product
																)));
if(reviewList.size()==0){
	out.println("<script>");
	out.println("alert('아직 작성 된 후기가 없어요! ㅜㅠ');");
	out.println("location.href='product_detail.jsp?p_no="+p_noStr+"&cg_no="+cg_noStr+"';");
	out.println("</script>");
}
//review 접근경로
session.setAttribute("review_access_route", "review_product_list");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/board.css" type="text/css">
<script type="text/javascript">

	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0  marginwidth=0 marginheight=0>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=product.getP_name() %>의 상품리뷰 리스트</b>
									</td>
								</tr>
								<tr bgcolor="#FFFFFF">
								<!-- 
									 -->
								</tr>
					</table> <br /> <!-- list -->
							<form name="f" method="post" action="">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
									<tr>
										<input type="hidden" name="p_no" value='<%=product.getP_no() %>'>
										<td width=30 align=center bgcolor="E6ECDE">No.</td>
										<td width=70 align=center bgcolor="E6ECDE">작성자</td>
										<td width=70 align=center bgcolor="E6ECDE">별점</td>
										<td width=100 align=center bgcolor="E6ECDE">제목</td>
										<td width=250 align=center bgcolor="E6ECDE">내용</td>
										<td width=70 align=center bgcolor="E6ECDE">작성일</td>
										<td width=70 align=center bgcolor="E6ECDE">조회수</td>
									</tr>
									<%
										int i=0;
										for (Review review:reviewList) {
											i++;
											Order order = 
													orderService.findOrderDetailByOrderItemNo(review.getOrderItem().getOi_no());
													//orderService.findProductByOrderItemNo(review.getOrderItem().getOi_no());
									%>
									<tr>
										<input type="hidden" name="r_no" value='<%=review.getR_no() %>'>
										<td width=30 bgcolor="ffffff"  align="center">
										<%=i %>
										</td>
										<td width=70 bgcolor="ffffff"  align="center">
										<%=order.getU_id().replace(order.getU_id().substring(2, 4), "**") %>
										</td>
										<!-- r_rating start -->
										<td width=70 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<%for(int j=0;j<review.getR_rating();j++) {%>
											<img width="10px" height="10x" src="image/ui/star_rating.png" border="0">
											<%} %>
										</td>
										<!-- r_rating end -->
										<td width=100 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<a href='review_view.jsp?r_no=<%=review.getR_no()%>'>
											<%=review.getR_title()%>
										</td>
										<td width=250 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<a href='review_view.jsp?r_no=<%=review.getR_no()%>'>
											<% if(review.getR_content().length()>15){%>
												<%= review.getR_content().replace(review.getR_content().substring(15,review.getR_content().length()), "...") %>
											<%} else{ %>
												<%= review.getR_content()%>
											<%} %>
										</td>
										<td width=70 bgcolor="ffffff"  align="center">
											<%=review.getR_date()%>
										</td>
										<td width=70 align=center bgcolor="ffffff" align="center"><%=review.getR_click_count()%>
										</td>
									</tr>
									<%
										}
									%>
								</table>
								<!-- /list -->
							</form> <br>
							<!-- 
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align="center">
									
									</td>
								</tr>
							</table>
							 -->
							</td>
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