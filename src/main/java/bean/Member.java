package bean;

public class Member {
	
	private String email;
	
	private String password;
	
	private String name;
	
	private String brith;
	
	private int gender;
	
	private String nickname;
	
	private String photo;
	
	private double height;
	
	private double weight;
	
	private String authstatus;
	
	private String authkey;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBrith() {
		return brith;
	}

	public void setBrith(String brith) {
		this.brith = brith;
	}

	public int getGender() {
		return gender;
	}

	public void setGender(int gender) {
		this.gender = gender;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public double getHeight() {
		return height;
	}

	public void setHeight(double height) {
		this.height = height;
	}

	public double getWeight() {
		return weight;
	}

	public void setWeight(double weight) {
		this.weight = weight;
	}

	public String getAuthstatus() {
		return authstatus;
	}

	public void setAuthstatus(String authstatus) {
		this.authstatus = authstatus;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", password=" + password + ", name=" + name + ", brith=" + brith + ", gender="
				+ gender + ", nickname=" + nickname + ", photo=" + photo + ", height=" + height + ", weight=" + weight
				+ ", authstatus=" + authstatus + ", authkey=" + authkey + "]";
	}

	public Member(String email, String password, String name, String brith, int gender, String nickname, String photo,
			double height, double weight, String authstatus, String authkey) {
		super();
		this.email = email;
		this.password = password;
		this.name = name;
		this.brith = brith;
		this.gender = gender;
		this.nickname = nickname;
		this.photo = photo;
		this.height = height;
		this.weight = weight;
		this.authstatus = authstatus;
		this.authkey = authkey;
	}
	
	public Member() {
		
	}

}
