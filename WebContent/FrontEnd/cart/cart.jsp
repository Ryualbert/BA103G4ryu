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

<c:set var="mem_ac" value="amy39" scope="page"/>
<%-- <c:set var="mem_ac" value="mrbrown" scope="page"/>   --%>


<jsp:include page="/FrontEnd/include/head.jsp"/>

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
											<th class="w50">總計</th>
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
									                <div class="row cus-prod-row zidx0">
									                  <div class="col-xs-10 col-xs-offset-1 col-sm-2 col-sm-offset-0 vam-div60">
									                    <img class="img-responsive mg-auto vam-img rd5 " src="<%=request.getContextPath()%>/prod/prodImg.do?prod_no=${prodVO.prod_no}&index=1">
									                  </div>
									                  
									                    <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-0">
									                    	<a href='#prod1' data-toggle="modal">
									                      <p class="inline-b bold">${prodVO.prod_name}</p>
									                      <div>
									                        <p class="inline-b bold text-info">${prodVO.bean_contry}　${prodVO.proc}　${prodVO.roast}　${prodVO.prod_wt}lb/包</p>
									                      </div>
									                    	 </a>
									                    </div>
									                  
									                </div>
									            </div>

											</td>
											<td data-th="單價">
												NT$${prodVO.prod_price}
											</td>
											<td data-th="數量">
												<div class="container-floid inline-b w90">
													<div class="row">
														<div class="col-xs-12 col-sm-12">
			                                            <span class="glyphicon glyphicon-minus btn btn-default btn-xs btn-danger" aria-hidden="true"></span>
			                                            <input class="btn btn-xs w30" type="text" name="" value="${cart_listVO.prod_amount}">
			                                            <span class="glyphicon glyphicon-plus  btn btn-default btn-xs btn-danger" aria-hidden="true"></span>

														</div>
													</div>
												</div>

											</td>
											<td data-th="總計">
												NT$${prodVO.prod_price*cart_listVO.prod_amount}
											</td>
											<td data-th="操作">
												刪除
											</td>
										</tr>

									</tbody>
									</c:if>
									</c:forEach>


								</table>


								<div class="container-floid">
									<div class="row">
										<div class="col-xs-12 col-sm-12">
											<span class="pull-left padt5 padl5">共1111件商品</span>
											<input type="submit" name="" value="訂購" class="btn pull-right btn-info mgr20">
											<span class="pull-right mgr20">總金額共 <h4 class="inline-b text-danger">$10000</h4></span>
											<span class="pull-right mgr20">運費：$100 <br><small>滿$1000免運費</small></span>
										</div>
									</div>
								</div>

								</from>
							</div>
						</div>

			        </div>
					</c:forEach>











						</div>
			        </div>
			    </div>
			</div>
		</div>



<jsp:include page="/FrontEnd/include/footer.jsp"/>