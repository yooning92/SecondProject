<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
 
if(!sUserId.equals("admin")){
	
}

request.setCharacterEncoding("UTF-8");

String noStr = request.getParameter("p_no");
String noCgStr= request.getParameter("cg_no");
if(noStr == null || noStr.equals("")) {
	 response.sendRedirect("product_detail.jsp?p_no="+noStr+"&cg_no="+noCgStr);
	 return;
}
if(noCgStr == null || noCgStr.equals("")) {
	 response.sendRedirect("product_detail.jsp?p_no="+noStr+"&cg_no="+noCgStr);
	 return;
}
ProductService productService = new ProductService();
Product product = productService.productSelectByNo_Cg_No(new Product(Integer.parseInt(noStr),null,0,null,null,0,new Category(Integer.parseInt(noCgStr),null)));
 %>    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
 
<style type="text/css" media="screen">
</style>

<script type="text/javascript">
		/*상품 변경<관리자>  */
		function product_modify_action() {
			alert("상품의 내용 변경을 완료했습니다.");
			f.action = "product_modify_action.jsp";
			f.method = "POST";
			f.submit();
		}
		
		/*상품 삭제<관리자>  */
		function product_delete_action() {
			alert('상품을 삭제 하시겠습니까?');
			alert("상품의 내용 변경을 완료했습니다.");
			f.action = "product_delete_action.jsp";
			f.method = "POST";
			f.submit();
		}
		
		/*이전화면 이동<관리자>*/
		function product_list() {
			alert('이전 상품으로 이동 하시겠습니까?');
			alert("이전 상품으로 이동 완료 했습니다.");
			f.action = "product_detail.jsp?p_no="+<%=product.getP_no()%>+"&cg_no="+<%=product.getCategory().getCg_no()%>;
			f.method = "POST";
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
			<jsp:include page="include_common_top.jsp"/>
			<!-- include_common_top.jsp end-->
		</div>
		<!-- header end -->
		<!-- navigation start-->
		<div id="navigation">
			<!-- include_common_left.jsp start-->
			<jsp:include page="include_common_left.jsp"/>
			<!-- include_common_left.jsp end-->
		</div>
		<!-- navigation end-->
		<!-- wrapper start -->
		<div id="wrapper">
			<!-- content start -->
			<!-- include_content.jsp start-->
			<div id="content">
				<table width=0 border=0 cellpadding=0 cellspacing=0>
					<tr>
						<td>
							<!--contents--> <br />
							<table style="padding-left: 10px" border=0 cellpadding=0
								cellspacing=0 >
								<tr>
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내일의집 - 상품 수정</b></td>
								</tr>
							</table> 
							<!-- write Form  -->
							<form name="f">
								<table  border="0" cellpadding="5" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr >
										<input type='hidden' name='p_no' value='<%=product.getP_no()%>' >
										<td  width=100 align=center bgcolor="E6ECDE" height="22">상품 명</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="p_name"
											value="<%=product.getP_name()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품 가격</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="p_price"
											value="<%=product.getP_price() %>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품 이미지</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="p_image"
											value="<%=product.getP_image()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품 설명</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="p_desc"
											value="<%=product.getP_desc()%>">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품 분류</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="category"
											value="<%=product.getCategory().getCg_no()%>">
										</td>
									</tr>
									
								</table>
							</form> <br />

							<table border=0 cellpadding=0 cellspacing=1>
								<tr>
									<td align=center>
					<input type="button" value="상품 수정" onclick="product_modify_action()"> &nbsp; 
					<input type="button" value="상품 삭제" onclick="product_delete_action()"> &nbsp; 
					<input type="button" value="이전 상품" onClick="product_list()">
									</td>
								</tr>
								
							</table>

						</td>
					</tr>
				</table>
			</div>