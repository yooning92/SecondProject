<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="com.itwill.shop.dto.review.Review"%>
<%@page import="com.itwill.shop.service.ReviewService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String sUserId=(String)session.getAttribute("sUserId");

	String r_noStr=
	request.getParameter("r_no");
	/*******************/
	//sUserId="test4";
	//r_noStr="13";
	
	/*******************/
	/*
	if(r_noStr==null || r_noStr.equals("")){
	    response.sendRedirect("shop_main.jsp");		  
		 return;
	}
	*/
	/* 
	UserInfoService userInfoService = new UserInfoService();
	UserInfo userInfo=
	userInfoService.findUser(sUserId);
	 */
	ReviewService reviewService = new ReviewService();
	Review review = new Review(Integer.parseInt(r_noStr),null,null,null,0,null,0,null,null);
	reviewService.updateClickCountByReviewNo(review);
	
	review =reviewService.selectByReviewNo(review);
	//비회원과 작성자가 아닌사람은 접근불가
	if(sUserId==null|| sUserId.equals("") || !review.getU_id().equals(sUserId) ){
		out.println("<script>");
		out.println("alert('작성자만 수정 가능합니다');");
		out.println("location.href='review_view.jsp?r_no="+r_noStr+"';");
		out.println("</script>");
		return;
	}
	
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
<script type="text/javascript">
	
	function reviewUpdate() {
		if (f.r_title.value == "") {
			alert("제목을 입력해주세요.");
			f.r_title.focus();
			return false;
		}
		if (f.r_content.value == "") {
			alert("내용을 입력해주세요.");
			f.r_content.focus();
			return false;
		}
		if (f.r_rating.value > 5) {
			alert("☆0 ~ 5 사이의 숫자로 별점을 주세요☆");
			f.r_rating.focus();
			return false;
		}
		if (f.r_rating.value == "" ) {
			f.r_rating.value = 0
		}

		f.method="POST";
		f.action = "review_modify_action.jsp";
		f.submit();
	}

	function reviewList() {
		f.action = "review_list.jsp";
		f.submit();
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
							<table style="padding-left: 10px" border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=review.getU_id() %> 님의 리뷰 수정</b></td>
								</tr>
							</table> <br> <!-- write Form  -->
							
							
							<form name="f" method="post">
								<table border="0" cellpadding="0" cellspacing="1" width="590" bgcolor="BBBBBB">
										<input type="hidden" name="r_no" value='<%=review.getR_no() %>'>
										<input type="hidden" name="oi_no" value='<%=review.getOrderItem().getOi_no() %>'>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">글쓴이</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left"><%=review.getU_id()%></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">구매일자</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<%=order.getO_date() %>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품명</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="placeholder"  style="width: 150px" name="p_name" value='<%=order.getOrderItemList().get(0).getProduct().getP_name() %>'></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품이미지</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<img width="60px" height="58px" src="image/product/<%=order.getOrderItemList().get(0).getProduct().getP_image()%>" border="0">
									</tr>

									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">작성일자</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<%=review.getR_date() %>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">제목</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 150px" name="r_title" value='<%=review.getR_title() %>'></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">내용</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<textarea name="r_content" class="textarea" style="width: 350px " rows="10" ><%=review.getR_content() %></textarea></td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE">별점</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
										<input type="text" style="width: 150px" name="r_rating" value='<%=review.getR_rating() %>'></td>
									</tr>
								</table>
							</form> <br>
							<table width=590 border=0 cellpadding=0 cellspacing=0>
								<tr>
									<td align=center><input type="button" value="리뷰 수정" onClick="reviewUpdate()"> &nbsp;
									<input type="button" value="리뷰 목록" onClick="reviewList()"></td>
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