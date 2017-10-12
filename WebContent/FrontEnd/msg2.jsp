<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.msg.model.*"%>

<jsp:useBean id="msgSvc" scope="page" class="com.msg.model.MsgService" />

<jsp:include page="/FrontEnd/include/head.jsp"/>
<c:set var="mem_ac" value="mamabeak" scope="page"/>


	<span class="mgt60 msgTo" id="newboston">newboston</span>
	<span class="msgTo" id="count123">count123</span>
	<span class="msgTo" id="mrbrown">mrbrown</span>
	我是mamabeak

<script type="text/javascript">

	$('.msgTo').click(function (){
		//check if already open
		var $urName = $(this).attr('id');
		for(var i =0 ; i <$('#msgTab li').length; i++){
			if($($('#msgTab li')[i]).children('a').attr('name') == $urName){
				return;
			}
		}
		openMsg($urName);
	});
	
	function openMsg($urName){
		//add Tab
		var $count = Number($($('#msgTab li:last')).attr('count'))+1;
		$('#msgTab').append(' <li role="presentation"  count="'+
				$count+'" id="msgTab'+$count+'"><a href="#msg'+
				$count+'" aria-controls="msg'+$count+
				'" role="tab" data-toggle="tab"  name="'+$urName+'">'+$urName+'<button id="msgClose'+$count+'" type="button" class="close msgClose" count="'+$count+'">&times;</button></a></li>');
		
		//add Tab-content
		var $content = $('.msg .tab-content');
		var urlstr = '<%=request.getContextPath()%>/FrontEnd/msgInner.jsp?myName=${mem_ac}&urName='+$urName+'&count='+$count;
		$.ajax({
			url : urlstr,
			type : 'GET',
			dataType: "html",
			async: false,
			success : function(result) {
				$content.append(result);
			},
			error : function(xhr) {
				alert('Ajax request 發生錯誤');
			}
		});
		//change active
		for(var i = 0 ; i< $count;i++){
			$('#msgTab'+i).removeClass('active');
			$('#msg'+i).removeClass('active');
		}
		$('#msgTab'+ $count).addClass('active');
		$('#msg'+$count).addClass('active');
		//scrollTop to End
		var messagesArea = $('#msg'+$count+'>div>div');
		$(messagesArea).scrollTop(messagesArea.prop('scrollHeight'));
		
		
		
		//when close do
		$('.msgClose').click(function(event){
			event.stopPropagation();
			event.stopImmediatePropagation();
			var $count = Number($(this).attr('count'));
			//check if active is true
			if($('#msgTab'+$count).hasClass('active')){
				$('#msgTab'+$count).removeClass('active');
				$('#msgTab0').addClass('active');
				$('#msg'+$count).removeClass('active');
				$('#msg0').addClass('active');
			}
			var $urname= $('#msgTab'+$count+'>a').attr('name');
			console.log($urname);
			disconnect ('${mem_ac}',$urname);
			$('#msg'+$count).remove();
			$('#msgTab'+$count).remove();
		});
	}
	

</script>

			<div class="container-fluid msg">
				<div class="row">
					<div class="col-xs-12 col-sm-4 col-sm-offset-8">	
						<div role="tabpanel">
						    <!-- 標籤面板：標籤區 -->
						    <ul class="nav nav-tabs" role="tablist" id="msgTab">
						        <li role="presentation"  class="active" count="0" id="msgTab0">
						            <a href="#msg0" aria-controls="msg0" role="tab" data-toggle="tab" name="SYS">
						            	Sys
						            </a>
						             
						        </li>
						        
						       
						       

						    </ul>
						
						    <!-- 標籤面板：內容區 -->
						    <div class="tab-content ">


						        <div role="tabpanel" class="tab-pane active" id="msg0">
									<div class="container-fluid ">
										<div id="${mem_ac}sys" class="row  fix-h30 scrollbar-macosx" index="1">
										
											<div class="container-fluid">
												<div class="row">
												
													<div class="media">
														<div class="media-left">
															<img  class="media-object round-img" src="http://fakeimg.pl/50x50/00CED1/FFF/?text=img+placeholder">
														</div>
														<div class="media-body">
															<p class="col-xs-11 col-sm-10 well">xxx.
															</p>
														</div>
													</div>

													
												</div>
											</div>
											
										</div>
									</div>
									
									<div>
										<textarea class="form-control" rows="3" placeholder="輸入私訊..." id="msgIn${mem_ac}sys" disabled></textarea>
										<span id="submit${mem_ac}sys" class="btn btn-primary btn-sm pull-right" disabled>送出</span>
									</div>
									
								</div>



<!-- ------------------------------------------------------------------------------------------------------------------------- -->

<!-- ------------------------------------------------------------------------------------------------------------------------- -->

			

						    </div>
						</div>
					</div>
				</div>
			</div>	
		
		
		
	</body>
</html>	

<style type="text/css">

	.fix-h30{
		height:30vh;
		overflow-y: auto;
		overflow-x: hidden;
	}
	.msg{
/* 		margin-top:50vh; */
		z-index: 1000; position: fixed; right: 10px; bottom: 0; width:100%;
	}
</style>


<script>

    var host = window.location.host;
    var path = window.location.pathname;
    var webCtx = path.substring(0, path.indexOf('/', 1));
    
	// var statusOutput = document.getElementById("statusOutput");
	var webSocket = [];
	function connect(myName,urName) {
		$index = $($('#'+myName+urName)).attr('index');
		// 建立 websocket 物件
		var MyPoint = "/MyEchoServer/"+myName+"/"+urName;
    	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;
		webSocket[$index] = new WebSocket(endPointURL);

		//onopen
		webSocket[$index].onopen = function(event) {
			// console.log('connect'+myName+urName);
			// updateStatus("WebSocket 成功連線");
		};

		//onmessage
		webSocket[$index].onmessage = function(event) {
			var messagesArea = $('#'+myName+urName);
	        var jsonObj = JSON.parse(event.data);
	        var message = jsonObj.userName + ": " + jsonObj.message + "\r\n";
	        if(urName=='sys' && jsonObj.userName!='sys'){
	        	if($($('#'+myName+jsonObj.userName)).length==0){
	        		openMsg(jsonObj.userName);
	        	}
	        	return false;
	        }

	        var msghtml ='';
	        if(jsonObj.userName== urName){
	        	msghtml = '<div class="container-fluid"><div class="row"><div class="media"><div class="media-left">'+
	        	'<img  class="media-object round-img w50" src="<%=request.getContextPath()%>/mem/memImg.do?memAc='+urName+'">'+
	        	'</div><div class="media-body"><p class="col-xs-11 col-sm-10 well">'+
	        				jsonObj.message+"\r\n"+
							'</p></div></div></div></div>';
	        } else if (jsonObj.userName==myName){
	        	msghtml = '<div class="container-fluid"><div class="row"><div class="media"><div class="media-body">'+
	        				'<p class="col-xs-11 col-xs-offset-1 col-sm-10 col-sm-offset-2 well">'+
	        				jsonObj.message+"\r\n"+
							'</p></div><div class="media-right">'+
							'<img class="media-object round-img w50" src="<%=request.getContextPath()%>/mem/memImg.do?memAc='+myName+'"></div></div></div></div>';
	        }
	        
	        messagesArea.append(msghtml);
	        $(messagesArea).scrollTop(messagesArea.prop('scrollHeight'));
		};

		//onclose
		webSocket[$index].onclose = function(event) {
			// updateStatus("WebSocket 已離線");
		};
	}
	
	function sendMessage(myName,urName) {
	    var userName = myName;
	    var inputMessage = $("#msgIn"+myName+urName);
	    var message = inputMessage.val().trim();
	    if (message === ""){
	        alert ("訊息請勿空白!");
	        // inputMessage.focus();
	    }else{
	    	$index = $($('#'+myName+urName)).attr('index');
	        var jsonObj = {"userName" : userName, "message" : message};
	        webSocket[$index].send(JSON.stringify(jsonObj));
	        inputMessage.val('');
	        // inputMessage.focus();
	    }
	}

	
	function disconnect (myName,urName) {
		$index = $($('#'+myName+urName)).attr('index');
		webSocket[$index].close();

	}

	
	function updateStatus(newStatus) {
		// statusOutput.innerHTML = newStatus;
	}
	

	//ready
	connect('${mem_ac}','sys');
    
</script>


