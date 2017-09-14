<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import="com.review.model.*"%>
<%
ReviewVO reviewVO = (ReviewVO) request.getAttribute("reviewVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<html>
<head>
<title>Review資料 - listOneReview.jsp</title>
</head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='600'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>Review資料 - listOneReview.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<table border='1' bordercolor='#CCCCFF' width='600'>
	<tr>
		<th>商品心得編號</th>
		<th>訂單編號</th>
		<th>商品編號</th>
		<th>商品評分</th>
		<th>沖泡方式</th>
		<th>心得敘述</th>
		<th>心得記錄時間</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<tr align='center' valign='middle'>
		<td>${reviewVO.rev_no}</td>
		<td>${reviewVO.ord_no}</td>
		<td>${reviewVO.prod_no}</td>
		<td>${reviewVO.prod_score}</td>
		<td>${reviewVO.use_way}</td>
		<td>${reviewVO.rev_cont}</td>
		<td>${reviewVO.rev_date}</td>
	</tr>
</table>

</body>
</html>
