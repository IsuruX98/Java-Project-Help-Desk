package onlinehelpdesk;

public class articleDetails {

	private int id;
	private String adminID;
	private String subject;
	private String description;
	
	
	public articleDetails(int id, String adminID, String subject, String description) {
		super();
		this.id = id;
		this.adminID = adminID;
		this.subject = subject;
		this.description = description;
	}


	public int getId() {
		return id;
	}


	public String getAdminID() {
		return adminID;
	}

	public String getSubject() {
		return subject;
	}

	public String getDescription() {
		return description;
	}

	
}
