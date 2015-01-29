package pojo;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/zeitgeber")
public class Zeitgeber {

	public Zeitgeber() {

	}

	@OnOpen
	public void onOpen(Session session) throws IOException {
		 System.out.println ("WebSocket geöffnet: "+session.getId());
	}

	@OnMessage
	public String echo(String message) {
		System.out.println("Nachricht vom Client: " + message);
		return "Hallo " + message + ", es ist jetzt " + getCurrentTime() + " (Server Zeit) !";
	}

	@OnError
	public void onError(Throwable t) {
		t.printStackTrace();
	}

	@OnClose
	public void onClose(Session session) {
		System.out.println("WebSocket geschlossen.");
	}

	// --- private members
	
	private String getCurrentTime() {
		
		Calendar cal = Calendar.getInstance();
    	cal.getTime();
    	SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		
		return sdf.format(cal.getTime()) ;
	}
	
	
}
