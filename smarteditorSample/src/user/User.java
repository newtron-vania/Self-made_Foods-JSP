package user;

public class User {
	private String userEmail;
	private String userPassword;
	private String userName;
	private String userDate;
	private int adminCheck;
	
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserPassword() {
		return userPassword;
	}
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserDate() {
		return userDate;
	}
	public void setUserDate(String userDate) {
		this.userDate = userDate;
	}
	public int getAdminCheck() {
		System.out.println(adminCheck);
		return adminCheck;
	}
	public void setAdminCheck(int adminCheck) {
		this.adminCheck = adminCheck;
	}
}
