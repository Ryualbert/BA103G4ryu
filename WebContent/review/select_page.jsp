<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>Bean Review: Home</title></head>
<body bgcolor='white'>

<table border='1' cellpadding='5' cellspacing='0' width='400'>
  <tr bgcolor='#CCCCFF' align='center' valign='middle' height='20'>
    <td><h3>Bean Review: Home</h3><font color=red>( MVC )</font></td>
  </tr>
</table>

<p>This is the Home page for Bean Review: Home</p>

<h3>資料查詢:</h3>
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

<ul>
	<li><a href='listAllReview.jsp'>List</a> all Review. </li> <br><br>


	<li>
	<FORM METHOD="post" ACTION="review.do" >
	    <b>輸入Review編號 (如R1000000001):</b>
	    <input type="text" name="rev_no">
	    <input type="submit" value="送出">
	    <input type="hidden" name="action" value="getOne_For_Display">
	</FORM>
	</li>

	 	<jsp:useBean id="reviewSvc" scope="page" class="com.review.model.ReviewService" />

	<li>
	 <FORM METHOD="post" ACTION="review.do" >
	   <b>選擇Review編號:</b>
	   <select size="1" name="rev_no">
	     <c:forEach var="reviewVO" items="${reviewSvc.all}" >
	      <option value="${reviewVO.rev_no}">${reviewVO.rev_no}
	     </c:forEach>   
	   </select>
	   <input type="submit" value="送出">
	   <input type="hidden" name="action" value="getOne_For_Display">
	</FORM>
	</li>

</ul>

<h3>心得管理</h3>

<ul>
  <li><a href='addReview.jsp'>Add</a> a new Review.</li>
</ul>

</body>

</html>