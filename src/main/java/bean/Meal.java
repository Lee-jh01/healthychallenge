package bean;

public class Meal {
	
	private int meal_seq;
	
	private String email;
	
	private String regdate;
	
	private String time;
	
	private double total_calorie;

	public int getMeal_seq() {
		return meal_seq;
	}

	public void setMeal_seq(int meal_seq) {
		this.meal_seq = meal_seq;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public double getTotal_calorie() {
		return total_calorie;
	}

	public void setTotal_calorie(double total_calorie) {
		this.total_calorie = total_calorie;
	}

	@Override
	public String toString() {
		return "Meal [meal_seq=" + meal_seq + ", email=" + email + ", regdate=" + regdate + ", time=" + time
				+ ", total_calorie=" + total_calorie + "]";
	}

	public Meal(int meal_seq, String email, String regdate, String time, double total_calorie) {
		super();
		this.meal_seq = meal_seq;
		this.email = email;
		this.regdate = regdate;
		this.time = time;
		this.total_calorie = total_calorie;
	}
	
	public Meal() {
		
	}

}
