<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.dto.UserInfo"%>
<%@page import="com.itwill.shop.dto.CartItem"%>
<%@page import="com.itwill.shop.service.UserInfoService"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf"%>
<%


if (request.getMethod().equalsIgnoreCase("GET")) {
	response.sendRedirect("order_list.jsp");
	return;
}

String buyType = request.getParameter("buyType");
String p_noStr = request.getParameter("p_no");
//String p_qty_testStr = request.getParameter("p_qty_test");
String p_qtyStr = request.getParameter("p_qty");
String[] cart_item_noStr_array = request.getParameterValues("cart_item_no");

if(buyType==null)buyType="";
if(p_noStr==null)p_noStr="";
if(p_qtyStr==null)p_qtyStr="";
if(cart_item_noStr_array==null)cart_item_noStr_array=new String[]{};

CartService cartService = new CartService();
UserInfoService userInfoService = new UserInfoService();
ProductService productService = new ProductService();


ArrayList<CartItem> cartItemList = new ArrayList<CartItem>();
UserInfo userInfo = userInfoService.findUser(sUserId);

if (buyType.equals("cart")) {
	cartItemList = (ArrayList)cartService.getCartList(sUserId);
} else if (buyType.equals("cart_select")) {
	for (String cart_item_noStr : cart_item_noStr_array) {
		cartItemList.add(cartService.getCartItemByNo(Integer.parseInt(cart_item_noStr)));
	}
} else if (buyType.equals("direct")) {
	/*
	private int c_no;
	private int c_qty;
	private String u_id;// FK
	private Product product;
	*/
	Product product = productService.productSelectByNo(new Product(Integer.parseInt(p_noStr),null,0,null,null,0,null));
	cartItemList.add(new CartItem(0, Integer.parseInt(p_qtyStr), sUserId, product));
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
/*
form > table tr td{
	border: 0.1px solid black;
}
*/
</style>
<script type="text/javascript">
	function order_create_form_submit() {
		document.order_create_form.method = 'POST';
		document.order_create_form.action = 'order_create_action.jsp';
		document.order_create_form.submit();
	}
	
	function review_select_write_action(formId) {
		if(window.confirm('리뷰를 작성하시겠습니까?')){
			var form = document.getElementById(formId);
			form.method = 'POST';
			form.action = 'review_write_form.jsp';
			form.submit();
		}
	}
	
	function user_modify() {
		if(window.confirm('회원정보를 수정하시겠습니까?')){
			document.user_info.method = 'POST';
			document.user_info.action = 'user_modify_form.jsp';
			document.user_info.submit();
		}
	}
	
</script>
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>
	<form name="order_create_form" method="post">
		<input type="hidden" name="buyType" value="<%=buyType%>">
		<input type="hidden" name="p_no" value="<%=p_noStr%>">
		<input type="hidden" name="p_qty" value="<%=p_qtyStr%>">

		<%
		for (String cart_item_noStr : cart_item_noStr_array) {
		%>
		<input type="hidden" name="cart_item_no" value="<%=cart_item_noStr%>">
		<%
		}
		%>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내일의집 - 주문/결제</b></td>
								</tr>
							</table>
							<!--form start-->
							<form name="user_info">
								<table align=center width=80% border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB">
									<caption style="text-align: left;">구매자 정보</caption>
									<tr>
										<td width=100 height=25 align=center bgcolor="E6ECDE" class=t1>아이디</td>
										<td width=100 height=25 align=center bgcolor="E6ECDE" class=t1>이름</td>
										<td width=150 height=25 align=center bgcolor="E6ECDE" class=t1>이메일</td>
										<td width=200 height=25 align=center bgcolor="E6ECDE" class=t1>배송지 주소</td>
										<td width=150 height=25 align=center bgcolor="E6ECDE" class=t1>전화번호</td>
									</tr>
									<tr>
										<td width=100 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_id()%></td>
										<td width=100 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_name()%></td>
										<td width=150 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_email()%></td>
										<td width=200 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_address()%></td>
										<td width=150 height=26 align=center bgcolor="ffffff" class=t1><%=userInfo.getU_phone()%></td>
									</tr>
								</table>

								<br />
								<table border="0" cellpadding="0" cellspacing="1" width="590">
									<tr>
										<td align=center>&nbsp;&nbsp;
											<a href="javascript:user_modify();" class=m1>회원정보 변경</a>&nbsp;&nbsp;
										</td>
									</tr>
								</table></td>
							</form>
							<!--form end-->
								<br />
								<div id='f'>
								<table align=center width=80%  border="0" cellpadding="0" cellspacing="1" bgcolor="BBBBBB" >
									<caption style="text-align: left;">주문제품목록</caption>
									<tr style="border: 0.1px solid">
										<td width=290 height=25 bgcolor="E6ECDE" align=center class=t1>상품이름</td>
										<td width=112 height=25 bgcolor="E6ECDE" align=center class=t1>수    량</td>
										<td width=166 height=25 bgcolor="E6ECDE" align=center class=t1>가    격</td>
										<td width=50 height=25 bgcolor="E6ECDE" align=center class=t1>비    고</td>
									</tr>
									<%
									int tot_price = 0;
									for (CartItem cart : cartItemList) {
										tot_price += cart.getC_qty() * cart.getProduct().getP_price();
									%>
									<!-- cart item start -->
									<tr>
										<td width=290 height=26 align=center bgcolor="ffffff" class=t1>
											<a
											href='product_detail.jsp?p_no=<%=cart.getProduct().getP_no()%>'><%=cart.getProduct().getP_name()%></a>
										</td>
										<td width=112 height=26 align=center bgcolor="ffffff" class=t1><%=cart.getC_qty()%></td>
										<td width=166 height=26 align=center bgcolor="ffffff" class=t1>
											<%=new DecimalFormat("#,###").format(cart.getC_qty() * cart.getProduct().getP_price())%>
										</td>
										<td width=50 height=26 align=center bgcolor="ffffff" class=t1></td>
									</tr>
									<!-- cart item end -->
									<%}%>
									<tr>
										<td width=640 colspan=4 height=26 bgcolor="ffffff" class=t1>
											<p align=right style="padding-top: 10px">
												<font color=#FF0000>총 주문 금액 : <%=new DecimalFormat("#,###").format(tot_price)%>원
												</font>
											</p>
										</td>
									</tr>
								</table>
							<br />
							<table border="0" cellpadding="0" cellspacing="1" width="590">
								<tr>
									<td align=center>&nbsp;&nbsp;
										<a href="javascript:order_create_form_submit();" class=m1>구매/결제하기</a>&nbsp;&nbsp;
										<a href=product_list.jsp class=m1>계속 쇼핑하기</a>

									</td>
								</tr>
							</table></td>
							</div>
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