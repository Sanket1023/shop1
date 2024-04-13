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
	try(Connection con = Connectionprovider.getConnection();
			PreparedStatement pdst = con.prepareStatement("delete from product_list where product_id = ?;")){
		pdst.setInt(1,product_id);  //if we passing directly product_id then no need to use ProductList 
		pdst.executeUpdate();
		response.sendRedirect("product_list.jsp");
	}
	%>
</body>
</html>