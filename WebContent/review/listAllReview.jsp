<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.review.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    ReviewService reviewSvc = new ReviewService();
    List<ReviewVO> list = reviewSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有Review資料 - listAllReview.jsp</title>
</head>
<body bgcolor='white'>
<b><font color=red>此頁練習採用 EL 的寫法取值:</font></b>
<table border='1' cellpadding='5' cellspacing='0' width='800'>
	<tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
		<td>
		<h3>所有Review資料 - ListAllReview.jsp</h3>
		<a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a>
		</td>
	</tr>
</table>

<%-- 錯誤表列 --%>
<c:if test="${not empty errorMsgs}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>


<table border='1' bordercolor='#CCCCFF' width='800'>
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
	<%@ include file="page1.file" %>
	<c:forEach var="reviewVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr align='center' valign='middle'>
		
			<c:set var="reviewUse_way" value="${reviewVO.use_way}"/>
			<% 
				String reviewUse_way = (String)pageContext.getAttribute("reviewUse_way"); 
			%>
		
			<td>${reviewVO.rev_no}</td>
			<td>${reviewVO.ord_no}</td>
			<td>${reviewVO.prod_no}</td>
			<td>${reviewVO.prod_score}</td>
			<td>${reviewVO.use_way}</td>
			<td>${reviewVO.rev_cont}</td>
			<td>${reviewVO.rev_date}</td>

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/review/review.do">
			     <input type="submit" value="修改">
			     <input type="hidden" name="rev_no" value="${reviewVO.rev_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/review/review.do">
			    <input type="submit" value="刪除">
			    <input type="hidden" name="rev_no" value="${reviewVO.rev_no}">
			    <input type="hidden" name="action"value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>
