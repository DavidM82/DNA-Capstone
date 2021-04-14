<!DOCTYPE html>
<html>
<head>
	<head th:insert="fragments.html :: headerfiles">
</head>
<body>
	<header th:insert="fragments.html :: nav"></header>

	<div class="container">
		<h1 class="display-4"><em><span style="color: #0000ff;"><span style="color: #993300;">Team X Music Store</span>🎶</span></em></h1>
		<p>This is the home page!</p>
		<hr class="featurette-divider">
		<div class="row">
			<div class="col"><h2 class="display-4" th:inline="text">Welcome customer: [[${user.username}]]</h2></div>
		</div>
		
		<hr class="featurette-divider">
		
		<a class="btn btn-link btn-lg" href="/music/products" role="button">Product Inventory</a></br>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;Here you can view and search our product inventory!</p>
		
		<a class="btn btn-link btn-lg" href="/music/cart" role="button">Shopping Cart</a></br>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;Here you can view your current Shopping Cart.</p>
		
		<a class="btn btn-link btn-lg" href="/music/orders" role="button">Your Orders</a></br>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;Here you can view your current and past orders.</p>
		
		<hr class="featurette-divider">
	</div>
	
	<div th:replace="fragments.html :: footer"></div>
</body>
</html>