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

<%-- <c:set var="mem_ac" value="amy39" scope="page"/> --%>
<c:set var="mem_ac" value="mrbrown" scope="page"/>  


<jsp:include page="/FrontEnd/include/head.jsp"/>

<c:forEach var="cart_listVO" items="${cart_listSvc.getVOsByMem(mem_ac)}">
	<c:forEach var="storeVO" items="${storeSvc.(prodSvc.getOneProd(cart_listVO.prod_no).store_no)}">
	</c:forEach>
</c:forEach>



<div class="container cart-tab-block content">
	<div class="row">
		<div class="col-xs-12 col-sm-8 col-sm-offset-2">
			<h3 class="bold">購物車</h3>
			<div role="tabpanel">
			    <!-- 標籤面板：標籤區 -->
			    <ul class="nav nav-tabs " role="tablist">
			    	
			        <li role="presentation" class="active text-center bold">
			            <a href="#tab1" aria-controls="tab1" role="tab" data-toggle="tab">媽媽嘴咖啡</a>
			        </li>
			        
			    </ul>
			
			    <!-- 標籤面板：內容區 -->
			    <div class="tab-content cus-tab-content">



			    	<!-- tab1111111111111111111111111111111 -->
			        <div role="tabpanel" class="tab-pane active" id="tab1">
						<div class="container-floid">
							<div class="row">

								<form method="post" action="xxxxxxxxx">
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


									<!-- ////////////////////////////// -->
									<tbody>
										<tr>
											
											<td  data-th="商品">
												<div class="container-floid">
									                <div class="row cus-prod-row zidx0">
									                  <div class="col-xs-10 col-xs-offset-1 col-sm-2 col-sm-offset-0 vam-div60">
									                    <img class="img-responsive mg-auto vam-img rd5 " src="res/img/m3.png">
									                  </div>
									                  
									                    <div class="col-xs-10 col-xs-offset-1 col-sm-10 col-sm-offset-0">
									                    	<a href='#prod1' data-toggle="modal">
									                      <p class="inline-b bold">坦尚尼亞 瑪金加 肯特</p>
									                      <div>
									                        <p class="inline-b bold text-info">巴西　水洗　深培　2lb/包</p>
									                      </div>
									                    	 </a>
									                    </div>
									                  
									                </div>
									            </div>

											</td>
											<td data-th="單價">
												NT$600
											</td>
											<td data-th="數量">
												<div class="container-floid inline-b w90">
													<div class="row">
														<div class="col-xs-12 col-sm-12">
			                                            <span class="glyphicon glyphicon-minus btn btn-default btn-xs btn-danger" aria-hidden="true"></span>
			                                            <input class="btn btn-xs w30" type="text" name="" value="10">
			                                            <span class="glyphicon glyphicon-plus  btn btn-default btn-xs btn-danger" aria-hidden="true"></span>

														</div>
													</div>
												</div>

											</td>
											<td data-th="總計">
												NT$1800
											</td>
											<td data-th="操作">
												刪除
											</td>
										</tr>

									</tbody>


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












						</div>
			        </div>
			    </div>
			</div>
		</div>
	</div>
</div>


<jsp:include page="/FrontEnd/include/footer.jsp"/>