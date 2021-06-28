package bean;


public class MealMemory {
	

	private int mm_seq;	//식사기록고유번호
	
	private int meal_seq;	//식사_고유번호
	
	
	private double how; // 몇 인분
	
	
	private String food_name; // 식품이름
	
	private int serving_wt; // 1회 제공량(g)
	

	private double calorie; // 열량(kcal)	
	
	private double carbohydrate ; // 탄수화물(g)

	
	private double protein ; // 단백질(g)
	
	
	private double fat ; // 지방(g)	
	
	
	private double Na ; // 나트륨(mg)


	public int getMm_seq() {
		return mm_seq;
	}


	public void setMm_seq(int mm_seq) {
		this.mm_seq = mm_seq;
	}


	public int getMeal_seq() {
		return meal_seq;
	}


	public void setMeal_seq(int meal_seq) {
		this.meal_seq = meal_seq;
	}


	public double getHow() {
		return how;
	}


	public void setHow(double how) {
		this.how = how;
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
		return "MealMemory [mm_seq=" + mm_seq + ", meal_seq=" + meal_seq + ", how=" + how + ", food_name=" + food_name
				+ ", serving_wt=" + serving_wt + ", calorie=" + calorie + ", carbohydrate=" + carbohydrate
				+ ", protein=" + protein + ", fat=" + fat + ", Na=" + Na + "]";
	}


	public MealMemory(int mm_seq, int meal_seq, double how, String food_name, int serving_wt, double calorie,
			double carbohydrate, double protein, double fat, double na) {
		super();
		this.mm_seq = mm_seq;
		this.meal_seq = meal_seq;
		this.how = how;
		this.food_name = food_name;
		this.serving_wt = serving_wt;
		this.calorie = calorie;
		this.carbohydrate = carbohydrate;
		this.protein = protein;
		this.fat = fat;
		Na = na;
	}

	public MealMemory() {
		// TODO Auto-generated constructor stub
	}
	
}
