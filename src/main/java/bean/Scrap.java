package bean;

public class Scrap {
	
	private int scr_seq;
	
	private int co_seq;
	
	private String email;

	public int getScr_seq() {
		return scr_seq;
	}

	public void setScr_seq(int scr_seq) {
		this.scr_seq = scr_seq;
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

	@Override
	public String toString() {
		return "Scrap [scr_seq=" + scr_seq + ", co_seq=" + co_seq + ", email=" + email + "]";
	}

	public Scrap(int scr_seq, int co_seq, String email) {
		super();
		this.scr_seq = scr_seq;
		this.co_seq = co_seq;
		this.email = email;
	}
	
	public Scrap() {
		
	}

}
