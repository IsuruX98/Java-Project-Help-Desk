package onlinehelpdesk;

public class ContactUs {
	
	private int cid;
	private String cname;
	private String cemail;
	private String csubject;
	private String cmessage;
	
	public ContactUs(int cid, String cname, String cemail, String csubject, String cmessage) {
		
		this.cid = cid;
		this.cname = cname;
		this.cemail = cemail;
		this.csubject = csubject;
		this.cmessage = cmessage;
	}

	public int getCid() {
		return cid;
	}

	public String getCname() {
		return cname;
	}

	public String getCemail() {
		return cemail;
	}

	public String getCsubject() {
		return csubject;
	}

	public String getCmessage() {
		return cmessage;
	}

}
