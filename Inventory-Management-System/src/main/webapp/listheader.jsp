<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="dashboardStyle.css">
</head>
<body>
	
	<div class="wrapper">
    	<div class="sidebar">
	        <h2>LAXMI NARAYAN KIRANA SHOP</h2>
	        <ul>
	            <li><a href="product_list.jsp">Product List</a></li>
	            <li><a href="#">Sell Products</a></li>
	            <li><a href="#">Remaining Products</a></li>
	            <li><a href="#l">Alert List</a></li>
	          
	        </ul> 
    	</div>
    	
    	<div class="main_content">
	        <div class="header"><h3>PRODUCT LIST</h3></div>  
	        <div class="searchbtns">
	        	<button type="button" class="btn-primary" onclick="document.location='addproduct.jsp'">Add Product</button>
	        	<form class="search" action="search.jsp" method="post">
	        		<input id="sid" type="search" name="search" placeholder="search product">
	        		<button class="btn-primary" type="submit">Search</button>
	        	</form>
	        </div>
    	</div>
    </div>
	        	

</body>
</html>