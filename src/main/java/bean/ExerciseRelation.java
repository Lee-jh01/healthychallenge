package bean;

public class ExerciseRelation {
	
    private int ex_seq;  // 운동 고유번호
	
	private int em_seq;  // 운동 기록고유번호
	
	private int how;  // 몇 분 했는가(min 기준)

	public int getEx_seq() {
		return ex_seq;
	}

	public void setEx_seq(int ex_seq) {
		this.ex_seq = ex_seq;
	}

	public int getEm_seq() {
		return em_seq;
	}

	public void setEm_seq(int em_seq) {
		this.em_seq = em_seq;
	}

	public int getHow() {
		return how;
	}

	public void setHow(int how) {
		this.how = how;
	}

	@Override
	public String toString() {
		return "ExerciseRlation [ex_seq=" + ex_seq + ", em_seq=" + em_seq + ", how=" + how + "]";
	}

	public ExerciseRelation(int ex_seq, int em_seq, int how) {
		super();
		this.ex_seq = ex_seq;
		this.em_seq = em_seq;
		this.how = how;
	}
	

	public ExerciseRelation() {
		// TODO Auto-generated constructor stub
	}
	

}
