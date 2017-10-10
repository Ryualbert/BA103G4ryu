package serverEndpoint;
import java.io.*;
import java.util.*;

import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;
import javax.websocket.Session;
import javax.websocket.OnOpen;
import javax.websocket.OnMessage;
import javax.websocket.OnError;
import javax.websocket.OnClose;
import javax.websocket.CloseReason;

@ServerEndpoint("/MyEchoServer/{myName}/{myRoom}")
public class MyEchoServer {

private static final Set<Session> allSessions = Collections.synchronizedSet(new HashSet<Session>());
private static final Map<String,  Set<Session>> mapSessions = Collections.synchronizedMap(new HashMap<String, Set<Session>>());
	
	@OnOpen
	public void onOpen(@PathParam("myName") String myName, @PathParam("myRoom") String myRoom, Session userSession) throws IOException {
//		allSessions.add(userSession);
		
		if(mapSessions.get(myRoom)==null){
			Set<Session> setSessions = Collections.synchronizedSet(new HashSet<Session>());
			setSessions.add(userSession);
			mapSessions.put(myRoom, setSessions);
		}else {
			Set<Session> setSessions = mapSessions.get(myRoom);
			setSessions.add(userSession);
			mapSessions.put(myRoom, setSessions);
		}
		
		System.out.println(userSession.getId() + ": 已連線");
		System.out.println(myName + ": 已連線");
		System.out.println(myRoom + ": 房號");
//		userSession.getBasicRemote().sendText("WebSocket 連線成功");
	}

	
	@OnMessage
	public void onMessage(@PathParam("myRoom") String myRoom,Session userSession, String message) {
		for (Session session : mapSessions.get(myRoom)) {
			if (session.isOpen())
				session.getAsyncRemote().sendText(message);
		}
		System.out.println("Message received: " + message);
	}
	
	@OnError
	public void onError(Session userSession, Throwable e){
//		e.printStackTrace();
	}
	
	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		allSessions.remove(userSession);
		System.out.println(userSession.getId() + ": Disconnected: " + Integer.toString(reason.getCloseCode().getCode()));
	}

 
}
