package onlinehelpdesk;

public class User {
	
	private int id;
	private String uname;
	private String uemail;
	private String umobile;
	private String upw;
	
	public User(int id, String uname, String uemail, String umobile, String upw) {
		
		this.id = id;
		this.uname = uname;
		this.uemail = uemail;
		this.umobile = umobile;
		this.upw = upw;
	}

	public int getId() {
		return id;
	}

	public String getUname() {
		return uname;
	}

	public String getUemail() {
		return uemail;
	}

	public String getUmobile() {
		return umobile;
	}

	public String getUpw() {
		return upw;
	}

}
