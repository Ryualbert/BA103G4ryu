<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.fo_prod.model.*"%>
<%@ page import="com.review.model.*"%>
<%@ page import="com.like_rev.model.*"%>
<%@ page import="com.qa.model.*"%>



<!-- --------------------------------------------------店家---------------------------------------------------------------------- -->
<jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
<jsp:useBean id="fo_prodSvc" scope="page" class="com.fo_prod.model.Fo_prodService" />
<jsp:useBean id="reviewSvc" scope="page" class="com.review.model.ReviewService" />
    
<c:set var="mem_ac" value="${param.memAc}" scope="page"/>
<c:set var="storeVO" value="${storeSvc.getOneStore(param.storeNo)}" scope="page"/>
<c:set var="prodSet" value="${storeSvc.getProdsByStore(param.storeNo)}" scope="page"/>
<c:set var="fo_list" value="${fo_prodSvc.getAllByMem(mem_ac)}" scope="page"/>

<!--     <div class="modal" id="store1"> -->
<!--       <div class="modal-dialog modal-lg"> -->
<!--         <div class="modal-content fix-h scrollbar-macosx"> -->

		
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          </div>
          <div class="modal-body">

            <div class="container-floid">
              <div class="row">
                <div class="col-xs-12 col-sm-10 col-sm-offset-1">
                  
                  <div id="store-cas" class="carousel slide" data-ride="carousel">
                      <!-- 幻燈片主圖區 -->
                      <div class="carousel-inner">
                          <div class="item active">
                              <img class="img-responsive" src="<%=request.getContextPath()%>/store/storeImg.do?store_no=${storeVO.store_no}&index=1" alt="store_pic1">
                          </div>
                          <div class="item">
                              <img class="img-responsive" src="<%=request.getContextPath()%>/store/storeImg.do?store_no=${storeVO.store_no}&index=2" alt="store_pic2">
                          </div>
                          <div class ="item">
                              <img class="img-responsive" src="<%=request.getContextPath()%>/store/storeImg.do?store_no=${storeVO.store_no}&index=3" alt="store_pic3">
                          </div>
                      </div>
                      <!-- 上下頁控制區 -->
                      <a class="left carousel-control" href="#store-cas" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                      <a class="right carousel-control" href="#store-cas" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                  </div>
                    
                  

                </div>
              </div>
            </div>

            <div class="container-floid">
              <div class="row">
                <div class="col-xs-12 col-sm-5 col-sm-offset-1">
                
                
                  <h3 class="text-info bold">${storeVO.store_name}</h3>
                  <p>${storeVO.store_cont}</p>

                </div>
                <div class="col-xs-12 col-sm-5 mgt20">
                  <div class="">
                    <p>
                      地址： ${storeVO.store_add}<br>
                      電話：  ${storeVO.store_phone}<br>
                      營業時間： 10:00～18:00??
                    </p>
                    <h4 class="text-warning">全店滿$${storeVO.store_free_ship}免運費</h4>
                    <small class="pull-right">店家編號 ${storeVO.store_no}</small>
                  </div>

                  <iframe class="h300 mg-auto padt20" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14467.808603196336!2d121.18294626474378!3d24.967742558315585!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x1b5e6ee66e9fec49!2z6LOH562W5pyD5Lit5aOiIFRpYmFNZSDlnIvpmpvkurrmiY3nmbzlsZXkuK3lv4M!5e0!3m2!1szh-TW!2stw!4v1504632882091"  frameborder="0" style="border:0" allowfullscreen></iframe>

                </div>
              </div>
            </div>


            <div class="container-floid padt20">
              <div class="row">
        
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1">
   
						<c:forEach var="prodVO" items="${prodSet}">
						<%
							String prod_no = ((ProdVO)pageContext.getAttribute("prodVO")).getProd_no();
							//此會員對此商品是否Follow的Boolean
                             	Boolean isFollow = false;
                             	for (Fo_prodVO fo_prodVO: (List<Fo_prodVO>)pageContext.getAttribute("fo_list")){
                             		if(fo_prodVO.getProd_no().equals(prod_no)){	                              			
                             			isFollow = true;
                             		}
                             	}
                             	pageContext.setAttribute("isFollow",isFollow);


                             	
                             	//此商品的分數轉換星星Boolean
                             	Boolean [] star = new Boolean[5];
                             	Double score = ((ReviewService)(pageContext.getAttribute("reviewSvc"))).getScoreByProd(prod_no);
                             	long scoreLong = Math.round(score);
                             	for (int i = 0 ; i < scoreLong ; i++){
                             		star[i] = true;
                             	}
                             	pageContext.setAttribute("star",star);
                             	      	
                           %>

	                      <!-- ////////////////////////////// -->
	                      <div class="col-xs-12 col-sm-3 padt10">
	                        <a id="sp${prodVO.prod_no}" name="${prodVO.prod_no}" href='#modal-id' data-toggle="modal">
	                          
	                          <img class="img-responsive  mg-auto vam-img  rd10" src="<%=request.getContextPath()%>/prod/prodImg.do?prod_no=${prodVO.prod_no}&index=1">
	                          
	                          <h4 class="bold">${prodVO.prod_name}</h4>
	                          <p class="inline-b bold text-info">NT$ ${prodVO.prod_price}</p>
	                         
							  
	                          <button type="button" class="btn btn-default btn-xs zidx5 pull-right ${(isFollow)?'bor-info':''}" aria-label="Left Align">
	                              <span class="${(isFollow)?'text-info':'tx-gray'}">${fo_prodSvc.getCountByProd(prodVO.prod_no)}</span>
	                              <span class="glyphicon glyphicon-bookmark ${(isFollow)?'text-info':'tx-gray'}" aria-hidden="true"></span>	
	                          </button>

	                          <p class="bold">${prodVO.bean_contry}　${prodVO.proc}　${prodVO.roast}</p>

	                          <div title="${reviewSvc.getScoreByProd(prodVO.prod_no)}/5.0">
	                          	  
	                              <span class="glyphicon glyphicon-star ${(star['0'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
	                              <span class="glyphicon glyphicon-star ${(star['1'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
	                              <span class="glyphicon glyphicon-star ${(star['2'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
	                              <span class="glyphicon glyphicon-star ${(star['3'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
	                              <span class="glyphicon glyphicon-star ${(star['4'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
	                              <span>(${reviewSvc.getCountByProd(prodVO.prod_no)})</span>
	                          </div>
	                        </a>
	                      </div>
				                      
				                      
<script>
var $modalX = $("#modalX");

var $btn = $("#sp${prodVO.prod_no}").click(function(){
	var prodNo =  $("#sp${prodVO.prod_no}").attr("name");
	var urlstr = '<%=request.getContextPath()%>/FrontEnd/prod/prodPage.jsp?prodNo='+prodNo+'&memAc=${mem_ac}';
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




                    </div>
                  </div>
                </div>
          </div>

