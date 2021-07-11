package bean;

public class ExerciseJoin {
	String ename;
	int how;
	int ex_seq;
	int em_seq;
	double total_calorie;
	int METs;
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public int getHow() {
		return how;
	}
	public void setHow(int how) {
		this.how = how;
	}
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
	public double getTotal_calorie() {
		return total_calorie;
	}
	public void setTotal_calorie(double total_calorie) {
		this.total_calorie = total_calorie;
	}
	public int getMETs() {
		return METs;
	}
	public void setMETs(int mETs) {
		METs = mETs;
	}
	@Override
	public String toString() {
		return "ExerciseJoin [ename=" + ename + ", how=" + how + ", ex_seq=" + ex_seq + ", em_seq=" + em_seq
				+ ", total_calorie=" + total_calorie + ", METs=" + METs + "]";
	}
	public ExerciseJoin(String ename, int how, int ex_seq, int em_seq, double total_calorie, int mETs) {
		super();
		this.ename = ename;
		this.how = how;
		this.ex_seq = ex_seq;
		this.em_seq = em_seq;
		this.total_calorie = total_calorie;
		METs = mETs;
	}
	
	public ExerciseJoin() {
		// TODO Auto-generated constructor stub
	}
}
