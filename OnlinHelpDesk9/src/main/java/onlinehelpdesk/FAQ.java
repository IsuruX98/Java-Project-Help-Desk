package onlinehelpdesk;

public class FAQ {

	private int id;
	  private String heading;
	  private String content;
	  private String category;
	  
	  public FAQ() {
	   
	  }
	  public FAQ(String heading, String content, String category) {
	   
	   this.heading = heading;
	   this.content = content;
	   this.category = category;
	  }
	  public FAQ(int id,String heading, String content, String category) {
	   this.id=id;
	   this.heading = heading;
	   this.content = content;
	   this.category = category;
	  }
	  public int getId() {
	   return id;
	  }
	  public void setId(int id) {
	   this.id = id;
	  }
	  public String getHeading() {
	   return heading;
	  }
	  public void setHeading(String heading) {
	   this.heading = heading;
	  }
	  public String getContent() {
	   return content;
	  }
	  public void setContent(String content) {
	   this.content = content;
	  }
	  public String getCategory() {
	   return category;
	  }
	  public void setCategory(String category) {
	   this.category = category;
	  }
	
}
