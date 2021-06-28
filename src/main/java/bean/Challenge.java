package bean;

public class Challenge {
	
	private int ch_seq;
	
	private String email;
	
	private String cateogry;
	
	private String subject;
	
	private String content;
	
	private String start_day;
	
	private String end_day;
	
	private String message;
	
	private String count;
	
	private String c_file;

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

	public String getCateogry() {
		return cateogry;
	}

	public void setCateogry(String cateogry) {
		this.cateogry = cateogry;
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

	public String getStart_day() {
		return start_day;
	}

	public void setStart_day(String start_day) {
		this.start_day = start_day;
	}

	public String getEnd_day() {
		return end_day;
	}

	public void setEnd_day(String end_day) {
		this.end_day = end_day;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getCount() {
		return count;
	}

	public void setCount(String count) {
		this.count = count;
	}

	public String getC_file() {
		return c_file;
	}

	public void setC_file(String c_file) {
		this.c_file = c_file;
	}

	@Override
	public String toString() {
		return "Challenge [ch_seq=" + ch_seq + ", email=" + email + ", cateogry=" + cateogry + ", subject=" + subject
				+ ", content=" + content + ", start_day=" + start_day + ", end_day=" + end_day + ", message=" + message
				+ ", count=" + count + ", c_file=" + c_file + "]";
	}

	public Challenge(int ch_seq, String email, String cateogry, String subject, String content, String start_day,
			String end_day, String message, String count, String c_file) {
		super();
		this.ch_seq = ch_seq;
		this.email = email;
		this.cateogry = cateogry;
		this.subject = subject;
		this.content = content;
		this.start_day = start_day;
		this.end_day = end_day;
		this.message = message;
		this.count = count;
		this.c_file = c_file;
	}
	
	public Challenge() {
		
	}

}
