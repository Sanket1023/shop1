<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.inventory.Dao.Connectionprovider,java.sql.*" %>
<%@ include file="listheader.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="dashboardStyle.css">
</head>
<body>
		

	        	<div class="content">
		        	<table>
		        			<tr>
			        			<th>SL.No</th>
			        			<th>Product Name</th>
			        			<th>Purchased Qty</th>
			        			<th>Buy Price</th>
			        			<th>Price / Qty</th>
			        			<th>Selling Price</th>
			        			<th>Alert</th>
			        		</tr>
			        		<%
			        		int z=0;
			        		try {
			        			String search = request.getParameter("search");
			        			Class.forName("com.mysql.jdbc.Driver");
			        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventorysystem", "root", "root@1234");			        		
			        			Statement st=con.createStatement();
			        			PreparedStatement pdst = con.prepareStatement("select * from product_list where product_name =?");
			        			pdst.setString(1,search);
			        			ResultSet rs = pdst.executeQuery();
			        			while (rs.next()) {
			        				z=1;
			        		%>
			        		
			        		<tr>
			        			<td><%=rs.getInt("product_id") %></td>
			        			<td><%=rs.getString("product_name") %></td>
			        			<td><%=rs.getInt("purchased_qty") %></td>
			        			<td><%=rs.getInt("buy_price") %></td>
			        			<td><%=rs.getInt("price_per_qty") %></td>
			        			<td><%=rs.getInt("sell_price") %></td>
			        			<td><%=rs.getInt("alert") %></td>
			        			<td class="btns"><a href="editproduct.jsp?product_id=<%=rs.getInt("product_id")%>" class="btn-primary">Edit</a></td>  
              					<td class="btns"><a href="deleteproduct.jsp?product_id=<%=rs.getInt("product_id")%>" class="btn-danger">Delete</a></td>  
			        		</tr>
			        		<% }
			        		}
			        		catch(Exception ex){
			        			 System.out.print(ex);	
			        		}
			        		%>
		        	</table>
		        	
	      		</div>
	      			
</body>
</html>