package bean;

public class Qna {
	
    private int qna_seq; //  글 고유번호
	
	private String email; // 이메일 아이디
	
	private String title; // 제목
	
	private String regdate; // 기록일자
	
	private int readhit; // 조회수
	
	private int groupno ; // 그룹번호
	
	private String content;	
	private int orderno ;
	private int depth ;	
	
	
	
	
	
	
	
	
	public int getOrderno() {
		return orderno;
	}

	public void setOrderno(int orderno) {
		this.orderno = orderno;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public Qna(int qna_seq, String email, String title, String regdate, int readhit, int groupno, String content,
			int orderno, int depth) {
		super();
		this.qna_seq = qna_seq;
		this.email = email;
		this.title = title;
		this.regdate = regdate;
		this.readhit = readhit;
		this.groupno = groupno;
		this.content = content;
		this.orderno = orderno;
		this.depth = depth;
	}

	@Override
	public String toString() {
		return "Qna [qna_seq=" + qna_seq + ", email=" + email + ", title=" + title + ", regdate=" + regdate
				+ ", readhit=" + readhit + ", groupno=" + groupno + ", content=" + content + ", orderno=" + orderno
				+ ", depth=" + depth + "]";
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}



	public Qna() {
		// TODO Auto-generated constructor stub
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
