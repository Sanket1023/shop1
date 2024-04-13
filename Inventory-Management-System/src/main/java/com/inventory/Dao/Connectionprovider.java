package com.inventory.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connectionprovider {
	
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventorysystem", "root", "root@1234");
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			return null;
		}
		return connection;
	}
}
