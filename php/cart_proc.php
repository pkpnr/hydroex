<?php 
    include('db.php');

    if(isset($_POST['submit'])) 
    {

        $total = $_POST['total'];

        $fname = $_POST['fname'];
        $lname = $_POST['lname'];
        $address = $_POST['address'];
        $cont_num = $_POST['cont_num'];

        $trns_date = date("Y-m-d H:i:s");


        $q1    = "INSERT into `customer` (fname, lname, address, cont_num)
                     VALUES ('$fname','$lname','$address', '$cont_num');";

        $q1 .= "INSERT into `transaction` (customer_id, trns_date)
        VALUES ((SELECT cust_id FROM customer WHERE cont_num = '$cont_num'),'$trns_date');";

        $q1 .= "INSERT into `order_details` (trans_id, subtotal)
        VALUES ((SELECT t.trans_id FROM  transaction AS t INNER JOIN customer AS c ON t.customer_id = c.cust_id WHERE c.cont_num = '$cont_num'), '$total');";

        $q1 .= "INSERT into `deliveries` (trans_id, cust_id)
        VALUES ((
                SELECT t.trans_id FROM  transaction AS t INNER JOIN customer AS c ON t.customer_id = c.cust_id WHERE c.cont_num = '$cont_num'
            ),
            (
                SELECT cust_id FROM customer WHERE cont_num = '$cont_num'
            )
        );";

        
        $res1   = mysqli_multi_query($con, $q1);

        // $res2 = mysqli_query($con, $q2);

        if ($res1) 
        {
            echo "<script>
            alert('Order successful! You have now placed your order.')
            location = 'shop_ALL_ITEMS.php';
            </script>";
        }
    }
?>