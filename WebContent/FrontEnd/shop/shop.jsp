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




















    <!--CCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCCC-->
    
	<%
		/////
		pageContext.setAttribute("mem_ac", "mrbrown");
	
		ProdService prodSvc = new ProdService();
		List<ProdVO> prodlist = prodSvc.getAll();
		pageContext.setAttribute("prodlist",prodlist);
	
		Fo_prodService fo_prodSvc = new Fo_prodService();
		pageContext.setAttribute("fo_prodSvc",fo_prodSvc);
		List<Fo_prodVO> fo_list = fo_prodSvc.getAllByMem((String)pageContext.getAttribute("mem_ac"));
	
		ReviewService reviewSvc = new ReviewService();
		pageContext.setAttribute("reviewSvc",reviewSvc);
		
		StoreService stroeSvc = new StoreService();
		pageContext.setAttribute("stroeSvc",stroeSvc);
		
		Like_revService like_revSvc = new Like_revService();
		pageContext.setAttribute("like_revSvc",like_revSvc);
		List<Like_revVO> like_rev_list = like_revSvc.getAllByMem((String)pageContext.getAttribute("mem_ac"));
		
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
                    <img class="img-responsive mg-auto vam-img  rd10" src="<%=request.getContextPath()%>/index/prodImg.do?prod_no=${prodVO.prod_no}&index=1">
                  </div>
                  <a href='#prod${p_index.count}' data-toggle="modal">
                    <div class="col-xs-12 col-sm-10">
                      <h4 class="inline-b bold">${prodVO.prod_name}</h4><small class="inline-b pull-right">${prodVO.ed_time}</small>
                      <div>
                        <h5 class="inline-b bold text-info">NT$ ${prodVO.prod_price}　${prodVO.bean_contry}　${prodVO.proc}　${prodVO.roast}　${stroeSvc.getonestore(prodVO.store_no).store_name}</h5>
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
                      <p>${fn:substring(prodVO.prod_cont,0,120)} ${(prodVO.prod_cont.length()>120)? '...' : ''}</p>
                    </div>
                  </a>
                </div>
                
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










<!--  --------------------------------------------------------------商品跳窗---------------------------------------------------------------->



<c:forEach var="prodVO" items="${prodlist}" varStatus="p_index">

<%
	String prod_no = ((ProdVO)pageContext.getAttribute("prodVO")).getProd_no();
	//此會員對此商品是否Follow的Boolean
  	Boolean isFollow = false;
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

    <div class="modal" id="prod${p_index.count}">
        <div class="modal-dialog modal-lg">
            <div class="modal-content fix-h scrollbar-macosx">


                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title bold">${prodVO.prod_name}</h4>
                </div>
                <div class="modal-body">
                    <div class="container-floid">


                        <div class="row">
                            <div class="col-xs-12 col-sm-6">





                                <!-- ---------------商品圖片-------------- -->
                                <div class="container-floid">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-11 col-sm-offset-1">
                                            <div id="mod-cas-pd${p_index.count}" class="carousel slide" data-ride="carousel">
                                                <!-- 幻燈片主圖區 -->
                                                <div class="carousel-inner">
                                                    <div class="item active">
                                                        <img class="img-responsive w800" src="<%=request.getContextPath()%>/index/prodImg.do?prod_no=${prodVO.prod_no}&index=1" alt="prod_pic1">
                                                    </div>
                                                    <div class="item">
                                                        <img class="img-responsive w800" src="<%=request.getContextPath()%>/index/prodImg.do?prod_no=${prodVO.prod_no}&index=2" alt="prod_pic2">
                                                    </div>
                                                    <div class="item">
                                                        <img class="img-responsive w800" src="<%=request.getContextPath()%>/index/prodImg.do?prod_no=${prodVO.prod_no}&index=3" alt="prod_pic3">
                                                    </div>
                                                </div>
                                                <!-- 上下頁控制區 -->
                                                <a class="left carousel-control" href="#mod-cas-pd${p_index.count}" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                                                <a class="right carousel-control" href="#mod-cas-pd${p_index.count}" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="row mgt20">
                                        <div class="col-xs-12 col-sm-11 col-sm-offset-1 pointer" href="#stroe${prodVO.store_no}" data-toggle="modal">
                                            <h4 class="bold text-info">${stroeSvc.getonestore(prodVO.store_no).store_name}</h4>
                                            <p>
                                                地址： ${stroeSvc.getonestore(prodVO.store_no).store_add}<br>
                                                電話：  ${stroeSvc.getonestore(prodVO.store_no).store_phone}<br>
                                                營業時間：   10:00～18:00???
                                            </p>
                                        </div>
                                    </div>

                                </div>
                            </div>


                            <!-- ---------------商品資訊-------------- -->
                            <div class="col-xs-12 col-sm-5">
                                <div class="well">
                                    <p>
                                        <small class="pull-right">最後編輯時間<br>${prodVO.ed_time}</small>
                                        豆種：${prodVO.bean_type} <br>
                                        生豆等級：${prodVO.bean_grade}<br>
                                        <br>
                                        生產國：${prodVO.bean_contry}<br>
                                        地區：${prodVO.bean_region}<br>
                                        農場：${prodVO.bean_farm}<br>
                                        生產者：${prodVO.bean_farmer}<br>
                                        海拔：${prodVO.bean_el}m<br>
                                        <br>
                                        處理法：${prodVO.proc}<br>
                                        烘焙度：${prodVO.roast}<br>
                                        <br>
                                        <small>商品編號：${prodVO.prod_no}</small>
                                    </p>
                                </div>
                                <h4 class="text-info inline-b bold">NT$${prodVO.prod_price}　${prodVO.prod_wt} lb</h4>
                                <div class="pull-right mgt10" title="${reviewSvc.getScoreByProd(prodVO.prod_no)}/5.0">
 
	                              <span class="glyphicon glyphicon-star ${(star['0'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
	                              <span class="glyphicon glyphicon-star ${(star['1'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
	                              <span class="glyphicon glyphicon-star ${(star['2'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
	                              <span class="glyphicon glyphicon-star ${(star['3'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
	                              <span class="glyphicon glyphicon-star ${(star['4'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
	                              <span>(${reviewSvc.getCountByProd(prodVO.prod_no)})</span>    

                                </div>
                                <p>
                                    <button type="button" class="btn btn-default btn-sm zidx5 pull-right ${(isFollow)?'bor-info':''}" aria-label="Left Align">
                                        <span class="${(isFollow)?'text-info':'tx-gray'}">${fo_prodSvc.getCountByProd(prodVO.prod_no)}</span>
                                        <span class="glyphicon glyphicon-bookmark ${(isFollow)?'text-info':'tx-gray'}" aria-hidden="true"></span>
                                    </button>
                                    標價/重量：NT$${prodVO.prod_price/prodVO.prod_wt}/lb<br>
                                    運費：NT$${prodVO.send_fee}<span class="text-warning bold mgl20">滿$${stroeSvc.getonestore(prodVO.store_no).store_free_ship}免運費</span><br>
                                    供應數量：${prodVO.prod_sup}
                                </p>

                                <div class="container-floid">
                                    <div class="row">
                                        <div class="col-xs-7 col-sm-6">
                                            <span class="glyphicon glyphicon-minus btn btn-default btn-sm btn-danger" aria-hidden="true"></span>
                                            <input class="btn w45" type="text" name="" value="0">
                                            <span class="glyphicon glyphicon-plus  btn btn-default btn-sm btn-danger" aria-hidden="true"></span>

                                        </div>
                                        <div class="col-xs-5 col-sm-6">
                                            <div class="btn btn-default btn-info">加入購物車</div>

                                        </div>
                                    </div>
                                </div>


                            </div>
                        </div>



                        <div class="row mgt20">
                            <div class="col-xs-12 col-sm-6">

                                <!-- ---------------商品描述-------------- -->
                                <div class="container-floid">
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-11 col-sm-offset-1">
                                            <p>
                                               ${prodVO.prod_cont}
                                            </p>
                                        </div>
                                    </div>
                                </div>



                            </div>
                            <div class="col-xs-12 col-sm-3 col-sm-offset-1">
                                <img class="img-responsive mg-auto" src="<%=request.getContextPath()%>/FrontEnd/res/img/5.png">
                            </div>
                        </div>









                        <!-- -----------------------------------------互動區塊--------------------------------------------- -->
                        <div class="row mgt20">
                            <div class="col-xs-12 col-sm-12">
                                <div role="tabpanel">
                                    <!-- 標籤面板：標籤區 -->
                                    <ul class="nav nav-tabs " role="tablist">
                                        <li role="presentation" class="active w50p text-center">
                                            <a href="#rev_prod${p_index.count}" aria-controls="rev_prod${p_index.count}" role="tab" data-toggle="tab" class="bold">心得評論</a>
                                        </li>
                                        <li role="presentation" class="w50p text-center">
                                            <a href="#qa_prod${p_index.count}" aria-controls="qa_prod${p_index.count}" role="tab" data-toggle="tab" class="bold">問與答</a>
                                        </li>
                                    </ul>






									<%
										List<ReviewVO> reviewlist = reviewSvc.getVOByProd(prod_no);
										pageContext.setAttribute("reviewlist",reviewlist);
									%>


                                    <!-- 標籤面板：內容區 -->
                                    <div class="tab-content">
                                        <div role="tabpanel" class="tab-pane active" id="rev_prod${p_index.count}">


											<c:if test="${reviewlist.size()==0}">
												<div class="col-xs-12 col-sm-12 text-center padt10">
													<h2 class="tx-gray">目前尚無心得評論</h2>
												</div>
											</c:if>
											
                                            <c:forEach var="reviewVO" items="${reviewlist}">
                                            
                                            <div class="row cus-art-row zidx0 mgt20">
                                            
                                            	 <!-- -----------------名稱------------------- -->
                                                <div class="col-xs-6 col-sm-1 col-sm-offset-1 padr0 ">
                                                    <img class="img-responsive mg-auto vam-img round-img" src="<%=request.getContextPath()%>/FrontEnd/res/img/mem01.png">
                                                </div>
                                               
                                                <div class="col-xs-6 col-sm-2">
                                                    <span class="text-info">Java123</span>
                                                    <br>
                                                    <span>手沖達人</span>
                                                    <br>
                                                    <small>${reviewVO.rev_date}</small>
                                                </div>
                                                
                                                
                                                <!-- -----------------沖泡方式------------------- -->               
                                                <c:set var="use_way" value="${fn:split(reviewVO.use_way, ',')}" />
                                                <div class="col-xs-12 col-sm-4 col-sm-offset-1 mgt10 mg-auto">
                                                    <div class="container-floid padt10">
                                                        <div class="row">
                                                            <div class="col-xs-3 col-sm-3 text-center">
                                                                <img class="img-responsive mg-auto inline-b w45 " src="<%=request.getContextPath()%>/FrontEnd/res\img\icon\weight.png">
                                                                <small class="text-info">${use_way[0]}g</small>
                                                            </div>
                                                            <div class="col-xs-3 col-sm-3 text-center">
                                                                <img class="img-responsive mg-auto inline-b w45" src="<%=request.getContextPath()%>/FrontEnd/res\img\icon\kettle.png">
                                                                <small class="text-info">${use_way[1]}ml</small>
                                                            </div>
                                                            <div class="col-xs-3 col-sm-3 text-center">
                                                                <img class="img-responsive mg-auto inline-b w45" src="<%=request.getContextPath()%>/FrontEnd/res\img\icon\drgree.png">
                                                                <small class="text-info">${use_way[2]}C</small>
                                                            </div>
                                                            <div class="col-xs-3 col-sm-3 text-center">
                                                                <img class="img-responsive mg-auto inline-b w45" src="<%=request.getContextPath()%>/FrontEnd/res\img\icon\timer.png">
                                                                <small class="text-info"><fmt:formatNumber value="${use_way[3]/60}" maxFractionDigits="0"/>m${use_way[3]%60}s</small>
                                                                 
                                                            </div>
                                                        </div>
                                                    </div>


                                                </div>
                                                
                                                
                                                
	                                            <%
		                                            //此評論的分數轉換星星Boolean
		                                          	Boolean [] starOfRev = new Boolean[5];
		                                          	int scoreOfRev = ((ReviewVO)pageContext.getAttribute("reviewVO")).getProd_score();
		                                          	for (int i = 0 ; i < scoreOfRev ; i++){
		                                          		starOfRev[i] = true;
		                                          	}
		                                          	pageContext.setAttribute("starOfRev",starOfRev); 
		                                          	
		                                          	
		                                          	String rev_no = ((ReviewVO)pageContext.getAttribute("reviewVO")).getRev_no();
		                                        	//此會員對此Review是否Like的Boolean
		                                          	Boolean isLike = false;
		                                          	for (Like_revVO like_revVO: like_rev_list){
		                                          		if(like_revVO.getRev_no().equals(rev_no)){	                              			
		                                          			isLike = true;
		                                          		}
		                                          	}
		                                          	pageContext.setAttribute("isLike",isLike);
	                                            %>    
                                              
                                                 <!-- -----------------給分 喜歡------------------- -->
                                                <div class="col-xs-12 col-sm-2 col-sm-offset-1">

                                                    <div class="container-floid">
                                                        <div class="row">
                                                            <div class="col-xs-6 col-sm-12 padt10">
                                                                <span class="glyphicon glyphicon-star ${(starOfRev['0'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
                                                                <span class="glyphicon glyphicon-star ${(starOfRev['1'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
                                                                <span class="glyphicon glyphicon-star ${(starOfRev['2'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
                                                                <span class="glyphicon glyphicon-star ${(starOfRev['3'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
                                                                <span class="glyphicon glyphicon-star ${(starOfRev['4'])? 'tx-brn' : 'tx-gray'}" aria-hidden="true"></span>
                                                            </div>

                                                             <div class="col-xs-6 col-sm-12 padt10">
                                                             
<%--                                                               <button type="button" class="btn btn-default btn-sm inline-b pull-right zidx5 ${(isFollow)?'bor-info':''}" aria-label="Left Align"> --%>
<%-- 									                            <span class="${(isFollow)?'text-info':'tx-gray'}">${fo_prodSvc.getCountByProd(prodVO.prod_no)}</span> --%>
<%-- 									                            <span class="glyphicon glyphicon-bookmark ${(isFollow)?'text-info':'tx-gray'}" aria-hidden="true"></span> --%>
<!-- 									                        </button> -->
                                                                <button type="button" class="btn btn-default btn-xs zidx5 ${(isLike)?'bor-like':''}" aria-label="Left Align">
                                                                    <span class="${(isLike)?'tx-like':'tx-gray'}">${like_revSvc.getCountByRev(reviewVO.rev_no)}</span>
                                                                    <span class="glyphicon glyphicon-heart ${(isLike)?'tx-like':'tx-gray'}" aria-hidden="true"></span>
                                                                </button>
                                                            </div>



                                                        </div>
                                                    </div>
                                                </div>

                                                <!-- -----------------心得內文------------------- -->
                                                <div class="col-xs-12 col-sm-10 col-sm-offset-1  mgt10">
                                                    <p>${reviewVO.rev_cont}</p>
                                                </div>

                                            </div>
                                            
                                            </c:forEach>
                                            






                                        </div>
                                        <div role="tabpanel" class="tab-pane" id="qa_prod${p_index.count}">





                                            <!-- --------------------問與答---------------- -->
                                             <!-- ////////////////////////////////// -->
                                            <div class="row cus-qa-row zidx0 mgt20">
                                               
                                                <div class="col-xs-12 col-sm-9 col-sm-offset-1">
                                                    <span class="text-info">Jav****</span><small class="mgl20">(2017-09-04)</small>
                                                    <p>内存速度微微素质尴尬，导演住房初步铃声邮政编码他们的天地本地有关部门大厦电影财，作业频率不会专家总经理格式激情辽宁一段他们的首页有限责任公司，眼光进攻能不能优势上有一周西方并不好多多，细节许可制品医院整体内容，民间生活不如状态邮政编码高达正是论坛能否关键地说律师维护经，一脸这段调查资产概念要去人民政府业绩五金美国当天懂，公告调节你们的信心条款文件大小平衡成就求职，尽快出租之间一点东方广大上次博客而是商标货币还会几天他说内。</p>
                                                </div>


                                                <div class="col-xs-12 col-sm-9 col-sm-offset-2 well">
                                                    <span class="text-info">藍色小舖</span><small class="mgl20">(2017-09-06)</small>
                                                    <p>他们的经销商领导恋爱功夫链接可是青，他也很好外资还没有在这平，而是电子商务你怎么远程确保每，看过收入规则眼泪本网地说经验等人中文版高兴招聘最终印度大。</p>
                                                </div>

                                            </div>






                                             <!-- ////////////////////////////////// -->
                                            <div class="row cus-qa-row zidx0 mgt20">
                                               
                                                <div class="col-xs-12 col-sm-9 col-sm-offset-1">
                                                    <span class="text-info">Jav****</span><small class="mgl20">(2017-09-04)</small>
                                                    <p>产业老人我来这次报告长时间有意老师本论坛犯，浙江满意电力生成就要日韩降低，资源互联网之一登录半年业主交流，广大群众否则选手白色，部门福州矛盾居民默认正在大厦则是一看专区收藏究竟走势，种子部队模拟始终美女图像无人有人之中本次直接小游戏目光，观察自己的相当体力才是前来成员课程。</p>
                                                </div>


                                            </div>






                                             <!-- ////////////////////////////////// -->
                                            <div class="row cus-qa-row zidx0 mgt20">
                                               
                                                <div class="col-xs-12 col-sm-9 col-sm-offset-1">
                                                    <span class="text-info">Jav****</span><small class="mgl20">(2017-09-04)</small>
                                                    <p>考核会议制品机关难得站内地图发帖站在下载次数主体，行为可以。</p>
                                                </div>


                                                <div class="col-xs-12 col-sm-9 col-sm-offset-2 well">
                                                    <span class="text-info">藍色小舖</span><small class="mgl20">(2017-09-06)</small>
                                                    <p>夏天屏幕人事购买立场那么多选项天然放，前进安装从事此次女性而在天使创造言论只能，杭州仪器分享中文尽管。</p>
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
        </div>
    </div>

</c:forEach>


<!-- --------------------------------------------------店家---------------------------------------------------------------------- -->


    <div class="modal" id="store1">
      <div class="modal-dialog modal-lg">
        <div class="modal-content fix-h scrollbar-macosx">


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
                          <div class="item">
                              <img class="img-responsive" src="res/img/s1.jpg" alt="">
                          </div>
                          <div class="item">
                              <img class="img-responsive" src="res/img/s3.jpg" alt="">
                          </div>
                          <div class ="item active">
                              <img class="img-responsive" src="res/img/s2.jpg" alt="">
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
                  <h3 class="text-info bold">藍色小舖</h3>
                  <p>The Barn Coffee Roasters 的創辦人是 Ralf Rüller，他的第一間咖啡館創立於 2010 年的柏林，自己烘焙蛋糕、麵包，但是使用英國 Square Mile 的咖啡。兩年後，2012 年 9 月，他找到更大的空間，成立自己的咖啡烘焙坊，使用 Probat UG15 烘豆機，很快成為德國最受矚目的精品烘焙之一。

                  手工採收的櫻桃、精品等級、偏好小農場，尤其是對改善品質充滿熱情的農場，是 Barn 選擇生豆的原則，新鮮、乾淨、永續耕種、可追溯性，Barn 從產地尋找當季生豆，付給農民比公平貿易好 2 到 3 倍的價格，如果直接貿易有困難，也是從世界上最好的生豆商那裡購買小農場的咖啡，例如 Nordic Approach。

                  不論義式濃縮或手沖，The Barn 烘焙的咖啡只有單產區的豆子，他們追求的是單一莊園、農場、水洗廠或合作社的極致風味，表現在不同的酸質、甜度、水果滋味、喉韻、口感、平衡感。

                  The Barn 的義式濃縮，與平常可能喝過的濃黑焦苦的義式完全不同，水果明亮的酸質非常明顯，按不同的豆種與產地，可以嘗到不同的風味，櫻桃、杏仁、血橙、葡萄乾，不一而足。然後基底的風味例如牛奶巧克力，會慢慢留在舌底，直到消散。口感非常滑順，成為他們的標誌特色。</p>

                </div>
                <div class="col-xs-12 col-sm-5 mgt20">
                  <div class="">
                    <p>
                      地址： 高雄市鳥松區本館路72巷11-1號<br>
                      電話： 07-3707263<br>
                      營業時間： 10:00～18:00
                    </p>
                    <h4 class="text-warning">全店滿$1000免運費</h4>
                    <small class="pull-right">店家編號 S1000000001</small>
                  </div>

                  <iframe class="h300 mg-auto padt20" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14467.808603196336!2d121.18294626474378!3d24.967742558315585!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x1b5e6ee66e9fec49!2z6LOH562W5pyD5Lit5aOiIFRpYmFNZSDlnIvpmpvkurrmiY3nmbzlsZXkuK3lv4M!5e0!3m2!1szh-TW!2stw!4v1504632882091"  frameborder="0" style="border:0" allowfullscreen></iframe>

                </div>
              </div>
            </div>


            <div class="container-floid padt20">
              <div class="row">
                <div class="container-floid">
                  <div class="row">
                    <div class="col-xs-12 col-sm-10 col-sm-offset-1">

                      <!-- ////////////////////////////// -->
                      <div class="col-xs-12 col-sm-3  padt10">
                        <a href="#">
                          <img class="img-responsive  mg-auto vam-img  rd10" src="res/img/m3.png">
                          <h4 class="bold">坦尚尼亞 瑪金加 肯特</h4>
                          <p class="inline-b bold text-info">＄600/lb</p>

                          <button type="button" class="btn btn-default btn-xs zidx5 pull-right bor-info" aria-label="Left Align">
                              <span class="text-info">42</span>
                              <span class="glyphicon glyphicon-bookmark text-info" aria-hidden="true"></span>
                          </button>

                          <p class="bold">巴西　水洗　深培</p>

                          <div>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-gray" aria-hidden="true"></span>
                              <span>(51)</span>
                          </div>
                        </a>
                      </div>

      
                      <!-- ////////////////////////////// -->
                      <div class="col-xs-12 col-sm-3  padt10">
                        <a href="#">
                          <img class="img-responsive  mg-auto vam-img  rd10" src="res/img/p2.jpg">
                          <h4 class="bold">坦尚尼亞 瑪金加 肯特</h4>
                          <p class="inline-b bold text-info">＄600/lb</p>

                          <button type="button" class="btn btn-default btn-xs zidx5 pull-right bor-info" aria-label="Left Align">
                              <span class="text-info">42</span>
                              <span class="glyphicon glyphicon-bookmark text-info" aria-hidden="true"></span>
                          </button>

                          <p class="bold">巴西　水洗　深培</p>

                          <div>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-gray" aria-hidden="true"></span>
                              <span>(51)</span>
                          </div>
                        </a>
                      </div>

      
                      <!-- ////////////////////////////// -->
                      <div class="col-xs-12 col-sm-3 padt10">
                        <a href="#">
                          <img class="img-responsive  mg-auto vam-img  rd10" src="res/img/p3.jpg">
                          <h4 class="bold">坦尚尼亞 瑪金加 肯特</h4>
                          <p class="inline-b bold text-info">＄600/lb</p>

                          <button type="button" class="btn btn-default btn-xs zidx5 pull-right" aria-label="Left Align">
                              <span class="tx-gray">42</span>
                              <span class="glyphicon glyphicon-bookmark tx-gray" aria-hidden="true"></span>
                          </button>

                          <p class="bold">巴西　水洗　深培</p>

                          <div>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-gray" aria-hidden="true"></span>
                              <span>(51)</span>
                          </div>
                        </a>
                      </div>

                      <!-- ////////////////////////////// -->
                      <div class="col-xs-12 col-sm-3 padt10">
                        <a href="#">
                          <img class="img-responsive  mg-auto vam-img  rd10" src="res/img/m3.png">
                          <h4 class="bold">坦尚尼亞 瑪金加 肯特</h4>
                          <p class="inline-b bold text-info">＄600/lb</p>

                          <button type="button" class="btn btn-default btn-xs zidx5 pull-right bor-info" aria-label="Left Align">
                              <span class="text-info">42</span>
                              <span class="glyphicon glyphicon-bookmark text-info" aria-hidden="true"></span>
                          </button>

                          <p class="bold">巴西　水洗　深培</p>

                          <div>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-gray" aria-hidden="true"></span>
                              <span>(51)</span>
                          </div>
                        </a>
                      </div>

      
                      <!-- ////////////////////////////// -->
                      <div class="col-xs-12 col-sm-3 padt10">
                        <a href="#">
                          <img class="img-responsive  mg-auto vam-img  rd10" src="res/img/p2.jpg">
                          <h4 class="bold">坦尚尼亞 瑪金加 肯特</h4>
                          <p class="inline-b bold text-info">＄600/lb</p>

                          <button type="button" class="btn btn-default btn-xs zidx5 pull-right bor-info" aria-label="Left Align">
                              <span class="text-info">42</span>
                              <span class="glyphicon glyphicon-bookmark text-info" aria-hidden="true"></span>
                          </button>

                          <p class="bold">巴西　水洗　深培</p>

                          <div>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-gray" aria-hidden="true"></span>
                              <span>(51)</span>
                          </div>
                        </a>
                      </div>

      
                      <!-- ////////////////////////////// -->
                      <div class="col-xs-12 col-sm-3 padt10">
                        <a href="#">
                          <img class="img-responsive  mg-auto vam-img  rd10" src="res/img/p3.jpg">
                          <h4 class="bold">坦尚尼亞 瑪金加 肯特</h4>
                          <p class="inline-b bold text-info">＄600/lb</p>

                          <button type="button" class="btn btn-default btn-xs zidx5 pull-right" aria-label="Left Align">
                              <span class="tx-gray">42</span>
                              <span class="glyphicon glyphicon-bookmark tx-gray" aria-hidden="true"></span>
                          </button>

                          <p class="bold">巴西　水洗　深培</p>

                          <div>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-brn" aria-hidden="true"></span>
                              <span class="glyphicon glyphicon-star tx-gray" aria-hidden="true"></span>
                              <span>(51)</span>
                          </div>
                        </a>
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

</script>



  </body>
</html>