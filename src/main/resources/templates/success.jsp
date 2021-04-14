<!-- <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
      xmlns:th="http://thymleaf.org">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Sucess Page</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body> -->
<!DOCTYPE html>
<html>
<head>
    <head th:insert="fragments.html :: headerfiles">
</head>
<body>
	<header th:insert="fragments.html :: nav"></header>

	<div class = "container">
		<div class="alert alert-success" role="alert">
	  		<h2 class="display-2"> Thank you for your business!</h2>
			<p>Your order will be delivered to you within few days.</p>
		</div>
		
		<div class="row">
			<div class="col-5">
			</div>
			<div class="col">
				<a class="btn btn-primary" href="/music/orders" role="button">View Orders</a>
			</div>
		</div>
	</div>

	<div th:replace="fragments.html :: footer"></div>
</body>
</html>