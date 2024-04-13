<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="listheader.jsp" %>
 <%@ page import="java.sql.*"%>
 <%@ page import="com.inventory.bean.ProductList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="dashboardStyle.css">

</head>
<body>
	
	        	<div class="content" >
		        	<table>
		        			<tr>
			        			
			        			<th>Product Name</th>
			        			<th>Purchased Qty</th>
			        			<th>Buy Price</th>
			        			<th>Price / Qty</th>
			        			<th>Selling Price</th>
			        			<th>Alert</th>
			        		</tr>
			        		<%
			        		try {
			        			Class.forName("com.mysql.jdbc.Driver");
			        			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventorysystem", "root", "root@1234");			        		
			        			Statement st=con.createStatement();
			        			String str = "select * from product_list";
			        			ResultSet rs = st.executeQuery(str);
			        			while (rs.next()) {
			        		
			        		%>
			        		<tr>
			        			
			        			<td><%=rs.getString("product_name") %></td>
			        			<td><%=rs.getInt("purchased_qty") %></td>
			        			<td><%=rs.getInt("buy_price") %> &#8377;</td>
			        			<td><%=rs.getInt("price_per_qty") %> &#8377;</td>
			        			<td><%=rs.getInt("sell_price") %> &#8377;</td>
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