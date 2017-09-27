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

<jsp:useBean id="ordVOs1" scope="page" class="java.util.LinkedHashSet"/>
<jsp:useBean id="ordVOs2" scope="page" class="java.util.LinkedHashSet"/>
<jsp:useBean id="ordVOs3" scope="page" class="java.util.LinkedHashSet"/>
<jsp:useBean id="ordVOs0" scope="page" class="java.util.LinkedHashSet"/>


<c:forEach var="ordVO" items="${ordVOs}">
	<c:if test="${ordVO.ord_stat=='待付款'}">
		<c:set var="ordVOs1" value="${ordVOs1.add(ordVO)}"/>
		${ordVOs1}22
	</c:if>
	<c:if test="${ordVO.ord_stat=='已付款'||'已確認付款'}">
		<c:set var="ordVOs2" value="${ordVOs2.add(ordVO)}"/>
		${ordVOs2}33
		<div>${ordVOs0}11</div>
	</c:if>
	<c:if test="${ordVO.ord_stat=='已出貨'}">
		<c:set var="ordVOs3" value="${ordVOs3.add(ordVO)}"/>
		${ordVOs3}44
		<div>${ordVOs0}11</div>
	</c:if>
	<c:if test="${ordVO.ord_stat=='已取消'}">
		<c:set var="ordVOs0" value="${ordVOs0.add(ordVO)}"/>
		<div>${ordVOs0}11</div>
	</c:if>
</c:forEach>






		<div class="container cart-tab-block content">
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-sm-offset-2">
					<h3 class="bold">購買清單${ordVOs2}</h3>

						<div role="tabpanel">
						    <!-- 標籤面板：標籤區 -->
						    <ul class="nav nav-tabs" role="tablist">
						        <li role="presentation" class="active w25p text-center">
						            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">待付款</a>
						        </li>
						        <li role="presentation"  class="w25p text-center">
						            <a href="#tab2" aria-controls="tab2" role="tab" data-toggle="tab">待出貨</a>
						        </li>
						        <li role="presentation" class="w25p text-center">
						            <a href="#tab3" aria-controls="tab3" role="tab" data-toggle="tab">已出貨</a>
						        </li>
						        <li role="presentation" class="w25p text-center">
						            <a href="#tab4" aria-controls="tab4" role="tab" data-toggle="tab">已取消</a>
						        </li>
						    </ul>
						
						    <!-- 標籤面板：內容區 -->
						    <div class="tab-content">
						        <div role="tabpanel" class="tab-pane active" id="tab1">
<!-- 									//////////////////////////////////////// -->
									<table class="table table-hover table-striped table-rwd">
				
				
										<thead>
											<tr class="tr-only-hide">
												<th>商品${ordVOs.get(0).ord_stat}</th>
												<th class="w50">單價</th>
												<th class="w50">數量</th>
											</tr>
										</thead>
										
										<c:set var="totalAmount" value="0"/>
										<c:forEach var="ord_listVO" items="${ord_listVOs}">
										<c:set var="prodVO" value="${prodSvc.getOneProd(ord_listVO.prod_no)}"/>
										<c:set var="storeVO" value="${storeSvc.getOneStore(prodVO.store_no)}" scope="page"/>
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
													NT$${prodVO.prod_price}
												</td>
												<td data-th="數量">
													${ord_listVO.amont}
												</td>
											</tr>
										</tbody>
										<c:set var="totalAmount" value="${totalAmount+ord_listVO.amont}"/>
				
				
				<script> 
				//Prod View
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
										
										</c:forEach>
										
									</table>
				
				
									<div class="container-floid">
										<div class="row">
											<div class="col-xs-12 col-sm-12">
												<span class="pull-left padt5 ">共${totalAmount}件商品</span>
												<span class="pull-right mgr20 ">總金額共 <h4 class="inline-b text-danger">$${ordVO.total_pay}</h4></span>
												<span class="pull-right mgr20 ">運費：$${ordVO.send_fee} <br><small>滿$${storeVO.store_free_ship}免運費</small></span>
											</div>
										</div>
									</div>

		
								</div>
								
								
								
						        <div role="tabpanel" class="tab-pane" id="tab2">
								
								</div>
						        <div role="tabpanel" class="tab-pane" id="tab3">
								
								</div>
						        <div role="tabpanel" class="tab-pane" id="tab4">
						        
								</div>
						    </div>
						</div>














									
								</div>
					        </div>
					    </div>



<jsp:include page="/FrontEnd/include/footer.jsp"/>