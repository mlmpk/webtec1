package pojo;

import java.io.IOException;
import java.util.Set;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/chat/{username}")
public class Chat {

	private static final Set<Chat> chats = new CopyOnWriteArraySet<Chat>();
	private Session session;
	private String username;
	
	public Chat() {

	}

	@OnOpen
	public void onOpen(Session session, @PathParam("username") String username) throws IOException {
		System.out.println("WebSocket geöffnet: " + session.getId());
		this.session = session;
		this.username = username;

		chats.add(this);

		for (Chat chat : chats) {
			chat.session.getBasicRemote().sendText(
					"User " + username + " hat sich eingeloggt.");
		}

	}

	@OnMessage
	public void message(String message, @PathParam("username") String username) throws IOException {
		String whispherWithUser = "";
		
		if (message.startsWith("/w ")){
			
			message = message.substring(3);
			whispherWithUser = message.substring(0,message.indexOf(" "));
			message = message.substring(message.indexOf(" "));
		}
		
		for (Chat chat : chats) {
			if(!whispherWithUser.equals("")){
				if(chat.username.equals(whispherWithUser) || chat.username.equals(this.username)){
					chat.session.getBasicRemote().sendText("[private Nachricht] " + username + ": " + message);
				}
			}else{
				chat.session.getBasicRemote().sendText(username + ": " + message);
			}
		}
		

	}

	
	@OnClose
	public void close() throws IOException{
		
		chats.remove(this);
		
		for (Chat chat : chats) {
			chat.session.getBasicRemote().sendText("User " + this.username + " hat den Chat verlassen.");
		}
		
		
	}
	
	public static Set<Chat> getChats() {
		return chats;
	}

	
	
}
