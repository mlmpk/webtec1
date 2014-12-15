package aufgabe1;

import java.io.IOException;
import java.util.Enumeration;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Login
 */

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String username = "maik";
	private String password = "asd";
	private String cookieValue = "";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// hat sich der User ausgelogged ?
		if(request.getParameter("logout") != null && request.getParameter("logout").compareTo("1") == 0){
			cookieValue = "";
		}
		
		// standardmäßig: User ausgelogged
		boolean loggedIn = false;
		
		// prüfe, ob User ein valides Cookie besitzt
		Cookie[] cookies = request.getCookies();
		if(cookies != null){
			for (Cookie c: cookies){
				if(c.getName().equals("session")){
					if(c.getValue().compareTo(cookieValue)==0){
						loggedIn = true;
						RequestDispatcher view = request.getRequestDispatcher("loggedin.html");
						view.forward(request, response);
					}
				}
			}
		}
		
		//falls nicht -> gehe zur Login Seite
		if(!loggedIn){
			RequestDispatcher view = request.getRequestDispatcher("login.html");
			view.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// akzeptiere nur login Daten
		
		Enumeration<String> names = request.getParameterNames();
		while (names.hasMoreElements()) {
			String string = (String) names.nextElement();
			System.out.println(string);
		}
		
		if(request.getParameter("username") != null && request.getParameter("username").equals(username) &&
				request.getParameter("password") != null && request.getParameter("password").equals(password)){
			
			cookieValue = UUID.randomUUID().toString();
			Cookie cookie = new Cookie("session", cookieValue);
			
			// cookie ist valide für 30 sek, wenn "eingeloggt bleiben" nicht aktiviert wurde
			if(request.getParameter("remember") != null){
				cookie.setMaxAge(30);
			}
			
			response.addCookie(cookie);
			response.sendRedirect("loggedin.html");
		}else{
			response.sendRedirect("login.html");
		}
		
		
	}

}
