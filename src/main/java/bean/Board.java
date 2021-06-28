package bean;

public class Board {
	
	private int co_seq;
	private String email;
	private String category;
	private String subject;
	private String content;
	private int readhit ;
	private String regdate ;
	
	
	
	public Board(int co_seq, String email, String category, String subject, String content, int readhit,
			String regdate) {
		super();
		this.co_seq = co_seq;
		this.email = email;
		this.category = category;
		this.subject = subject;
		this.content = content;
		this.readhit = readhit;
		this.regdate = regdate;
	}


	@Override
	public String toString() {
		return "Board [co_seq=" + co_seq + ", email=" + email + ", category=" + category + ", subject=" + subject
				+ ", content=" + content + ", readhit=" + readhit + ", regdate=" + regdate + "]";
	}
	
	
	public Board() {
		super();
	}


	public int getCo_seq() {
		return co_seq;
	}


	public void setCo_seq(int co_seq) {
		this.co_seq = co_seq;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getSubject() {
		return subject;
	}


	public void setSubject(String subject) {
		this.subject = subject;
	}


	public String getContent() {
		return content;
	}


	public void setContent(String content) {
		this.content = content;
	}


	public int getReadhit() {
		return readhit;
	}


	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}


	public String getRegdate() {
		return regdate;
	}


	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	
	
	
	

}
