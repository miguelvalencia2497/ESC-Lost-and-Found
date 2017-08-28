package ust.esc.model;

public class AccountBean {
	private int idaccounts;
	public int getIdaccounts() {
		return idaccounts;
	}
	public void setIdaccounts(int idaccounts) {
		this.idaccounts = idaccounts;
	}
	private String username;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isAdmin() {
		return admin;
	}
	public void setAdmin(boolean admin) {
		this.admin = admin;
	}
	private String password;
	private boolean admin;
	
}
