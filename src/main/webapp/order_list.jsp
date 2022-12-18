<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%
/* top_menu...
if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("shop_main.jsp");
	return;
}
*/

OrderService orderService = new OrderService();

Order newOrder = new Order(0,null,null,0,sUserId,null);
ArrayList<Order> orderList = orderService.orderListByUserId(newOrder);

ReviewService reviewService = new ReviewService();
//해당 주문건으로 작성된 후기가 있는지 확인

if(!newOrder.getU_id().equals(sUserId)){
	response.sendRedirect("shop_main.jsp");
	return;
}


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/shop.css" type="text/css">
 
<style type="text/css" media="screen">
</style>
<script type="text/javascript">
	/*
	function order_delete_all_action(){
		document.order_delete_all_form.action='order_delete_all_action.jsp';
		document.order_delete_all_form.method='POST';
		document.order_delete_all_form.submit();
	}
	*/
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="order_list_form" id="order_cancel_form">
	</form>	
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b><%=newOrder.getU_id() %>님의 주문 목록</b></td>
								</tr>
							</table> <!--form-->
							<form name="f" method="post">
								<table align=center width=80%  border="0" cellpadding="0"
									cellspacing="1" bgcolor="BBBBBB">
									<tr>
										<td width=80 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문 번호</font></td>
										<td width=145 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문 요약(주문 상세보기)</font></td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문 날짜</font></td>
										<td width=136 height=25 bgcolor="E6ECDE" align=center class=t1><font>주문 가격</font></td>
										<td width=80 height=25 bgcolor="E6ECDE" align=center class=t1> <font>주문 상태</font></td>
									</tr>

									<!-- order start -->
									<%
									for (Order order : orderList) {
										int reviewCount= reviewService.countReviewByOrderNo(order.getO_no());
									%>
									<tr>
										<% if(!order.getO_desc().substring(0, 6).equals("[주문내역삭")) {%>
										<td width=80 height=26 align=center bgcolor="ffffff" class=t1><%=order.getO_no()%></td>
										<td width=145 height=26 align=center bgcolor="ffffff" class=t1><a href="order_detail.jsp?o_no=<%=order.getO_no()%>" class=m1><%=order.getO_desc()%></a></td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=new SimpleDateFormat("yyyy/MM/dd").format(order.getO_date())%></td>
										<td width=136 height=26 align=center bgcolor="ffffff" class=t1><%=new DecimalFormat("#,###").format(order.getO_price())%> 원</td>
										<td width=80 height=26 style="padding-top: 5px;padding-bottom: 5px;" align=center bgcolor="ffffff" class=t1>
										
										
										<% if(!order.getO_desc().substring(0, 6).equals("[주문취소]")&&reviewCount==0){%>
											 <input type="hidden" name="o_no" id="o_no" value="<%=order.getO_no()%>">배송 준비중<br/>
											<!-- <a href="javascript:order_cancel();"><font color=red>[주문취소]</font></a> --> 
										<% } else if(order.getO_desc().substring(0, 6).equals("[주문취소]")){%>
											주문취소
										
										<% } else if(reviewCount>0) {%>
											<font color=blue>구매확정</font>
										<% } %>
										<% } %>
										
										
									</tr>
									<%
									}
									%>
									<!-- order end -->

								</table>
							</form> <br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp;
									<a href=product_list.jsp class=m1>쇼핑하러가기</a>
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