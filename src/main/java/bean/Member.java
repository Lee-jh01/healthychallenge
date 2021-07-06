package bean;

import org.springframework.web.multipart.MultipartFile;

public class Member {
	
	private String email;
	
	private String password;
	
	private String name;
	
	private String birth;
	
	private int gender;
	
	private String nickname;
	
	private MultipartFile abcd;
	
	private String photo; //업로드 관련 항목
	
	private double height;
	
	private double weight;
	
	private String authstatus;
	
	private String authkey;
	
	public Member() {
		
	}

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

	public MultipartFile getAbcd() {
		return abcd;
	}

	public void setAbcd(MultipartFile abcd) {
		this.abcd = abcd;
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

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "Member [email=" + email + ", password=" + password + ", name=" + name + ", birth=" + birth + ", gender="
				+ gender + ", nickname=" + nickname + ", abcd=" + abcd + ", photo=" + photo + ", height=" + height
				+ ", weight=" + weight + ", authstatus=" + authstatus + ", authkey=" + authkey + "]";
	}



	
	
	


}
