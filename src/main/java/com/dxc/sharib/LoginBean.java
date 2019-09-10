package com.dxc.sharib;
  
public class LoginBean {  
	private String username, password;
	private byte[] encPassword;  
	  
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
	public byte[] getencPassword() {
	    return encPassword;  
	}  
	  
	public void setencPassword(byte[] encPassword) {  
	    this.encPassword = encPassword;
	}  
  
}  