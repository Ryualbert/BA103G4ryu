<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.cart_list.model.*"%>

<jsp:useBean id="cart_listSvc" scope="page" class="com.cart_list.model.Cart_listService" />
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
<jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />

<jsp:include page="/FrontEnd/include/head.jsp"/>
<c:set var="mem_ac" value="${sessionScope.mem_ac}" scope="page"/>

<%
	Set<StoreVO> storeSet= new LinkedHashSet<StoreVO>();
	String mem_ac = (String) pageContext.getAttribute("mem_ac");
	Set<Cart_listVO> cart_listSet = cart_listSvc.getVOsByMem(mem_ac);
	for(Cart_listVO cart_listVO : cart_listSet){
		String store_no = prodSvc.getOneProd((cart_listVO.getProd_no())).getStore_no();
		storeSet.add(storeSvc.getOneStore(store_no));
	}
	pageContext.setAttribute("storeSet",storeSet);
%>


<div class="container cart-tab-block content">
	<div class="row">
		<div class="col-xs-12 col-sm-8 col-sm-offset-2">
			<h3 class="bold">購物車</h3>
			
			<div role="tabpanel">
			    <!-- 標籤面板：標籤區 -->
			    <ul class="nav nav-tabs " role="tablist">
			    	<c:forEach var="storeVO" items="${storeSet}" varStatus="s">
				        <li role="presentation" class="${(s.index==0)? 'active':''} text-center bold">
				            <a href="#tab${storeVO.store_no}" aria-controls="tab${storeVO.store_no}" role="tab" data-toggle="tab">${storeVO.store_name}</a>
				        </li>
			        </c:forEach>
			    </ul>
			
			    <!-- 標籤面板：內容區 -->
			    <div class="tab-content cus-tab-content">


					<c:forEach var="storeVO" items="${storeSet}" varStatus="s">
			    	<!-- ///////////////////////////////////////////-->
			        <div role="tabpanel" class="tab-pane ${(s.index==0)? 'active':''}" id="tab${storeVO.store_no}">
						<div class="container-floid">
							<div class="row">

								<form method="post" action="/cart_list/cart_list.do">
								<table class="table table-hover table-striped table-rwd">

									
									<thead>
										<tr class="tr-only-hide">
											
											<th>商品</th>
											<th class="w50">單價</th>
											<th >數量</th>
											<th class="w90">總計</th>
											<th class="w50">操作</th>
										</tr>
									</thead>

									<c:forEach var="cart_listVO" items="${cart_listSvc.getVOsByMem(mem_ac)}">
									
									<c:if test="${prodSvc.getOneProd(cart_listVO.prod_no).store_no==storeVO.store_no}">
									<c:set var="prodVO" value="${prodSvc.getOneProd(cart_listVO.prod_no)}"/>
		
									<!-- ////////////////////////////// -->
									<tbody>
										<tr>
											<td  data-th="商品">
												<div class="container-floid">
									                <div class="row zidx0">
									                <a id="${prodVO.prod_no}" href='#modal-id' data-toggle="modal">
									                  
									                  <div class="col-xs-10 col-xs-offset-1 col-sm-2 col-sm-offset-0 vam-div60">
									                    <img class="img-responsive mg-auto vam-img rd5 " src="<%=request.getContextPath()%>/prod/prodImg.do?prod_no=${prodVO.prod_no}&index=1">
									                  </div>
									                  
									                    <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-0">                  
									                      <p class="inline-b bold">${prodVO.prod_name}</p>
									                      <div>
									                        <p class="inline-b bold text-info">${prodVO.bean_contry}　${prodVO.proc}　${prodVO.roast}　${prodVO.prod_wt}lb/包</p>
									                      </div>
									                    </div>
									                    
									                  </a>
									                </div>
									            </div>

											</td>
											<td data-th="單價">
												NT$<span class="price${storeVO.store_no}" price="${prodVO.prod_price}">${prodVO.prod_price}<span>
											</td>
											<td data-th="數量">
												<div class="container-floid inline-b w100">
													<div class="row">									
														<div class="col-xs-12 col-sm-12">
			                                            <span id="sub${cart_listVO.prod_no}" class="glyphicon glyphicon-minus btn btn-default btn-xs btn-danger" aria-hidden="true"></span>
			                                            <input id="amount${prodVO.prod_no}" class="amount${storeVO.store_no} btn btn-xs w35" type="text" maxlength="2" value="${cart_listVO.prod_amount}">
			                                            <span id="add${cart_listVO.prod_no}" class="glyphicon glyphicon-plus  btn btn-default btn-xs btn-danger" aria-hidden="true"></span>

														</div>
													</div>
												</div>

											</td>

											<td data-th="總計">			
												NT$<span class="subtotal${storeVO.store_no}"></span>
											</td>
											<td data-th="操作">
												刪除
											</td>
										</tr>

									</tbody>
									
									<c:set var="send_fee" value="${(send_fee==null||prodVO.send_fee>send_fee)?prodVO.send_fee:send_fee}"/>


<script> //prod
$("#add${cart_listVO.prod_no}").on("click", function(){
	var $amont = Number($("#amount${prodVO.prod_no}").val());
    if($amont==NaN||$amont<0){
        $amont = 1;
    } else {
        $amont++;
    }
    $("#amount${prodVO.prod_no}").val($amont);
    calTotal${storeVO.store_no}();
});
$("#sub${cart_listVO.prod_no}").on("click", function(){
    var $amont = Number($("#amount${prodVO.prod_no}").val());
    if($amont==NaN||$amont<=0){
        $amont = 0;
    } else {
        $amont--;
    }
    $("#amount${prodVO.prod_no}").val($amont);
    calTotal${storeVO.store_no}();
});
$("#amount${prodVO.prod_no}").blur(function(){
	if(isNaN(Number($("#amount${prodVO.prod_no}").val()))){
		$("#amount${prodVO.prod_no}").val(1);
	}
	calTotal${storeVO.store_no}();
});
		
		
		
var $modalX = $("#modalX");
var $btn = $("#${prodVO.prod_no}").click(function(){
		var prodNo =  $("#${prodVO.prod_no}").attr("id");
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
									</c:if>
									</c:forEach>


								</table>


								<div class="container-floid">
									<div class="row">
										<div class="col-xs-12 col-sm-12">
											<span class="pull-left padt5 padl5">共<span id="totalAmount${storeVO.store_no}"></span>件商品</span>
											<input type="submit" name="" value="訂購" class="btn pull-right btn-info mgr20">
											<span class="pull-right mgr20">總金額共 <h4 class="inline-b text-danger">$<span id="totalCost${storeVO.store_no}"></span></h4></span>
											<span class="pull-right mgr20">運費：$<span id="sendFee${storeVO.store_no}" sendFee="${send_fee}"></span><br><small>滿$<span id="freeShip${storeVO.store_no}" freeShip="${storeVO.store_free_ship}">${storeVO.store_free_ship}</span>免運費</small></span>
											<c:remove var="send_fee" />
										</div>
									</div>
								</div>

								</from>
							</div>
						</div>

			        </div>
			        
<script>//store

function calTotal${storeVO.store_no} (){
	var $price = $($('.price${storeVO.store_no}'))
	var $amount = $($('.amount${storeVO.store_no}'));
	var $subtotal = $($('.subtotal${storeVO.store_no}'));
	var $sendFee = $('#sendFee${storeVO.store_no}').attr('sendFee');
	var $freeShip = $('#freeShip${storeVO.store_no}').attr('freeShip');
	
	var $totalAmount = 0;
	var $totalCost = 0;

	for(var i = 0; i<$price.length;i++){
		
		var subtotal = $($price[i]).attr('price')*$($amount[i]).val();
		$($subtotal[i]).text(subtotal);
		
		$totalAmount += Number($($amount[i]).val());
		$totalCost += subtotal;
	}
	
	if($totalCost>=$freeShip){
		$sendFee = 0;
		$('#sendFee${storeVO.store_no}').text($sendFee);
	} else {
		$('#sendFee${storeVO.store_no}').text($('#sendFee${storeVO.store_no}').attr('sendFee'));
	}
	
	$('#totalAmount${storeVO.store_no}').text($totalAmount);
	$('#totalCost${storeVO.store_no}').text(($totalAmount==0)? 0 : $totalCost+Number($sendFee));
}
$(document).ready(function(){
	calTotal${storeVO.store_no}();
});
</script>

					</c:forEach>











						</div>
			        </div>
			    </div>
			</div>
		</div>
		
<script> //page
$('#modal-id').on('hide.bs.modal', function (e) {
	$modalX.scrollTop(0);
	return;
});

$('#modal-id').on('hidden.bs.modal', function (e) {
	if(isAdd){
		location.reload();
	}
	$modalX.scrollTop(0);
	return;
});
</script>


<jsp:include page="/FrontEnd/include/footer.jsp"/>