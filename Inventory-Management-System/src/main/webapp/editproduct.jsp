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
		int product_id = Integer.parseInt(request.getParameter("product_id"));
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventorysystem", "root", "root@1234");			        		
			Statement st=con.createStatement();
			String str = "select * from product_list where product_id ="+product_id;
			ResultSet rs = st.executeQuery(str);
			while (rs.next()) {
	
	%>
	<h1>Edit Product Details</h1>
	<form action="editproductAction.jsp" method="post">
		<input type="text" name="product_id" value="<%=rs.getInt("product_id") %>" required><br>
		<input type="text" name="product_name" value="<%=rs.getString("product_name") %>" required><br>
		<input type="text" name="purchased_qty" value="<%=rs.getInt("purchased_qty") %>" id="purchased_qty" required><br>
		<input type="text" name="buy_price" value="<%=rs.getInt("buy_price") %>" id="buy_price" required><br>
		<input type="text" name="price_per_qty" value="<%=rs.getInt("price_per_qty") %>" id="price_per_qty" onclick="calculate_price_per_qty()" readonly><br>
		<input type="text" name="sell_price" value="<%=rs.getInt("sell_price") %>" required><br>
		<input type="text" name="alert" value="<%=rs.getInt("alert") %>" required><br>

		<input type="submit" value="submit">
	
	</form>
		<% }
			
		}catch(Exception ex){
				 System.out.print(ex);		
			}
		%>

	<script>
		function calculate_price_per_qty(){
			var p1=document.getElementById("purchased_qty").value;
			var p2=document.getElementById("buy_price").value;
			
			var total = p2 /p1;
			document.getElementById("price_per_qty").value = total;
		}
	</script>
</body>
</html>