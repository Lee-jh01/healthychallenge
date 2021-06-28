package bean;

public class Exercise {
	
	private int ex_seq;
	
	private String ename;
	
	private double METs;

	public int getEx_seq() {
		return ex_seq;
	}

	public void setEx_seq(int ex_seq) {
		this.ex_seq = ex_seq;
	}

	public String getEname() {
		return ename;
	}

	public void setEname(String ename) {
		this.ename = ename;
	}

	public double getMETs() {
		return METs;
	}

	public void setMETs(double mETs) {
		METs = mETs;
	}

	@Override
	public String toString() {
		return "Exercise [ex_seq=" + ex_seq + ", ename=" + ename + ", METs=" + METs + "]";
	}

	public Exercise(int ex_seq, String ename, double mETs) {
		super();
		this.ex_seq = ex_seq;
		this.ename = ename;
		METs = mETs;
	}
	
	public Exercise() {
		
	}

}
