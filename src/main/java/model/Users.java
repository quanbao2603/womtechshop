package model;

import java.sql.Date;

public class Users {
	private String usersID;
	private Role role;
	private String fullname;
	private String username;
	private String password;
	private String email;
	private Date create_at;
	private boolean status;
	
	public Users() {
		super();
	}

	public Users(String usersID, Role role, String fullname, String username, String password, String emmail,
			Date create_at, boolean status) {
		super();
		this.usersID = usersID;
		this.role = role;
		this.fullname = fullname;
		this.username = username;
		this.password = password;
		this.email = emmail;
		this.create_at = create_at;
		this.status = status;
	}

	public String getUsersID() {
		return usersID;
	}

	public void setUsersID(String usersID) {
		this.usersID = usersID;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

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

	public String getEmail() {
		return email;
	}

	public void setEmail(String emmail) {
		this.email = emmail;
	}

	public Date getCreate_at() {
		return create_at;
	}

	public void setCreate_at(Date create_at) {
		this.create_at = create_at;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}
}
