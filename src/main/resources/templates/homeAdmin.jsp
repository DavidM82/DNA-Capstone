<!DOCTYPE html>
<html>
<head>
    <head th:insert="fragments.html :: headerfiles">
</head>

<body>
	<header th:insert="fragments.html :: nav"></header>

		<h2>Welcome admin [[${user.username}]]</h2>
		<hr class="featurette-divider">

	<div class="container">
		<hr class="featurette-divider">

<!-- 		<ul class="list-group">
			<li class="list-group-item">Product Inventory
		</ul> -->

		<a class="btn-link btn-lg" href="/admin/products">Product Inventory</a></br>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;Here you can view, check and modify the product inventory!</p>

		<a class="btn btn-link btn-lg" href="/admin/customers" role="button">Customer Management</a></br>
		<p>&nbsp;&nbsp;&nbsp;&nbsp;Here you can view customer Information</p>

		<div class="container">
		<h1 class="display-4 my-3">Your Cart</h1>
			<div class="row">
				<ul class="list-group col-9">
					<li class="list-group-item d-flex justify-content-around">
						<span class="my-auto h6">Product Image</span> 
						<span class="my-auto h6">Product</span> 
						<span class="my-auto h6">Price</span> 
					</li>
				</ul>
			</div>
		</div>

	</div>
	
	<div th:replace="fragments.html :: footer"></div>
</body>
</html>