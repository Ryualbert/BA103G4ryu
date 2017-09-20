<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.prod.model.*"%>
<%@ page import="com.store.model.*"%>
<%@ page import="com.fo_prod.model.*"%>
<%@ page import="com.review.model.*"%>
<%@ page import="com.like_rev.model.*"%>
<%@ page import="com.qa.model.*"%>






<!DOCTYPE html>
<html lang="">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>BeanLife</title>
    <link rel="Shortcut Icon" type="image/x-icon" href="<%=request.getContextPath()%>/FrontEnd/res/img/logo/BeanLifeIco2.ico" />

    <!--[if lt IE 9]>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/FrontEnd/res/plugin/jquery.scrollbar.css">

    <link rel="stylesheet" href="<%=request.getContextPath()%>/FrontEnd/res/css/beanlife.base.css">
    
    
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/FrontEnd/res/plugin/jquery.scrollbar.js"></script>


<script>

//func bar toogle
var scrollPos = 0;
window.onscroll = function() {myFunction()};

function myFunction() {
  if (document.body.scrollTop < 1) {
    $("#funcbar").stop(true);
        $("#funcbar").slideDown("300");
        scrollPos = document.body.scrollTop;
        return;
  }
    if ((document.body.scrollTop-scrollPos) >= 0) {
      $("#funcbar").stop(true);
        $("#funcbar").slideUp("300");
        scrollPos = document.body.scrollTop;
    } else {
      $("#funcbar").stop(true);
        $("#funcbar").slideDown("300");
        scrollPos = document.body.scrollTop;
    }
}

//odd row change side
$(document).ready(function(){
  $('.row.mgb30.mgt20:odd').children('div:first-child').addClass('col-sm-push-6')
  $('.row.mgb30.mgt20:odd').children('div:last-child').addClass('col-sm-pull-6')
});

// scrollbar
jQuery(document).ready(function(){
    jQuery('.scrollbar-macosx').scrollbar();
});

//
// $(document).ready(function () {
// 	 $("a[href='#prod${param.prodNo}']").click();
// // });
</script>



  </head>
  <body>

    <!-- NavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbarNavbar -->
    <nav class="navbar navbar-default navbar-fixed-top bg-light-brn border0 cus-nav" role="navigation">
      <div class="container">
        <div>
          <button type="button" class="navbar-toggle pull-left cus-ham" data-toggle="collapse" data-target=".navbar-ex1-collapse">
            <span class="sr-only">選單切換</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>


          <div class="pull-left">
            <a href="<%=request.getContextPath()%>/FrontEnd/index/index.jsp">
              <img class="w50 padt5 padb2 mgr20" src="<%=request.getContextPath()%>/FrontEnd/res/img/BeanLifeLogoR.png">
            </a>
          </div>
          
          <div class="pull-right padt5">
            <div class="dropdown pull-right">
                      <a class="navbar-brand dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-shopping-cart"></span>
                        <span class="badge cus-badge">5</span>
                      </a>
                      <ul class="dropdown-menu zidx5">
                    <li><a href="#">咖啡</a></li>
                    <li role="presentation" class="divider"></li>
                    <li><a href="#">清單</a></li>
                    <li><a href="#">清單</a></li>
                    <li role="presentation" class="divider"></li>
                    <li><a href="#">清單</a></li>
                    <li><a href="#">清單</a></li>
                    <li><a href="#">清單</a></li>
                  </ul>
                    </div>

                    <div class="dropdown pull-right">
                      <a class="navbar-brand dropdown-toggle" data-toggle="dropdown" href="#">
                        <span class="glyphicon glyphicon-user"></span>
                      </a>
                      <ul class="dropdown-menu zidx5">
                    <li><a href="#">店家資訊</a></li>
                    <li><a href="#">商品管理</a></li>
                    <li><a href="#">訂單管理</a></li>
                    <li role="presentation" class="divider"></li>
                    <li><a href="#">個人資料</a></li>
                    <li><a href="#">訂單查詢</a></li>
                    <li><a href="#">我的收藏</a></li>
                    <li><a href="#">個人文章</a></li>
                    <li><a href="#">個人活動</a></li>
                    <li><a href="#">積分兌換</a></li>
                  </ul>
                    </div>
                </div>
        </div>


        <div class="h-block-depn-nav"></div>

        <!-- 手機隱藏選單區 -->
        <div class="collapse navbar-collapse navbar-ex1-collapse">
          <!-- 左選單 -->
          <ul class="nav navbar-nav">
            <li><a class="padt20 padb17" href="<%=request.getContextPath()%>/FrontEnd/shop/shop.jsp">找豆</a></li>
            <li><a class="padt20 padb17" href="<%=request.getContextPath()%>/FrontEnd/forum/forum.jsp">討論板</a></li>
            <li><a class="padt20 padb17" href="<%=request.getContextPath()%>/FrontEnd/activity/activity.jsp">辦活動</a></li>
            <li><a class="padt20 padb17" href="#">地圖</a></li>
          </ul>
        </div>
        <!-- 手機隱藏選單區結束 -->
      </div>
    </nav>

<!-- --------------------------------------NAV尾NAV尾NAV尾NAV尾NAV尾----------FUNC BAR開頭--------------------------------------------- -->















    <!-- funcbar -->
    <nav id="funcbar" class="navbar navbar-default navbar-fixed-top mgt-depn-nav func-h zidx1 bg-light-brn" role="navigation">
      <div class="container padt8">
        <div class="col-xs-12 col-sm-2 col-sm-offset-1">
          <select class="form-control">
            <option>請選擇產地</option>
                <option>巴西</option>
                <option>越南</option>
                <option>台灣</option>
                <option>爪哇</option>
                <option>越南</option>
                <option>台灣</option>
                <option>爪哇</option>
            </select>
        </div>
        <div class="col-xs-12 col-sm-2">
          <select class="form-control">
            <option>請選擇處理法</option>
                <option>日曬  </option>
                <option>半水洗</option>
                <option>水洗</option>
                <option>蜜處理</option>
            </select>
        </div>
        <div class="col-xs-12 col-sm-2 padt8">
          <input type="range" name="points" min="0" max="7">
        </div>
        <div class="col-xs-12 col-sm-4">
          <form>
           <div class="input-group">
             <input type="text" class="form-control" placeholder="Search">
             <div class="input-group-btn">
               <button class="btn btn-default" type="submit">
                 <i class="glyphicon glyphicon-search"></i>
               </button>
             </div>
           </div>
          </form>
        </div>
      </div>
    </nav>














    <!-- -------------------------------------------------------廣告 ------------------------------>
    <div class="container mgt120 mgb30">
      <div class="row">
        <div class="col-xs-12 col-sm-10 col-sm-offset-1">
          <div id="ad-cas" class="carousel slide" data-ride="carousel">
              <!-- 幻燈片主圖區 -->
              <div class="carousel-inner">
                  <div class="item active">
                      <img src="<%=request.getContextPath()%>/FrontEnd/res/img/ad1.png" alt="ad_pic1">
                  </div>
                  <div class="item">
                      <img src="<%=request.getContextPath()%>/FrontEnd/res/img/ad2.png" alt="ad_pic2">
                  </div>
                  <div class="item">
                      <img src="<%=request.getContextPath()%>/FrontEnd/res/img/ad3.png" alt="ad_pic3">
                  </div>
              </div>
              <!-- 上下頁控制區 -->
              <a class="left carousel-control" href="#ad-cas" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
              <a class="right carousel-control" href="#ad-cas" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
          </div>
        </div>
      </div>
    </div>







<!--  --------------------------------------------------------------商品跳窗---------------------------------------------------------------->





    <div class="modal" id="modal-id">
        <div class="modal-dialog modal-lg">
            <div class="modal-content fix-h scrollbar-macosx" id="modalX">

<!-- 				這邊是跳窗塞內容 -->
                
            </div>
        </div>
    </div>
    
<!--  --------------------------------------------------------------跳窗結束---------------------------------------------------------------->











    <!--CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC-->
    <jsp:useBean id="prodSvc" scope="page" class="com.prod.model.ProdService" />
    <jsp:useBean id="fo_prodSvc" scope="page" class="com.fo_prod.model.Fo_prodService" />
    <jsp:useBean id="reviewSvc" scope="page" class="com.review.model.ReviewService" />
    <jsp:useBean id="storeSvc" scope="page" class="com.store.model.StoreService" />
    <jsp:useBean id="like_revSvc" scope="page" class="com.like_rev.model.Like_revService" />
    <jsp:useBean id="qaSvc" scope="page" class="com.qa.model.QaService" />
    
    <c:set var="mem_ac" value="mrbrown" scope="page"/>
    <c:set var="prodlist" value="${prodSvc.all}" scope="page"/>
    <c:set var="fo_list" value="${fo_prodSvc.getAllByMem(mem_ac)}" scope="page"/>
    <c:set var="like_rev_list" value="${like_revSvc.getAllByMem(mem_ac)}" scope="page"/>

    
	<% //***************************改成useBean的寫法**************
// 		pageContext.setAttribute("mem_ac", "mrbrown");
	
// 		ProdService prodSvc = new ProdService();
// 		List<ProdVO> prodlist = prodSvc.getAll();
// 		pageContext.setAttribute("prodlist",prodlist);
		
	
// 		Fo_prodService fo_prodSvc = new Fo_prodService();
// 		pageContext.setAttribute("fo_prodSvc",fo_prodSvc);
// 		List<Fo_prodVO> fo_list = fo_prodSvc.getAllByMem((String)pageContext.getAttribute("mem_ac"));
	
// 		ReviewService reviewSvc = new ReviewService();
// 		pageContext.setAttribute("reviewSvc",reviewSvc);
		
// 		StoreService storeSvc = new StoreService();
// 		pageContext.setAttribute("storeSvc",storeSvc);
		
// 		Like_revService like_revSvc = new Like_revService();
// 		pageContext.setAttribute("like_revSvc",like_revSvc);
// 		List<Like_revVO> like_rev_list = like_revSvc.getAllByMem((String)pageContext.getAttribute("mem_ac"));
	%>

    <div class="container">
      <div class="row ">

        <div class="col-xs-12 col-sm-8 col-sm-offset-2 mgb30">
          <div class="container-floid">
            <div class="row">
              <div class="col-xs-12 col-sm-12">
                <div class="pull-left inline-b">
                  <h4 class="text-danger">找到${prodlist.size()}項商品</h4>
                </div>
                <div class="pull-right inline-b">
                  <select class="form-control ">
                        <option>排序依評價</option>
                        <option>排序依熱門</option>
                        <option>排序依日期</option>
                    </select>
                </div>
              </div>
            </div>
          </div>

          <div class="container-floid">



            <!-- ------------------商品陳列結果---------------- -->

    			<c:forEach var="prodVO" items="${prodlist}" varStatus="p_index">
    			<%
		    		String prod_no = ((ProdVO)pageContext.getAttribute("prodVO")).getProd_no();
		    		//此會員對此商品是否Follow的Boolean
		           	Boolean isFollow = false;
		           	List<Fo_prodVO> fo_list = (List<Fo_prodVO>)pageContext.getAttribute("fo_list");
		           	for (Fo_prodVO fo_prodVO: fo_list){
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
				
                <div class="row cus-prod-row zidx0">
                  <div class="col-xs-12 col-sm-2 vam-div150">
                    <img class="img-responsive mg-auto vam-img  rd10" src="<%=request.getContextPath()%>/prod/prodImg.do?prod_no=${prodVO.prod_no}&index=1">
                  </div>
                  <a id="${prodVO.prod_no}" href='#modal-id' data-toggle="modal">
                    <div class="col-xs-12 col-sm-10">
                      <h4 class="inline-b bold">${prodVO.prod_name}</h4><small class="inline-b pull-right">${prodVO.ed_time}</small>
                      <div>
                        <h5 class="inline-b bold text-info">NT$ ${prodVO.prod_price}　${prodVO.bean_contry}　${prodVO.proc}　${prodVO.roast}　${storeSvc.getonestore(prodVO.store_no).store_name}</h5>
                        <button type="button" class="btn btn-default btn-sm inline-b pull-right zidx5 ${(isFollow)?'bor-info':''}" aria-label="Left Align">
                            <span class="${(isFollow)?'text-info':'tx-gray'}">${fo_prodSvc.getCountByProd(prodVO.prod_no)}</span>
                            <span class="glyphicon glyphicon-bookmark ${(isFollow)?'text-info':'tx-gray'}" aria-hidden="true"></span>
                        </button>
                        <div class="pull-right mgr20" title="${reviewSvc.getScoreByProd(prodVO.prod_no)}/5.0">
                       		<span class="glyphicon glyphicon-star ${(star['0'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
				            <span class="glyphicon glyphicon-star ${(star['1'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
				            <span class="glyphicon glyphicon-star ${(star['2'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
				            <span class="glyphicon glyphicon-star ${(star['3'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
				            <span class="glyphicon glyphicon-star ${(star['4'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>                   
                            <span>(${reviewSvc.getCountByProd(prodVO.prod_no)})</span>
                        </div>
                      </div>
                      <p>${fn:substring(prodVO.prod_cont,0,120)} ${(prodVO.prod_cont.length() >120)? '...' : ''}</p>
                    </div>
                  </a>
                </div>
                
                
<script>
var $modalX = $("#modalX");

var $btn = $("#${prodVO.prod_no}").click(function(){
	var prodNo =  $("#${prodVO.prod_no}").attr("id");
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





<!-- ----------------------------------------------FOOTER--------------------------------------------------------- -->


    
    <div class="footer">
      <div class="container text-center">
        <div class="row">
          <div class="col-xs-12 col-sm-1 col-sm-offset-4">
            <a href="#">服務條款</a>
          </div>
          <div class="col-xs-12 col-sm-1">
            <a href="#">常見問題</a>
          </div>
          <div class="col-xs-12 col-sm-1">
            <a href="#">聯絡我們</a>
          </div>
          <div class="col-xs-12 col-sm-1">
            <a href="#">商業合作</a>
          </div>
        </div>
        <div class="col-xs-12 col-sm-12">
          <h5 class="small">COPYRIGHT (C) 2017 BeanLife, Inc. ALL RIGHTS RESERVED.</h5>
        </div>
      </div>
    </div>






  </body>
</html>