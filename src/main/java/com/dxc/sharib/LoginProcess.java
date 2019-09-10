package com.dxc.sharib;

import java.sql.*;  
public class LoginProcess {  
  
	public static String validate(LoginBean bean){  
		boolean status = false;
		String role = null;
		try {
			//create initial users
			//createUser(bean);
			
			//System.out.println("bean.getUsername(): "+ bean.getUsername());
			//System.out.println("bean.getPassword(): "+ bean.getPassword());

			Connection con = ConnectionProvider.getCon();
			              
			PreparedStatement ps = con.prepareStatement(  
			    "select * from users where username=? and password=?");
			  
			ps.setString(1, bean.getUsername()); 
			ps.setBytes(2, bean.getencPassword());
			              
			ResultSet rs = ps.executeQuery();
			status = rs.next();
			if (status)
				role = rs.getString("role");
			//System.out.println("Login status: "+ status);
		} catch(Exception e) {
			System.out.println(e);
		} 
		return role; 
	}
	
	private static void createUser(LoginBean bean) {
		int numRows = 0;
		try {
			
			//System.out.println("bean.getUsername(): "+ bean.getUsername());
			//System.out.println("bean.getPassword(): "+ bean.getPassword());

			Connection con = ConnectionProvider.getCon();
			              
			PreparedStatement ps = con.prepareStatement(  
			    "INSERT INTO users (username, password, role) VALUES (?,?,?)");
			  
			ps.setString(1, bean.getUsername()); 
			ps.setBytes(2, bean.getencPassword());
			ps.setString(3, "manager"); 
			              
			numRows = ps.executeUpdate();
			if (numRows == 1)
				System.out.println("Created user: "+ bean.getUsername());
		} catch(Exception e) {
			System.out.println(e);
		}
	}
}  