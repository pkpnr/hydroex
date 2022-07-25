<?php

    $pageNm = 'Shopping Cart';

    include('db.php');
    include('header.php');
    // include('nav_shop.php');
?>

<style><?php include '../css/cart.css' ?></style>

<body>

 
    <div class="div1">
    <div class="shop1">
    <input class="t1" type="text" id="S1I1" value="0"></input> 
    <input class="t2" type="text" id="S1I2" value="0"></input> 
    <input class="t3" type="text" id="S1I3" value="0"></input> 
    <input class="t4" type="text" id="S1I4" value="0"></input> 
    </div>
<!-- div1 -->

    <div class="shop2">
    <input class="t1" type="text" id="S2I1" value="0"></input> 
    <input class="t2" type="text" id="S2I2" value="0"></input> 
    <input class="t3" type="text" id="S2I3" value="0"></input> 
    <input class="t4" type="text" id="S2I4" value="0"></input> 
    </div>
<!-- div2 -->

    <div class="shop3">
    <input class="t1" type="text" id="S3I1" value="0"></input> 
    <input class="t2" type="text" id="S3I2" value="0"></input> 
    <input class="t3" type="text" id="S3I3" value="0"></input> 
    <input class="t4" type="text" id="S3I4" value="0"></input> 
    </div>
<!-- div3 -->

    <div class="shop4">SHOP4</div>
<!-- div4 -->

<div class="shop5">SHOP5</div>
<!-- div5 -->

 
        <div class="shop6">
 
    <p>Payment option</p> 
    <br>    
    <img class="ocd" src="../image/IC1.png" onclick="add()" > 
    <img class="ocd" src="../image/IC3.png" onclick="add()"> 
<br>
  

    <div id="newpost"  class="hidden">
        <form method="POST" action="cart_proc.php">
            <p/>Total:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" name="total" class="details" id="res"></input><br>  
            <p/>First Name:&nbsp;&nbsp;&nbsp;<input type="text" name="fname" class="details" placeholder="Enter receiver's First Name" id="name"></input> <br>  
            <p/>Last Name:&nbsp;&nbsp;&nbsp;<input type="text" name="lname" class="details" placeholder="Enter receiver's Last Name" id="name"></input> <br>  
            <p/>Address:<input type="text" name="address" class="details" placeholder="Enter receiver's Address" id="address"></input><br>  
            <p/>Contact:<input type="text" name="cont_num" class="details" placeholder="Enter receiver's Contact Number" id="contact"></input><br>   
            <br>
            <input type="submit" name="submit" value="Purchase" class="purchase" />
        </form>
    </div>


</div>

<!-- div6 -->



</div>

<script src="../js/cart.js">
    
</script>


<?php
    include('footer.php');
?>