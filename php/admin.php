<?php
	session_start();
?>

<!DOCTYPE html>
<html>
<head>
   
	<title>Admin Area - User Management Section</title>
</head>
<style>
table, th, td {
	width: 100%;
	height: 50px;
  border: 1px solid black;
  text-align: center;
  font-family: 'Montserrat', sans-serif;
    color: black;
}
.admin{
	height: 500px;
	width: 100%;

}

@font-face{
	 src: url("https://fonts.googleapis.com/css2?family=Montserrat:wght@500&display=swap");
  font-family: 'Montserrat', sans-serif;
}
.header{
	height: 80px;
	width: 100%;
	border: 1px solid black;
	margin-bottom: 20px;
	background-color: #3399ff;

  
}
.Shop{
		
    font-family: 'Montserrat', sans-serif;
    color: white;
    font-size: 1.5rem;
    font-weight: bolder;
    padding-left: 2rem;
  
}
div.addproduct{
background-color: #3399ff;
border: 1px solid black;
position: absolute;
margin-left: 10%;
height: 600px;
width: 700px;
font-family: 'Montserrat', sans-serif;
}
div.approve{
background-color: #3399ff;
border: 1px solid black;
position: absolute;
margin-left: 50%;
height: 900px;
width: 1000px;
}
.Product{
	 font-family: 'Montserrat', sans-serif;
    color: black;
    font-size: 1rem;
border: none;
height:30px;
width: 70%;
padding-left: 10px;
margin-left: 2%;
}
.button{
	background-color: white;
	 font-family: 'Montserrat', sans-serif;
    color: black;
    font-size: 1rem;
    margin-left: 10px;
    font-weight: bold;
}
</style>
<body>
<div class="header"><p class="Shop">HydroEX Admin & Shop Addition</p></div>	




<div class="admin">
	<!-- PRODUCT SITE -->
<div class="addproduct">
	<form class="form" action="addproduct.php" method="POST">                     
                    <p class="Shop" style="color: black">Product Addtion</p>
                    <input type="text" class="Product" name="product" placeholder="Product Name" required />
                    <br> <br>
                    <input type="text" class="Product" name="description" placeholder="Product Description" required />
                    <br> <br>
                     <input type="file" name="picture" id="file"  class="Product"/>
                      <br> <br>
                    <input type="submit" name="submit" value="Add Product" class="button"/>
 </form>

</div>
<!-- APPROVE SITE -->
<div class="approve">
	<section>
    	<div>
    		<div>
    			<div>
    				<table style="table-layout: fixed;">
    					<thead>
    						<tr>
    							<th>Order ID</th>
    							<th>Transaction ID</th>
    							<th>Total</th>
    							<th>Aqua Best</th>
    							<th>Nature Spring</th>
    							<th>Haven's Dwell</th>
    							<th>Palm Fresh</th>
    							<th>Viel</th>
    							<th>Confirm</th>
    						</tr>
    					</thead>
                     <?php
                              include('db.php');

                              $admin="SELECT * FROM order_details";

                              $run=mysqli_query($con,$admin);

                              while ($row=mysqli_fetch_array($run)) {
                              	$user_id=$row[0];
                              	$trans=$row[1];
                              	$total=$row[2];
                              	$aqua=$row[3];
                              	$nature=$row[4];
                              	$haven=$row[5];
                              	$palm=$row[6];
                              	$viel=$row[7];
                              
                              	?>
                  <tr>
                  	    <td><?php echo $user_id ?></td>
                  		<td><?php echo $trans ?></td>
                  		<td><?php echo $total ?></td>
                  		<td><?php echo $aqua ?></td>
                  		<td><?php echo $nature ?></td>
                  		<td><?php echo $haven ?></td>
                  		<td><?php echo $palm ?></td>
                  		<td><?php echo $viel ?></td>
                  		
  <td><a href="delete.php?del=<?php echo $user_id?>">  
  	<button class="button">Approve</button></a>
  </td>
                  </tr>
             <?php }?>
    				</table>
    			</div>
    		</div>
    	</div>
    </section>
</div>

</div>




    </body>
</html>








