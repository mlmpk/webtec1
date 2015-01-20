package bean;


public class MyBean {

	private String name;
	
	public MyBean() {
		
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	

	public String login(){
		if(name.equals("MaikMaik")) return "success";
		return "fail";
	}

}
