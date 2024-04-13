<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body{
            background-color: #f3f3f3;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
     }
    .header h1{
        	background: #4b4276;
		    margin: 0px;
		    border-radius: 25px 25px 0px 0px;
		    color: white;
		    font-size: 30px;
		    padding: 20px;
    }
    .addproduct{
    		background-color: #fff;
         	border-radius: 0px 0px 25px 25px;
            box-shadow: 0 0 20px
                    rgba(0, 0, 0, 0.2);
            padding: 20px;
            width: 300px;
    }
    
    input[type="text"]{
    		width: 100%;
            margin-bottom: 15px;
            padding: 10px;
            box-sizing: border-box;
            border: 1px solid #ddd;
            border-radius: 5px;
    }
    input[type="submit"]{
    		padding: 15px;
		    font-size: 20px;
		    background: #4b4276;
		    color: white;
		    width: 100%;
		    border-radius: 15px;
		    border:none;		
    }
     
</style>
</head>
<body>	
	<div class="header">
		<h1 style="background: #4b4276;">Add Product Details</h1>
		<div class="addproduct">
		<form action="Actions/addproductAction.jsp" method="post">
			<input type="text" name="product_name" placeholder="Enter Product Name" required><br>
			<input type="text" name="purchased_qty" id="purchased_qty" placeholder="Enter Purchased Quantity" required><br>
			<input type="text" name="buy_price" id="buy_price" placeholder="Enter Buy price" required><br>
			<input type="text" name="price_per_qty" id="price_per_qty" placeholder="Click For Autoprice" onclick="calculate_price_per_qty()" readonly><br>
			<input type="text" name="sell_price" placeholder="Enter Sell Price" required><br>
			<input type="text" name="alert" placeholder="Enter Alert" required><br>
	
			<input type="submit" value="SUBMIT">
		
		</form>
		</div>
	</div>
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