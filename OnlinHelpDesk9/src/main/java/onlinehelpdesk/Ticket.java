package onlinehelpdesk;

public class Ticket {

	private String ticketNo;
	  private String name;
	  private String email;
	  private String id;
	  private String contact;
	  private String subject;
	  private String description;
	  
	  public Ticket(String ticketNo, String name, String email, String id, String contact, String subject, String description) {
	    this.ticketNo = ticketNo;
	    this.name = name;
	    this.email = email;
	    this.id = id;
	    this.contact = contact;
	    this.subject = subject;
	    this.description = description;
	  }
	  
	  public String getTicketNo() {
	    return ticketNo;
	  }

	  public String getName() {
	    return name;
	  }

	  public String getEmail() {
	    return email;
	  }

	  public String getId() {
	    return id;
	  }

	  public String getContact() {
	    return contact;
	  }

	  public String getSubject() {
	    return subject;
	  }

	  public String getDescription() {
	    return description;
	  }
	
}
