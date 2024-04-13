<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.inventory.Dao.Connectionprovider,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	
	<%
			
		String product_name = request.getParameter("product_name");
		int purchased_qty = Integer.parseInt(request.getParameter("purchased_qty"));
		int buy_price = Integer.parseInt(request.getParameter("buy_price"));
		int price_per_qty = Integer.parseInt(request.getParameter("price_per_qty"));
		int sell_price = Integer.parseInt(request.getParameter("sell_price"));
		int alert = Integer.parseInt(request.getParameter("alert"));
		
		try(Connection con = Connectionprovider.getConnection();
				PreparedStatement pdst = con.prepareStatement("INSERT INTO product_list" + "  (product_name, purchased_qty,buy_price,price_per_qty,sell_price,alert) "
						+ "VALUES "+ " (?, ?, ?, ?, ?, ?);");){
			pdst.setString(1, product_name);
			pdst.setInt(2, purchased_qty);
			pdst.setInt(3, buy_price);
			pdst.setInt(4, price_per_qty);
			pdst.setInt(5, sell_price);
			pdst.setInt(6, alert);
			pdst.executeUpdate();
			
			
		}
		
		catch(Exception ex){
			System.out.println(ex);
		}

	%>
</body>
</html>