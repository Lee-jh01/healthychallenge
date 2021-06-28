package bean;

public class Qna {
	
    private int qna_seq; //  글 고유번호
	
	private String email; // 이메일 아이디
	
	private String title; // 제목
	
	private String regdate; // 기록일자
	
	private int readhit; // 조회수
	
	private int groupno ; // 그룹번호
	
	
	public Qna(int qna_seq, String email, String title, String regdate, int readhit, int groupno) {
		super();
		this.qna_seq = qna_seq;
		this.email = email;
		this.title = title;
		this.regdate = regdate;
		this.readhit = readhit;
		this.groupno = groupno;
	}

	public Qna() {
		
	}
 
	@Override
	public String toString() {
		return "QnA [qna_seq=" + qna_seq + ", email=" + email + ", title=" + title + ", regdate=" + regdate
				+ ", readhit=" + readhit + ", groupno=" + groupno + "]";
	}

	public int getQna_seq() {
		return qna_seq;
	}

	public void setQna_seq(int qna_seq) {
		this.qna_seq = qna_seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getReadhit() {
		return readhit;
	}

	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}

	public int getGroupno() {
		return groupno;
	}

	public void setGroupno(int groupno) {
		this.groupno = groupno;
	}

	

}
