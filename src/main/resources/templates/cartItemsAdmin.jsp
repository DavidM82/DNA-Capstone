<!-- <!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml"
	xmlns:th="http://thymleaf.org">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Cart Items</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-/Y6pD6FV/Vv2HJnA6t+vslU6fwYXjCFtcEpHbNJ0lyAFsXTsjBbfaDjzALeQsN6M" crossorigin="anonymous">
    <link href="https://getbootstrap.com/docs/4.0/examples/signin/signin.css" rel="stylesheet" crossorigin="anonymous">
    <style>
       
    </style>
</head>
<body>
    <br/> -->
<!DOCTYPE html>
<html>
<head>
    <head th:insert="fragments.html :: headerfiles">
</head>
<body>
  <header th:insert="fragments.html :: nav"></header>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2 class="display-4">Cart Items</h2>
                <hr class="featurette-divider">
            </div> 
            
			<hr class="featurette-divider">
            
            <div class="col-md-12">
                <table class="table table-bordered table-striped table-light table-hover text-center">
                        <thead>
                           <tr>
                               <td>Product</td>
                               <td>Unit Price($)</td>
                               <td>Quantity</td>
                               <td>Price($)</td>
             
                           </tr> 
                           <!--INSERT DATA FOR PRODUCTS HERE-->
                        </thead>
                        
                        <tbody>
							<tr th:each="r : ${res}">
					           <td th:text="${r.title}" />
					           <td th:text="${r.price}"/>
					       	   <td th:text="${r.quantity}"/>
					       	   <td th:text="${r.totalPrice}"/>
						     </tr>
					</tbody>
                </table>
                <div class="row">
	                <div class="col-9"></div>
	                <div class="col">
	                 	<h4  th:inline="text">Grand Total: $[[${total}]]</h4>
	            	</div>
        		</div>
                
            </div>
            
        </div>

  <div th:replace="fragments.html :: footer"></div>
</body>
</html>