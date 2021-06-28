package bean;

public class CoComment {
	
	private int b_cnum;
	private int co_seq;
	private String email;
	private String content;
	private String regdate;
	
	public CoComment() {
		// TODO Auto-generated constructor stub
	}

	public int getB_cnum() {
		return b_cnum;
	}

	public void setB_cnum(int b_cnum) {
		this.b_cnum = b_cnum;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public CoComment(int b_cnum, int co_seq, String email, String content, String regdate) {
		super();
		this.b_cnum = b_cnum;
		this.co_seq = co_seq;
		this.email = email;
		this.content = content;
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "CoComment [b_cnum=" + b_cnum + ", co_seq=" + co_seq + ", email=" + email + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}
	
	

}
