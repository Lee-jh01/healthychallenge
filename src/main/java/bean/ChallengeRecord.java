package bean;

public class ChallengeRecord {
	
	private int cr_seq;	//첼린지 기록 고유번호
	
    private int ch_seq;	//첼린지고유번호
    
    private String email; //이메일
	
	private String days; //일자
	
	private String checks; //인증
	
	private String subject; //일지 제목
	
	private String content; //일지 내용

	public int getCr_seq() {
		return cr_seq;
	}

	public void setCr_seq(int cr_seq) {
		this.cr_seq = cr_seq;
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

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	public String getChecks() {
		return checks;
	}

	public void setChecks(String checks) {
		this.checks = checks;
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

	@Override
	public String toString() {
		return "ChallengeRecord [cr_seq=" + cr_seq + ", ch_seq=" + ch_seq + ", email=" + email + ", days=" + days
				+ ", checks=" + checks + ", subject=" + subject + ", content=" + content + "]";
	}

	public ChallengeRecord(int cr_seq, int ch_seq, String email, String days, String checks, String subject,
			String content) {
		super();
		this.cr_seq = cr_seq;
		this.ch_seq = ch_seq;
		this.email = email;
		this.days = days;
		this.checks = checks;
		this.subject = subject;
		this.content = content;
	}
	
	public ChallengeRecord() {
		// TODO Auto-generated constructor stub
	}
	
	

}
