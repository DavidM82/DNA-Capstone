<!DOCTYPE html>
<html>
<head>
    <head th:insert="fragments.html :: headerfiles">

	<script>
		$.fn.dataTable.ext.search.push(
		    function( settings, data, dataIndex ) {
		        var min = parseFloat( $('#min').val());
		        var max = parseFloat( $('#max').val());
		        var age = parseFloat( data[6] ) || 0; // use data for the age column
		 
		        if ( ( isNaN( min ) && isNaN( max ) ) ||
		             ( isNaN( min ) && age <= max ) ||
		             ( min <= age   && isNaN( max ) ) ||
		             ( min <= age   && age <= max ) )
		        {
		            return true;
		        }
		        return false;
		    }
		);
		
		$(document).ready(function() {
			
		   var table = $('#example').DataTable({
		    	 "lengthMenu": [ [5, 10, 25, 50, -1], [5, 10, 25, 50, "All"] ],
		    	  searchHighlight: true,
		    	 
		    });
		   // Event listener to the two range filtering inputs to redraw on input
		    $('#min, #max').keyup( function() {
		        table.draw();
		    } );
		    myTable.on( 'draw', function () {
	            var body = $( myTable.table().body() );
	            body.unhighlight();
	            body.highlight( myTable.search() );  
	        } );
		   
		});
	</script>
<body>
	<header th:insert="fragments.html :: nav"></header>

	<div class="container p-2">
		<h1>All Products</h1>
		<hr class="featurette-divider">

		<!-- TODO: The following filter currently does not work -->
    	<div class="col text-right">
    		<input type="number" id="min" step="0.01" placeholder="Minimum price">
    		<input type="number" id="max" step="0.01" placeholder="Maximum price">
    	</div>
    	<!-- TODO end -->

		<table id="example"  class="table table-bordered table-striped table-light table-hover">
			<thead class="thead-dark">
				<tr>
					<th>Product Name</th>
					<th>Artist</th>
					<th>Genre</th>
					<th>Category</th>
					<th>Type</th>
					<th>Price ($)</th>
					<th style="display:none;">Description</th>
					<th></th>
				</tr>
			</thead>
			<tbody>
				<tr th:each="r,state : ${results}">
		           <td th:text="${r.title}" />
		           <td th:text="${r.artist}"/>
		           <td th:text="${r.category.genre.name}"/>
		           <td th:text="${r.category.name}"/>
		           <td th:text="${r.type}"/>
		           <td th:text="${r.price}"/>
		           <td style="display:none;" th:text="${r.description}"/>
		           <td><a th:href="@{/music/aboutProduct(productId=${r.pid})}" class="btn btn-outline-info btn-sm">Info</a></td>
			    </tr>
			</tbody>
		</table>		
	</div>
	
	<div th:replace="fragments.html :: footer"></div>
</body>
</html>