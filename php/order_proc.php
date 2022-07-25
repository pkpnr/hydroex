<?php
    $pageNm = 'Receipt';
    // include('auth_session.php');
    include('header.php');
    
?>
<html>

<head>
    <link rel="stylesheet" href="../css/order_proc.css"></link>  
    <title>Order Invoice</title>
</head>

<?php
    
    session_start();

    include('db.php');

    if(isset($_POST["submit"]))
    {
        $sql = 'SELECT * FROM customer WHERE email = "' . $_POST['hid_email'] . '";';
    

        $res = mysqli_query($con, $sql);
        $users = mysqli_fetch_all($res, MYSQLI_ASSOC);

        foreach($users as $user):
?>
    <body>

        <div class="orderDone">
            <form action="" method="POST">
                <button class="btn" name="backToHome" type="submit">Back to Home</button>
            </form>
        </div>
        
        <div class="invoice">
            <!-- <div class="company-address">
                ACME ltd
                <br />
                489 Road Street
                <br />
                London, AF3Z 7BP
                <br />
            </div> -->
        
            <div class="invoice-details">
                Phone Number: <?php echo $user["cont_num"]; ?>
                <br />
                Date: <?php echo date("Y-m-d"); ?>
            </div>
            
            <div class="customer-address">
                To:
                <br />
                <?php echo $user["fname"] . " " . $user["lname"]; ?>
                <br />
                <?php echo $user["address"]; ?>
                <br />
            </div>
<?php
        endforeach;

        $_POST["hid_cart_det"] = $_SESSION["shopping_cart"];

        $aqb = 0; 
        $pf = 0;
        $ns = 0;
        $hd = 0;
        $viel = 0;

        foreach($_SESSION["shopping_cart"] AS $k => $v)
        {
            if(strpos($v["name"], "Aquabest") !== false)
            {
                $GLOBALS["aqb"] += $v["qty"] * $v["price"];
            }
            else if(strpos($v["name"], "Palm Fresh") !== false)
            {
                $GLOBALS["pf"] += $v["qty"] * $v["price"];
            }
            else if(strpos($v["name"], "Nature's Spring") !== false)
            {
                $GLOBALS["ns"] += $v["qty"] * $v["price"];
            }
            else if(strpos($v["name"], "Haven's Dwelling") !== false)
            {
                $GLOBALS["hd"] += $v["qty"] * $v["price"];
            }
            else if(strpos($v["name"], "Viel") !== false)
            {
                $GLOBALS["viel"] += $v["qty"] * $v["price"];
            }
        }

        $tot = (float)$_POST["hid_total"] + 19;
        $email = $_POST["hid_email"]; //$_SESSION['email'];
        $trns_date = date("Y-m-d H:i:s");

        $stmt = $con->prepare("INSERT into `transaction` (customer_id, trns_date)
        VALUES ((SELECT cust_id FROM customer WHERE email = '$email'), ?);");
        $stmt->bind_param("s", $trns_date);
        $stmt->execute();

        $stmt2 = $con->prepare("INSERT into `order_details` (trans_id, order_total, aqb_tot, pf_tot, ns_tot, hd_tot, v_tot) VALUES ('$stmt->insert_id', ?, ?, ?, ?, ?, ?);");
        $stmt2->bind_param("dddddd", $tot, $aqb, $pf, $ns, $hd, $viel);
        $stmt2->execute();


        $stmt3 = $con->prepare("INSERT into `deliveries` (trans_id, cust_id) VALUES ('$stmt->insert_id',
             (
                 SELECT cust_id FROM customer WHERE email = '$email'
             )
        );");
        $stmt3->execute();


        if ($stmt && $stmt2 && $stmt3) 
        {
            echo "<script>
            alert('Order successful! You have now placed your order.');
            </script>";

            $stmt->close();
            $stmt2->close();
            $stmt3->close();
        }
?>
            
            <div class="clear-fix"></div>
                <table border='1' cellspacing='0'>
                    <tr>
                        <th width=250>Product Name</th>
                        <th width=80>Quantity</th>
                        <th width=100>Unit Price</th>
                        <th width=100>Total Price</th>
                    </tr>

                <?php
                        $total = 0;
                        foreach($_SESSION["shopping_cart"] as $k => $v)
                        {
                                echo("<tr>");
                                echo("<td class='text-left'>" . $v["name"] . " (" . $v["desc"] . ")</td>");
                                echo("<td class='text-center'>" . $v["qty"] . "</td>");
                                echo("<td class='text-right'>₱" . $v["price"] . ".00</td>");
                                echo("<td class='text-right'>₱" . ($v["qty"] * $v["price"]) . ".00</td>");

                                $total = $total + ($v["qty"] * $v["price"]);
                        }
                        
                        echo("<tr>");
                        echo("<td colspan='3' class='text-right'>Sub total</td>");
                        echo("<td class='text-right'>₱" . $_POST["hid_total"] . ".00</td>");
                        echo("</tr>");
                        echo("<tr>");
                        echo("<td colspan='3' class='text-right'>Delivery Fee</td>");
                        echo("<td class='text-right'>₱" . 19 . ".00</td>");
                        echo("</tr>");
                        echo("<tr>");
                        echo("<td colspan='3' class='text-right'><b>TOTAL</b></td>");
                        echo("<td class='text-right'><b>₱" . ($_POST["hid_total"] + 19) . ".00</b></td>");
                        echo("</tr>");
                    }

                    if(isset($_POST["backToHome"]))
                    {
                        unset($_SESSION["shopping_cart"]);
                        echo '<script>alert("Thank you for purchasing at HydroEx.")</script>';
                        echo '<script>window.location = "index.php";</script';
                    }


                ?>
                </table>
            </div>
    </body>

</html>

<?php
    include('footer.php');
?>