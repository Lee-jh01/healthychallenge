package bean;

public class MyFood {
	
	private int mf_seq;
	
	private String email;
	
	private String food_name;
	
	private int serving_wt;
	
	private double calorie;
	
	private double carbohydrate;
	
	private double protein;
	
	private double fat;
	
	private double Na;

	public int getMf_seq() {
		return mf_seq;
	}

	public void setMf_seq(int mf_seq) {
		this.mf_seq = mf_seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFood_name() {
		return food_name;
	}

	public void setFood_name(String food_name) {
		this.food_name = food_name;
	}

	public int getServing_wt() {
		return serving_wt;
	}

	public void setServing_wt(int serving_wt) {
		this.serving_wt = serving_wt;
	}

	public double getCalorie() {
		return calorie;
	}

	public void setCalorie(double calorie) {
		this.calorie = calorie;
	}

	public double getCarbohydrate() {
		return carbohydrate;
	}

	public void setCarbohydrate(double carbohydrate) {
		this.carbohydrate = carbohydrate;
	}

	public double getProtein() {
		return protein;
	}

	public void setProtein(double protein) {
		this.protein = protein;
	}

	public double getFat() {
		return fat;
	}

	public void setFat(double fat) {
		this.fat = fat;
	}

	public double getNa() {
		return Na;
	}

	public void setNa(double na) {
		Na = na;
	}

	@Override
	public String toString() {
		return "MyFood [mf_seq=" + mf_seq + ", email=" + email + ", food_name=" + food_name + ", serving_wt="
				+ serving_wt + ", calorie=" + calorie + ", carbohydrate=" + carbohydrate + ", protein=" + protein
				+ ", fat=" + fat + ", Na=" + Na + "]";
	}

	public MyFood(int mf_seq, String email, String food_name, int serving_wt, double calorie, double carbohydrate,
			double protein, double fat, double na) {
		super();
		this.mf_seq = mf_seq;
		this.email = email;
		this.food_name = food_name;
		this.serving_wt = serving_wt;
		this.calorie = calorie;
		this.carbohydrate = carbohydrate;
		this.protein = protein;
		this.fat = fat;
		Na = na;
	}
	
	public MyFood() {
		
	}

}
