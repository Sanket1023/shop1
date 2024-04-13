package com.inventory.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.inventory.bean.ProductList;

public class AdminDao {

	private String jdbcURL = "jdbc:mysql://localhost:3306/inventorysystem?useSSL=false";
	private String jdbcUsername = "root";
	private String jdbcPassword = "root@1234";

	private static final String INSERT_PRODUCTS_SQL = "INSERT INTO product_list" + "  (product_name, purchased_qty,buy_price,price_per_qty,sell_price,alert) "
			+ "VALUES "+ " (?, ?, ?, ?, ?, ?);";

	private static final String SELECT_PRODUCTS_BY_ID = "select product_id, product_name, purchased_qty,buy_price,price_per_qty,sell_price,alert from users where product_id =?";
	private static final String SELECT_ALL_PRODUCTS = "select * from product_list";
	private static final String DELETE_PRODUCTS_SQL = "delete from product_list where product_id = ?;";
	private static final String UPDATE_PRODUCTS_SQL = "update product_list set product_name = ?,purchased_qty= ?, buy_price =?, price_per_qty =?, sell_price =?, alert =? where product_id = ?;";


	protected Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		return connection;
	}
//	insert product
	public void insert_product(ProductList product_list) throws SQLException {
	
		try(Connection con = getConnection();
				PreparedStatement pdst = con.prepareStatement(INSERT_PRODUCTS_SQL);){
			pdst.setString(1, product_list.getProduct_name());
			pdst.setInt(2, product_list.getPurchased_qty());
			pdst.setInt(3, product_list.getBuy_price());
			pdst.setInt(4, product_list.getPrice_per_qty());
			pdst.setInt(5, product_list.getSell_price());
			pdst.setInt(6, product_list.getAlert());
			pdst.executeUpdate();
		}
		catch(SQLException ex) {
			printSQLException(ex);
		}
	}
	
	
//	select product by id
	public ProductList select_by_id(int product_id) throws SQLException {
		ProductList product_list = null;
		try(Connection con = getConnection();
				PreparedStatement pdst = con.prepareStatement(SELECT_PRODUCTS_BY_ID);){
			pdst.setInt(1, product_id);
			// Step 3: Execute the query or update query
			ResultSet rs = pdst.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String product_name = rs.getString("product_name");
				int purchased_qty = rs.getInt("purchased_qty");
				int buy_price = rs.getInt("buy_price");
				int price_per_qty = rs.getInt("price_per_qty");
				int sell_price = rs.getInt("sell_price");
				int alert = rs.getInt("alert");
				product_list = new ProductList(product_id, product_name, purchased_qty, buy_price,price_per_qty,sell_price,alert);
			}
		}
		catch(SQLException ex) {
			printSQLException(ex);
		}
		return product_list;
	}
	
//	select all products
	public List<ProductList> select_all_products(){
		List<ProductList> product_list = new ArrayList<>();
		
		try(Connection con = getConnection();
				PreparedStatement pdst = con.prepareStatement(SELECT_ALL_PRODUCTS);){

			ResultSet rs = pdst.executeQuery();

			while (rs.next()) {
				int product_id = rs.getInt("product_id");
				String product_name = rs.getString("product_name");
				int purchased_qty = rs.getInt("purchased_qty");
				int buy_price = rs.getInt("buy_price");
				int price_per_qty = rs.getInt("price_per_qty");
				int sell_price = rs.getInt("sell_price");
				int alert = rs.getInt("alert");
				product_list.add(new ProductList(product_id, product_name, purchased_qty, buy_price,price_per_qty,sell_price,alert));
			}
		}
		catch(SQLException ex) {
			printSQLException(ex);
		}
		
		return product_list;
	}
	
//	update product
	public boolean update_product(ProductList product_list) throws SQLException {
		
		boolean rowupdated;
		try(Connection con = getConnection();
				PreparedStatement pdst = con.prepareStatement(UPDATE_PRODUCTS_SQL);){
			
			pdst.setString(1, product_list.getProduct_name());
			pdst.setInt(2, product_list.getPurchased_qty());
			pdst.setInt(3, product_list.getBuy_price());
			pdst.setInt(4, product_list.getPrice_per_qty());
			pdst.setInt(5, product_list.getSell_price());
			pdst.setInt(6, product_list.getAlert());
			pdst.setInt(7, product_list.getProduct_id());
			rowupdated = pdst.executeUpdate() > 0;
		}
		return rowupdated;
	
	}
	
//	delete product
	public boolean delete_product(int product_id) throws SQLException { 
		boolean rowDeleted;
		try(Connection con = getConnection();
				PreparedStatement pdst = con.prepareStatement(DELETE_PRODUCTS_SQL);){
			pdst.setInt(1,product_id);  //if we passing directly product_id then no need to use ProductList 
			rowDeleted = pdst.executeUpdate() > 0;
		}
		return rowDeleted;
		
	}
	
//	handle all the exception
	private void printSQLException(SQLException ex) {
		for (Throwable e : ex) {
			if (e instanceof SQLException) {
				e.printStackTrace(System.err);
				System.err.println("SQLState: " + ((SQLException) e).getSQLState());
				System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
				System.err.println("Message: " + e.getMessage());
				Throwable t = ex.getCause();
				while (t != null) {
					System.out.println("Cause: " + t);
					t = t.getCause();
				}
			}
		}
	}

}
