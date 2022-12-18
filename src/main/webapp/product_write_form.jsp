<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
<%


%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>내일의집</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel=stylesheet href="css/styles.css" type="text/css">
<link rel=stylesheet href="css/user.css" type="text/css">
<script type="text/javascript">
	function productCreate(){
		if (document.f.p_name.value == "") {
			alert("상품명을 입력해주세요.");
			f.p_name.focus();
			return false;
		}
		if (f.p_price.value == "") {
			alert("상품 가격을 입력해주세요.");
			f.p_price.focus();
			return false;
		}

		if (f.p_image.value == "") {
			alert("상품 이미지를 입력해주세요.");
			f.p_image.focus();
			return false;
		}
		if (f.p_desc.value == "") {
			alert("상품 설명을 입력해주세요.");
			f.p_desc.focus();
			return false;
		}
		if (f.category.value == "") {
			alert("상품 카테고리를 입력해주세요.");
			f.category.focus();
			return false;
		}
		
		f.action = "product_write_action.jsp";
		f.method='POST';
		f.submit();
	}

	function productList() {
		f.action = "product_list.jsp";
		f.submit();
	}
</script>
<style type="text/css" media="screen">
</style>
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
									<td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>내일의집 - 상품 등록</b></td>
								</tr>
							</table> 
							<!-- write Form  -->
							<form name="f">
								<table  border="0" cellpadding="5" cellspacing="1" width="590"
									bgcolor="BBBBBB">
									<tr >
										<td  width=100 align=center bgcolor="E6ECDE" height="22">상품 명</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="p_name"
											value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품 가격</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="p_price"
											value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품 이미지</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="p_image"
											value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품 설명</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="p_desc"
											value="">
										</td>
									</tr>
									<tr>
										<td width=100 align=center bgcolor="E6ECDE" height="22">상품 분류</td>
										<td width=490 bgcolor="ffffff" style="padding-left: 10px" align="left">
											<input type="text" style="width: 150px" name="category"
											value="">
										</td>
									</tr>
									
								</table>
							</form> <br />
								<table border="0" cellpadding="0" cellspacing="1">
								<tr>
									<td align=center>
									<input type="button" value="상품 등록" onclick="productCreate();"> &nbsp; 
									<input type="button" value="목록" onClick="productList()"></td>
								</tr>
							</table>	
							

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
			<jsp:include page="include_common_bottom.jsp"/>
			<!-- include_common_bottom.jsp end-->
		</div>
	</div>
	<!--container end-->
</body>
</html>
