<!DOCTYPE html>
<html>
<head>
    <head th:insert="fragments.html :: headerfiles">
</head>
<body>
	<header th:insert="fragments.html :: nav"></header>

	<div class="container">
		<h1 >Inventory Management</h1>
		<hr class="featurette-divider">
		
		<div class="list-group">
			<a href="/admin/genres" class="list-group-item list-group-item-action">Manage Genres</a>
			<a href="/admin/categories" class="list-group-item list-group-item-action">Manage Categories</a>
			<a href="/admin/products1" class="list-group-item list-group-item-action">Manage Product</a>
		</div>
	</div>
	
	<div th:replace="fragments.html :: footer"></div>
</body>
</html>