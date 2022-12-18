<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%

request.setCharacterEncoding("UTF-8");

ProductService productService = new ProductService();
Product detailProduct = new Product();

/* 상품번호로 1개 출력 */
String noStr = request.getParameter("p_no");
String no_CgStr = request.getParameter("cg_no");

if (noStr == null || noStr .equals("")) {
	response.sendRedirect("product_list.jsp");
	return;
}


boolean isLogin = false;
String sUserId=(String)session.getAttribute("sUserId");
if (session.getAttribute("sUserId") != null) {
	isLogin = true;
}

detailProduct = productService.productSelectByNo_Cg_No(new Product(Integer.parseInt(noStr),null,0,null,null,0,new Category(Integer.parseInt(no_CgStr),null)));
if (detailProduct == null) {
	out.println("<script>");
	out.println("alert('매진 된 상품입니다.');");
	out.println("location.href='product_list.jsp';");
	out.println("</script>");
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
	function add_cart_popup_window(){
		if (<%=!isLogin%>) {
			alert('로그인 하세요');
			location.href = 'user_login_form.jsp';
			
			
		} else {
			
			var left = Math.ceil(( window.screen.width)/3);
			var top = Math.ceil(( window.screen.height)/3); 
			console.log(left);
			console.log(top);
			var cartWin = window.open("about:blank","cartForm","width=420,height=200,top="+top+",left="+left+",location=no, directories=no, status=no, menubar=no, scrollbars=no,copyhistory=no");
			document.add_cart_form.action = 'cart_add_action_popup_window.jsp';
			document.add_cart_form.target = 'cartForm';
			document.add_cart_form.method = 'POST';
			document.add_cart_form.submit();
		}
	}

	function order_create_form() {
		if (<%=!isLogin%>) {
			alert('로그인 하세요');
			location.href = 'user_login_form.jsp';
		} else {
			document.product_detail_form.method = 'POST';
			document.product_detail_form.action = 'order_create_form.jsp';
			document.product_detail_form.submit();
		}
	}
	function productList() {
		document.product_detail_form.method = 'POST';
		document.product_detail_form.action = 'category_list.jsp?cg_no='+<%=Integer.parseInt(no_CgStr)%>;
		document.product_detail_form.submit();
	
	}
	
	function product_modify_form(){
		
		alert('상품수정 하시겠습니까?');
		document.product_detail_form.method = 'POST';
		document.product_detail_form.action = 'product_modify_form.jsp?p_no='+<%=Integer.parseInt(noStr)%>+'&cg_no='+<%=Integer.parseInt(no_CgStr)%>;
		document.product_detail_form.submit();
	}
	function productdelite(){
		alert('상품삭제 하시겠습니까?');
		document.product_detail_form.method = 'POST';
		document.product_detail_form.action = 'product_delete_action.jsp';
		document.product_detail_form.submit();
	}
	
	function reviewList() {
		document.product_detail_form.method = 'POST';
		document.product_detail_form.action = "review_product_list.jsp?p_no="+<%=Integer.parseInt(noStr)%>+"&cg_no="+<%=Integer.parseInt(no_CgStr)%>;
		document.product_detail_form.submit();
	}
	
	function order_direct_create_form() {
		if (confirm("바로 주문하시겠습니까?")) {
			//location.href = 'product_list.jsp';
			//return;
			var product_detail_form = document.getElementById('order_direct_form');
			document.product_detail_form.innerHTML="";
			document.product_detail_form.innerHTML+="<input type='hidden' name='buyType' value='direct'>";
			
			var value_str = document.getElementById('product_qty');
			document.product_detail_form.innerHTML += "<input type='hidden' name='p_qty' value='"+ value_str.options[value_str.selectedIndex].value + "'>";
			
			var p_noStr = document.getElementById('p_no').value;
			document.product_detail_form.innerHTML += "<input type='hidden' name='p_no' value='"+ p_noStr + "'>";
			
			document.product_detail_form.method = 'POST';
			document.product_detail_form.action = 'order_create_form.jsp';
			document.product_detail_form.submit();
		}
	}
	
</script>

</head>
<body  bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0
	marginwidth=0 marginheight=0>
	<form name="product_detail_form" id="order_direct_form">
		<input type="hidden" name="p_no" value="<%=detailProduct.getP_no()%>">
		<input type="hidden" name="p_qty" value="1"> 
		<input type="hidden" name="buyType" value="direct">
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내일의집 - 상품상세보기</b></td>
								</tr>
							</table> <!-- 
							<form name="f" method="post">
							-->
							<table style="margin-left: 10px" border=0 width=80% height=376
								align=center>
								<tr width=100%>
									<td colspan=3 height=5><hr color=#556b2f></td>
								</tr>
								<tr width=100%>
									<td width=10% height=200 align=center class=t1>
									</td>
									<td width=45% height=300 align=center><img border=0
										src='image/product/<%=detailProduct.getP_image()%>' width=250 height=250></td>
									<td width=35% height=200 class=t1>
										<ol type="disc">
											<li><b>상품 명 : <%=detailProduct.getP_name()%>&nbsp;&nbsp;&nbsp;
											</b></li>
											<li><font color=#FF0000>상품 가격 : <%=new DecimalFormat("#,##0").format(detailProduct.getP_price())%> 원&nbsp;&nbsp;&nbsp;
											</font></li>
											<li><font color=#0000FF><%=detailProduct.getP_desc()%></font></li>
										</ol>
										<form name="add_cart_form" method="post" action="cart_add_item_action.jsp" style="display: inline;">
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구매 수량 :
											<!-- 
											 <input type=text name="cart_qty" value=1 size=4 class=TXTFLD>  
											-->
											<select name="cart_qty" id="product_qty">
												<option value="1">1
												<option value="2">2
												<option value="3">3
												<option value="4">4
												<option value="5">5
												<option value="6">6
												<option value="7">7 
												<option value="8">8
												<option value="9">9
												<option value="10">10
											</select> 개<br><br> 
												<!--  <input type=submit value="장바구니에담기[장바구니보여주기]" /> -->
												<br><br> 
												
												<input type="hidden" name=p_no id=p_no value="<%=detailProduct.getP_no()%>">
										</form>
									</td>
								</tr>
								<tr>
									<td colSpan=3 height=21><hr color=#556b2f></td>
								</tr>
							</table> <!-- 
							</form>
							-->


							<table border="0" cellpadding="0" cellspacing="1">
							
								<%if(sUserId==null){ %>
								<tr>
									<td align=center>
									<input type="button" onclick="add_cart_popup_window();" value="장바구니에담기" >
									<input type="button" value="주문하기" onClick="order_create_form();"> &nbsp; <input
										type="button" value="상품리스트" onClick="productList();">
									<input type="button" value="상품평(리뷰)" onClick="reviewList();"></td>
								</tr>
								
								<% }else if(sUserId.equals("admin")){ %>
								
								<tr>
									<td align=center><input type="button" value="상품수정" onClick="product_modify_form();"> &nbsp;
									 				 <input type="button" value="상품삭제" onClick="productdelite();"> &nbsp; 
									 				 <input	type="button" value="상품리스트" onClick="productList();"></td>
								</tr>
								<% }else{ %>
								<tr>
									<td align=center>
									<input type="button" onclick="add_cart_popup_window();" value="장바구니에담기" >
									<input type="button" value="주문하기" onClick="order_direct_create_form();"> &nbsp; 
									<input type="button" value="상품리스트" onClick="productList();">
									<input type="button" value="상품평(리뷰)" onClick="reviewList();">
									</td>
								</tr>
								
								<%} %>
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