<?php 
include('db.php');

$delete=$_GET['del'];
 $update    = "INSERT into `order_approved` (OrderID,TransactionID,Total,AquaBest,NatureSpring,HavensDwell,PalmFresh,Viel)
                     SELECT order_id,trans_id,order_total,aqb_tot,ns_tot,hd_tot,pf_tot,v_tot FROM order_details WHERE order_id='$delete'";
$delete_query="delete from order_details WHERE order_id='$delete'";
$run_update=mysqli_query($con,$update);
$run=mysqli_query($con,$delete_query);
header("location:../php/admin.php");

 ?>