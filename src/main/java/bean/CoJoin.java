package bean;

public class CoJoin {
	private String email;
	private String name;
	private String nickname;
	private String birth;
	private String photo;
	private int co_seq;
	private String category;
	private String subject;
	private String content;
	private int readhit ;
	private String regdate ;
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public int getCo_seq() {
		return co_seq;
	}
	public void setCo_seq(int co_seq) {
		this.co_seq = co_seq;
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
	@Override
	public String toString() {
		return "CoJoin [email=" + email + ", name=" + name + ", nickname=" + nickname + ", birth=" + birth + ", photo="
				+ photo + ", co_seq=" + co_seq + ", category=" + category + ", subject=" + subject + ", content="
				+ content + ", readhit=" + readhit + ", regdate=" + regdate + "]";
	}
	public CoJoin(String email, String name, String nickname, String birth, String photo, int co_seq, String category,
			String subject, String content, int readhit, String regdate) {
		super();
		this.email = email;
		this.name = name;
		this.nickname = nickname;
		this.birth = birth;
		this.photo = photo;
		this.co_seq = co_seq;
		this.category = category;
		this.subject = subject;
		this.content = content;
		this.readhit = readhit;
		this.regdate = regdate;
	}
	
	public CoJoin() {
		// TODO Auto-generated constructor stub
	}
}
