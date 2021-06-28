package bean;

public class ChallengeGroup {
	
	private int ch_seq;
	
	private String email;
	
	private String review;

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

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	@Override
	public String toString() {
		return "Challenge_Group [ch_seq=" + ch_seq + ", email=" + email + ", review=" + review + "]";
	}

	public ChallengeGroup(int ch_seq, String email, String review) {
		super();
		this.ch_seq = ch_seq;
		this.email = email;
		this.review = review;
	}
	
	public ChallengeGroup() {
		
	}

}
