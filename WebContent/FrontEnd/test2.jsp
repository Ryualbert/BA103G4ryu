<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib  prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:include page="/FrontEnd/include/head.jsp"/>

		
			<div class="container-fluid msg">
				<div class="row">
					<div class="col-xs-12 col-sm-4 col-sm-offset-8">	
						<div role="tabpanel">
						    <!-- 標籤面板：標籤區 -->
						    <ul class="nav nav-tabs" role="tablist">
						        <li role="presentation" >
						            <a href="#msg0" aria-controls="msg0" role="tab" data-toggle="tab">xxx</a>
						        </li>
						        <li role="presentation" class="active">
						            <a href="#msg1" aria-controls="msg1" role="tab" data-toggle="tab">yyy</a>
						        </li>
						        <li role="presentation">
						            <a href="#msg2" aria-controls="msg2" role="tab" data-toggle="tab">zzz</a>
						        </li>
						    </ul>
						
						    <!-- 標籤面板：內容區 -->
						    <div class="tab-content ">


						        <div role="tabpanel" class="tab-pane" id="msg0">
									<div class="container-fluid ">
										<div id="system" class="row fix-h30" index="1">
											sysy
										</div>
									</div>
								</div>

						        <div role="tabpanel" class="tab-pane active" id="msg1">
									<div class="container-fluid ">
										<div id="M001M002" class="row fix-h30" index="1">

											<div class="container-fluid">
												<div class="row">
													<div class="col-xs-12 col-sm-12 pad0">
														<div class="col-xs-2 col-sm-2 pad0">
															<img src="http://fakeimg.pl/50x50/00CED1/FFF/?text=img+placeholder">
														</div>
														<div class="col-xs-8 col-sm-8 pad0 well">
															Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
															tempor incidit esse
															cillum dolore eu fugiat nuid est laborum.
														</div>
													</div>
												</div>
											</div>
											
											<div class="container-fluid">
												<div class="row">
													<div class="col-xs-12 col-sm-12 pad0">
														<div class="col-xs-8 col-xs-offset-2 col-sm-8 col-sm-offset-2 pad0 well">
															Lorem ipsumt cupidatat non
															proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
														</div>
														<div class="col-xs-2 col-sm-2 pad0">
															<img src="http://fakeimg.pl/50x50/00CED1/FFF/?text=img+placeholder">
															
														</div>
													</div>
												</div>
											</div>
											


											
										</div>

									</div>
									<div>
										<textarea id="msgInM001M002"></textarea>
										<span id="submitM001M002" class="btn btn-primary btn-sm">送出</span>
									</div>
						        </div>


<script type="text/javascript">

$(document).ready(function(){
	connect('M001','M002');
	$('#submitM001M002').click(function(){
// 		console.log('subM001M002');
		sendMessage('M001','M002');
	});
	$('#msgInM001M002').keydown(function(e){
		if(e.keyCode == 13){
			sendMessage('M001','M002');
		}
	});
});

</script>


						        <div role="tabpanel" class="tab-pane" id="msg2">
									<div class="container-fluid ">
										<div id="M001M003" class="row fix-h30"  index="2">
										
											<div class="container-fluid">
												<div class="row">
													<div class="col-xs-12 col-sm-12">
														<div class="col-xs-4 col-sm-2">
															<img class="pull-right" src="http://fakeimg.pl/50x50/00CED1/FFF/?text=img+placeholder">
														</div>
														<div class="col-xs-8 col-sm-8 well">
															Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
															tempor incidit esse
															Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
															tempor incidit esse
															Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
															tempor incidit esse
															cillum dolore eu fugiat nuid est laborum.
														</div>
													</div>
												</div>
											</div>
										
											<div class="container-fluid">
												<div class="row">
													<div class="col-xs-12 col-sm-12">
														<div class="col-xs-8 col-sm-8 col-sm-offset-2 well">
															Lorem ipsumt cupidatat non
															proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
														</div>
														<div class="col-xs-4 col-sm-2">
															<img src="http://fakeimg.pl/50x50/00CED1/FFF/?text=img+placeholder">								
														</div>

													</div>
												</div>
											</div>


											
										</div>
									</div>
									<div>
										<textarea id="msgInM001M003"></textarea>
										<span id="submitM001M003" class="btn btn-primary btn-sm">送出</span>
									</div>
						        </div>



<script type="text/javascript">
	
$(document).ready(function(){
	connect('M001','M003');
	$('#submitM001M003').click(function(){
// 		console.log('subM001M003');
		sendMessage('M001','M003');
	});
	$('#msgInM001M003').keydown(function(e){
		if(e.keyCode == 13){
			sendMessage('M001','M003');
		}
	});
});

</script>

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
	        var msghtml = '<div class="container-fluid"><div class="row"><div class="col-xs-12 col-sm-12"><div class="col-xs-8 col-sm-8 col-sm-offset-2 well">'+
	        				jsonObj.message+'\r\n'+
							'</div><div class="col-xs-4 col-sm-2"><img src="http://fakeimg.pl/50x50/00CED1/FFF/?text=img+placeholder"></div></div></div></div>';
		        			
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