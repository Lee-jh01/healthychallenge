package bean;

public class ExerciseMemory {
	
    private int em_seq;  // 운동기록 고유번호
	
	private String email;  // 이메일 아이디
	
	private String regdate;  // 기록일자
	
	private double total_calorie;  //총칼로리

	
	public ExerciseMemory(int em_seq, String email, String regdate, double total_calorie) {
		super();
		this.em_seq = em_seq;
		this.email = email;
		this.regdate = regdate;
		this.total_calorie = total_calorie;
	}
	
	public ExerciseMemory() {
		
	}

	@Override
	public String toString() {
		return "ExerciseMemory [em_seq=" + em_seq + ", email=" + email + ", regdate=" + regdate + ", total_calorie="
				+ total_calorie + "]";
	}

	public int getEm_seq() {
		return em_seq;
	}

	public void setEm_seq(int em_seq) {
		this.em_seq = em_seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public double getTotal_calorie() {
		return total_calorie;
	}

	public void setTotal_calorie(double total_calorie) {
		this.total_calorie = total_calorie;
	}

}
