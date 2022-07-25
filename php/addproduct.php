<?php 
include('db.php');
$product=$_POST['product'];
$description=$_POST['description'];
$picture=$_POST['picture'];
$sql="INSERT INTO `product` ( `name`, `desc`,`img`) VALUES ('$product', '$description','$picture');";
$run=mysqli_query($con,$sql);
header("location:../php/admin.php");
 ?>