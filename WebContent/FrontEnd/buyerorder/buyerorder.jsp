<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.ord.model.*"%>
<%@ page import="com.ord_list.model.*"%>

<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />
<jsp:useBean id="ordSvc" scope="page" class="com.ord.model.OrdService" />

<jsp:include page="/FrontEnd/include/head.jsp"/>
<c:set var="mem_ac" value="${sessionScope.mem_ac}" scope="page"/>
<c:set var="ordVOs" value="${ordSvc.getOrdByMem_ac(mem_ac)}" scope="page"/>

<jsp:useBean id="ordVOsList" scope="page" class="java.util.ArrayList"/>
<jsp:useBean id="ordVOs1" scope="page" class="java.util.LinkedHashSet"/>
<jsp:useBean id="ordVOs2" scope="page" class="java.util.LinkedHashSet"/>
<jsp:useBean id="ordVOs3" scope="page" class="java.util.LinkedHashSet"/>
<jsp:useBean id="ordVOs4" scope="page" class="java.util.LinkedHashSet"/>


<c:forEach var="ordVO" items="${ordVOs}">
	<c:if test="${ordVO.ord_stat=='未付款'}">
		<c:set var="notShow" value="${ordVOs1.add(ordVO)}"/>
	</c:if>
	<c:if test="${ordVO.ord_stat=='已付款'||'已確認付款'}">
		<c:set var="notShow" value="${ordVOs2.add(ordVO)}"/>

	</c:if>
	<c:if test="${ordVO.ord_stat=='已出貨'}">
		<c:set var="notShow" value="${ordVOs3.add(ordVO)}"/>
	</c:if>
	<c:if test="${ordVO.ord_stat=='已取消'}">
		<c:set var="notShow" value="${ordVOs4.add(ordVO)}"/>
	</c:if>
</c:forEach>
<c:set var="notShow" value="${ordVOsList.add(ordVOs1)}"/>
<c:set var="notShow" value="${ordVOsList.add(ordVOs2)}"/>
<c:set var="notShow" value="${ordVOsList.add(ordVOs3)}"/>
<c:set var="notShow" value="${ordVOsList.add(ordVOs4)}"/>

<!--  --------------------------------------------------------------結帳跳窗---------------------------------------------------------------->


    <div class="modal fade" id="modal-pay">
        <div class="modal-dialog modal-lg">
            <div class="modal-content scrollbar-macosx" id="modalP">

				<div class="col-xs-12 col-sm-5 col-sm-push-7">
					<h4 class="bold text-info">匯款資訊</h4>
					<div class="well">
						
						匯款銀行：彰化銀行 蘆洲分行<br>
						戶名：陳建儒<br>
						銀行代碼：009 <br>
						銀行帳號：9832-51-326845-00
					</div>

				</div>
				
				<h4 class="bold text-info">信用卡付款</h4>
				<div class="input-group">
					<div class="input-group-addon">
						卡號
					</div>
					<div class="form-control padt3 card">
						<input type="text" maxlength="4" name="crdNo1" id="crdNo1" class="w20p payWay card"> -
						<input type="text" maxlength="4" name="crdNo2" id="crdNo2" class="w20p payWay card"> -
						<input type="text" maxlength="4" name="crdNo3" id="crdNo3" class="w20p payWay card"> -
						<input type="text" maxlength="4" name="crdNo4" id="crdNo4" class="w20p payWay card">
					</div>
				</div>
				<div class="input-group">
					<div class="input-group-addon">
						有效期限
					</div>
					<input type="month" name="crdVal" id="crdVal" class="form-control payWay card">
				</div>
				<div class="input-group">
					<div class="input-group-addon">
						檢核碼
					</div>
					<input type="text" maxlength="3" name="crdChk" id="crdChk" class="form-control payWay card">
				</div>


				<h4 class="bold text-info">銀行轉帳</h4>
				<div class="input-group mgt10">
					<div class="input-group-addon">
						匯款帳戶末5碼
					</div>
					<input type="text" maxlength="5" name="bankAc" id="bankAc" class="form-control payWay atm">
				</div>
                
            </div>
        </div>
    </div>
    
<script>
// bank/credit
$(document).ready(function(){
	$('.payWay').blur(function(){
		if($(this).attr('id')=='bankAc'){
			//bank
			if($('#bankAc').val()!=''){
				$('.card').attr('readonly', true);
			} else {
				$('.card').attr('readonly', false);
			}
			return;

		} else {
			//credit
			var $card = $($('input.card'));
			for(var i = 0; i<$card.length; i++){
				if($($card[i]).val()!=''){
					$('.atm').attr('readonly', true);
					return;
				}
				$('.atm').attr('readonly', false);
			}
		}
	});
});
</script>    
<!--  --------------------------------------------------------------跳窗結束---------------------------------------------------------------->





		<div class="container cart-tab-block content">
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-sm-offset-2">
					<h3 class="bold">購買清單</h3>

						<div role="tabpanel">
						    <!-- 標籤面板：標籤區 -->
						    <ul class="nav nav-tabs" role="tablist">
						        <li role="presentation" class="active w25p bold text-center">
						            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">待付款</a>
						        </li>
						        <li role="presentation"  class="w25p bold text-center">
						            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">待出貨</a>
						        </li>
						        <li role="presentation" class="w25p bold text-center">
						            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">已出貨</a>
						        </li>
						        <li role="presentation" class="w25p bold text-center">
						            <a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab">已取消</a>
						        </li>
						    </ul>
						    
							<!-- 標籤面板：內容區 -->
						    <div class="tab-content">
						    
						    <c:forEach items="${ordVOsList}" varStatus="count">
						   
						        <div role="tabpanel" class="tab-pane ${(count.count==1)?'active':''}" id="tab${count.count}">
 									<!--//////////////////////////////////////// -->
 									<c:forEach var="ordVO" items="${ordVOsList.get(count.index)}">
									<c:set var="storeVO" value="${storeSvc.getOneStore(prodSvc.getOneProd(ordSvc.getOrd_listByOrd(ordVO.ord_no).toArray()[0].prod_no).store_no)}" scope="page"/>
									
									<div class="container-floid padt10 mgt20">
										<div class="row">
											<div class="col-xs-4 col-sm-6 bold pull-left">
												<h4><a class="${storeVO.store_no}" name="${storeVO.store_no}" href='#modal-id' data-toggle="modal">
													${storeVO.store_name}
												</a></h4>
											</div>
											<div class="col-xs-8 col-sm-6 pull-right text-right">
												<small>${ordVO.ord_date}</small><br>
												<small>訂單編號：${ordVO.ord_no}</small>
											</div>
										</div>
									</div>
									<div class="container-floid ">
									<table class="table table-hover table-striped table-rwd">


										<c:set var="totalAmount" value="0"/>
										<c:forEach var="ord_listVO" items="${ordSvc.getOrd_listByOrd(ordVO.ord_no)}">
											<c:set var="prodVO" value="${prodSvc.getOneProd(ord_listVO.prod_no)}"/>
											
										<!-- ////////////////////////////// -->
										<tbody>
											<tr>
												<td  data-th="商品">
													<div class="container-floid">
										                <div class="row zidx0">
										                
										                <a class="${prodVO.prod_no}" name="${prodVO.prod_no}" href='#modal-id' data-toggle="modal">
										                  <div class="col-xs-3 col-sm-2 vam-div60">
										                    <img class="img-responsive mg-auto vam-img rd5 " src="<%=request.getContextPath()%>/prod/prodImg.do?prod_no=${prodVO.prod_no}&index=1">
										                  </div>
										                  
										                    <div class="col-xs-9 col-sm-8">
										                      <p class="inline-b bold">${prodVO.prod_name}</p>
										                      <div>
										                        <p class="inline-b bold text-info">${prodVO.bean_contry}　${prodVO.proc}　${prodVO.roast}　${prodVO.prod_wt}lb/包</p>
										                      </div>
										                    </div>
										                 </a>
										                 	<div class="col-xs-10 col-xs-offset-1 col-sm-2 col-sm-offset-0">
										                 		<span class="btn btn-xs btn-info  pull-right">給評</span>
										                 	</div>
										                 
										                </div>
										            </div>
				
												</td>
												<td data-th="數量">
													x${ord_listVO.amont}
												</td>
												<td data-th="小計">
													NT$${prodVO.prod_price*ord_listVO.amont}
												</td>												
											</tr>
										</tbody>
										<c:set var="totalAmount" value="${totalAmount+ord_listVO.amont}"/>
				
				
<script> 
//Prod View
var $modalX = $("#modalX");
var $btn = $(".${prodVO.prod_no}").click(function(){
		var prodNo =  $(".${prodVO.prod_no}").attr("name");
		var urlstr = '<%=request.getContextPath()%>/FrontEnd/prod/prodPage.jsp?prodNo='+prodNo;
		$.ajax({
			url : urlstr,
			type : 'GET',
			dataType: "html",
			async: false,
			success : function(result) {
				while($modalX.children().length > 0){
					$modalX.empty();
				}
				
				$modalX.html(result);
			},
			error : function(xhr) {
				alert('Ajax request 發生錯誤');
			}
		});
		
	});
</script> 						
										
										</c:forEach><%-- ord_listVO --%>
										
									</table>
									</div>
									<div class="container-floid cus-order-row">
										<div class="row">
											<div class="col-xs-12 col-sm-12">
												<span class="pull-left padt5 ">共${totalAmount}件商品</span>
												<span class="pull-right mgr20 ">運費：$${ordVO.send_fee}</span> <br>
												<span class="pull-right mgr20 ">訂單金額：<h4 class="inline-b bold text-danger">$${ordVO.total_pay}</h4></span>
											
											</div>
										</div>
									</div>
									
<script>
var $modalX = $("#modalX");

var $btn = $(".${storeVO.store_no}").click(function(){
		var storeNo =  $(".${storeVO.store_no}").attr("name");
		var urlstr = '<%=request.getContextPath()%>/FrontEnd/store/storePage.jsp?storeNo='+ storeNo;
		$.ajax({
			url : urlstr,
			type : 'GET',
			dataType: "html",
			async: false,
			success : function(result) {
				while($modalX.children().length > 0){
					$modalX.empty();
				}
				$modalX.html(result);
			},
			error : function(xhr) {
				alert('Ajax request 發生錯誤');
			}
		});
	});
</script>									

									</c:forEach><%-- ordVO --%>
		
								</div>
							</c:forEach><%-- ordVOsList 1 2 3 4--%>
					
						    </div>
						</div>
			
					</div>
		        </div>
		    </div>
		    

					   



<jsp:include page="/FrontEnd/include/footer.jsp"/>