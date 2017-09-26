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

<!--CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC-->
		<div class="container cart-tab-block content">
			<div class="row">
				<div class="col-xs-12 col-sm-8 col-sm-offset-2">
					<h3 class="bold">付款填寫結帳單</h3>

					<table class="table table-hover table-striped table-rwd">


						<thead>
							<tr class="tr-only-hide">
								<th>商品</th>
								<th class="w50">單價</th>
								<th class="w50">數量</th>
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
									5

								</td>
							</tr>
						</tbody>
					</table>


					<div class="container-floid">
						<div class="row">
							<div class="col-xs-12 col-sm-12">
								<span class="pull-left padt5 ">共1111件商品</span>
								<span class="pull-right mgr20 ">總金額共 <h4 class="inline-b text-danger">$10000</h4></span>
								<span class="pull-right mgr20 ">運費：$100 <br><small>滿$1000免運費</small></span>
							</div>
						</div>
					</div>

					<div class="container-floid mgt20">
						<div class="row">
							<div class="col-xs-12 col-sm-5 col-sm-push-7">
								<h4 class="bold text-info">匯款資訊</h4>
								<div class="well">
									
									匯款銀行：彰化銀行 蘆洲分行<br>
									戶名：陳建儒<br>
									銀行代碼：009 <br>
									銀行帳號：9832-51-326845-00
								</div>

							</div>

							<div class="col-xs-12 col-sm-7 col-sm-pull-5">
								<h4 class="bold text-info">填寫收件資訊</h4>

									<form>
										<div class="input-group mgt10">
											<div class="input-group-addon">
												收件人姓名
											</div>
											<input type="text" name="name" id="" class="form-control">
										</div>


										<div class="input-group ">
											<div class="input-group-addon">
												收件人地址
											</div>
											<input type="text" name="address" id="" class="form-control">
										</div>

										<div class="input-group">
											<div class="input-group-addon">
												收件人手機
											</div>
											<input type="text" name="phone" id="" class="form-control">
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
										<input type="submit" class="btn btn-info pull-right mgt10" name="submit" value="確認">

									</form>
							</div>

						</div>
					</div>











									
								</div>
					        </div>
					    </div>



<jsp:include page="/FrontEnd/include/footer.jsp"/>