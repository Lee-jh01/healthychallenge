package bean;

public class ChallengeComment {
	private int cnum;
	private int ch_seq;
	private String email;
	private String content;
	private String regdate;
	
	public ChallengeComment() {
		// TODO Auto-generated constructor stub
	}

	public int getCnum() {
		return cnum;
	}

	public void setCnum(int cnum) {
		this.cnum = cnum;
	}

	public int getCh_seq() {
		return ch_seq;
	}

	public void setCh_seq(int ch_seq) {
		this.ch_seq = ch_seq;
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

	@Override
	public String toString() {
		return "ChallengeComment [cnum=" + cnum + ", ch_seq=" + ch_seq + ", email=" + email + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}

	public ChallengeComment(int cnum, int ch_seq, String email, String content, String regdate) {
		super();
		this.cnum = cnum;
		this.ch_seq = ch_seq;
		this.email = email;
		this.content = content;
		this.regdate = regdate;
	}
	
	
}
