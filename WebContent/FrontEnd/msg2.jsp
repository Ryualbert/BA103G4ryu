<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.mem.model.*"%>
<%@ page import="com.msg.model.*"%>

<jsp:useBean id="msgSvc" scope="page" class="com.msg.model.MsgService" />

<jsp:include page="/FrontEnd/include/head.jsp"/>
<c:set var="mem_ac" value="mrbrown" scope="page"/>
<c:set var="urNames" value="${msgSvc.getAllPairByMem(mem_ac)}" scope="page"/>

		
			<div class="container-fluid msg">
				<div class="row">
					<div class="col-xs-12 col-sm-4 col-sm-offset-8">	
						<div role="tabpanel">
						    <!-- 標籤面板：標籤區 -->
						    <ul class="nav nav-tabs" role="tablist">
						        <li role="presentation"  class="active">
						            <a href="#msg0" aria-controls="msg0" role="tab" data-toggle="tab">System</a>
						        </li>
						        
						        <c:forEach var="urName" items="${urNames}" varStatus="s">
							        <li role="presentation">
							            <a href="#msg${s.count}" aria-controls="msg${s.count}" role="tab" data-toggle="tab">${urName}</a>
							        </li>
						        </c:forEach>
						       

						    </ul>
						
						    <!-- 標籤面板：內容區 -->
						    <div class="tab-content ">


						        <div role="tabpanel" class="tab-pane active" id="msg0">
									<div class="container-fluid ">
										<div id="system" class="row fix-h30" index="1">
										
											<div class="container-fluid">
												<div class="row">
												
													<div class="media">
														<div class="media-left">
															<img  class="media-object round-img" src="http://fakeimg.pl/50x50/00CED1/FFF/?text=img+placeholder">
														</div>
														<div class="media-body">
															<p class="col-xs-11 col-sm-10 well">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
															tempor incidit esse
															cillum dolore eu fugiat nuid est laborum.
															</p>
															
														</div>
													</div>

													
												</div>
											</div>
											
										</div>
									</div>
								</div>



<!-- ------------------------------------------------------------------------------------------------------------------------- -->

<c:forEach var="urName" items="${urNames}" varStatus="s">


						        <div role="tabpanel" class="tab-pane" id="msg${s.count}">
									<div class="container-fluid ">
										<div id="${mem_ac}${urName}" class="row fix-h30 scrollbar-macosx" index="${s.count}">
										
<c:forEach var="msgVO" items="${msgSvc.getAllByPair(mem_ac,urName)}">

											<div class="container-fluid">
												<div class="row">
												
												<c:if test="${msgVO.mem_sen==urName}">
													<div class="media">
														<div class="media-left">
															<img  class="media-object round-img w50" src="<%=request.getContextPath()%>/mem/memImg.do?memAc=${urName}">
														</div>
														<div class="media-body">
															<p class="col-xs-11 col-sm-10 well">
																${msgVO.msg_cont}
															</p>
															
														</div>
													</div>
												</c:if>
												
												<c:if test="${msgVO.mem_sen==mem_ac}">
													<div class="media">
														<div class="media-body">
															<p class="col-xs-11 col-xs-offset-1 col-sm-10 col-sm-offset-2 well">
																${msgVO.msg_cont}
															</p>
														</div>
														<div class="media-right">
															<img class="media-object round-img w50" src="<%=request.getContextPath()%>/mem/memImg.do?memAc=${mem_ac}">
														</div>
													</div>
												</c:if>

													
												</div>
											</div>
</c:forEach> <%-- msgVOs--%>

										</div>

									</div>
									<div>
										<textarea class="form-control" rows="3" placeholder="輸入私訊..." id="msgIn${mem_ac}${urName}"></textarea>
										<span id="submit${mem_ac}${urName}" class="btn btn-primary btn-sm pull-right">送出</span>
									</div>
									
						        </div>


<script type="text/javascript">

$(document).ready(function(){
	connect('${mem_ac}','${urName}');
	$('#submit${mem_ac}${urName}').click(function(){
// 		console.log('sub${mem_ac}${urName}');
		sendMessage('${mem_ac}','${urName}');
	});
	$('#msgIn${mem_ac}${urName}').keypress(function(e){
		if(e.keyCode == 13){
			sendMessage('${mem_ac}','${urName}');
		}
	});
});

</script>

</c:forEach> <%-- urNames --%>
<!-- ------------------------------------------------------------------------------------------------------------------------- -->

			

						    </div>
						</div>
					</div>
				</div>
			</div>	
		
		
		
	</body>
</html>	

<style type="text/css">
	*{
		/*outline: 1px solid red;*/
	}
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
	        console.log(msghtml);
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
    
</script>