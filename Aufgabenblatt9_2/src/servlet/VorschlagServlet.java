package servlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class VorschlagServlet
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/VorschlagServlet" })
public class VorschlagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private static ArrayList<String> cities;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public VorschlagServlet() {
 
    }

    
    @Override
    public void init() throws ServletException {
    	cities = new ArrayList<String>();
    	
    	ClassLoader classLoader = getClass().getClassLoader();
    	File file = new File(classLoader.getResource("staedte.txt").getFile());
     
    	try (Scanner scanner = new Scanner(file)) {
    		while (scanner.hasNextLine()) {
    			cities.add(scanner.nextLine());	
			}
    	}
    	catch (IOException e) {
			e.printStackTrace();
		}
    	
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String prefix = request.getParameter("prefix");
		System.out.println("---> Prefix: " + prefix);
		if(prefix != null && !prefix.equals("")){
			
			StringBuilder result = new StringBuilder();
			
			for (String city : cities) {
				if(city.toLowerCase().startsWith(prefix.toLowerCase())){
					result.append(city);
					result.append(";");
				}
			}
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(result.toString());
			
		}
		
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
