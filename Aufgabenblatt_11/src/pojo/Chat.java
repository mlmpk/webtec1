package pojo;

import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnMessage;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat/{username}")
public class Chat {

	private static final Set<Chat> chats = new CopyOnWriteArraySet<Chat>() ;
	
	public Chat() {
	
	}

	@OnMessage
	private String OnMessage(String message) {
		return message;
	}
	
	
	public static Set<Chat> getChats() {
		return chats;
	}
	
	

}
