<?php
    session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo $pageNm; ?></title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="../css/style.css">

</head>
<body>

    
<!-- header section starts  -->

<header class="header">

    <a href="index.php" class="logo"> </i> HydroEx </a>
    <!--<a href="index.php" class="logo"> <i class="fas fa-shopping-basket"></i> HydroEx </a>-->

    <nav class="navbar">
        <?php
        
            echo '<a href="index.php">Home</a>';

            if(isset($_SESSION['email'])) 
            {
                echo '<a href="shop_ALL_ITEMS.php">Shops</a>';
            }

            echo '<a href="review.php">Reviews</a>';

            if(isset($_SESSION['email'])) 
            {
                echo '<a href="profile.php">Profile</a>';
            }

            echo '<a href="about.php">About</a>';
        ?>
    </nav>

    <div class="icons">
        <div id="menu-btn" class="fas fa-bars"></div>
        <div id="search-btn" class="fas fa-search"></div>
        <div id="cart-btn" class="fas fa-shopping-cart"><a href="cart.php"></a></div>

        <?php
            if (isset($_SESSION['email'])) 
            {
                // echo '<div id="cart-btn" class="fas fa-shopping-cart"><a href="cart.php"></a></div>';

                echo '<h2 style="margin-left: 8em;"><a href="logout.php">Log Out</a></h2>';
            }
            else
            {
                echo '<div id="login-btn" class="fas fa-user"></div>';
            }
        ?>
    </div>

    <form action="" class="search-form">
        <input type="search" placeholder="Browse products..." id="search-box">
        <label for="search-box" class="fas fa-search"></label>
    </form>

    <div class="shopping-cart">
        <?php
            if(!empty($_SESSION["shopping_cart"]))
            {
                $total = 0;
                foreach($_SESSION["shopping_cart"] as $k => $v):
        ?>    
                <div class="box">
                    <a href="<?php echo $fileNm; ?>.php?action=delete&id=<?php echo $v["id"]; ?>" class="fas fa-times"></a>
                    <img src="../image/<?php echo $v["img"]; ?>" alt="">
                    <div class="content"> 
                        <h3><?php echo $v["name"]; ?></h3>
                        <h4><?php echo $v["desc"]; ?></h4>
                        <span class="quantity"><?php echo $v["qty"]; ?></span>
                        <span class="multiply">x</span>
                        <span class="price">₱<?php echo $v["price"]; ?>.00</span>
                    </div>
                </div>
        <?php 
                $total = $total + ($v["qty"] * $v["price"]); 
                endforeach;
        ?>
        <h3 class="total"> Total : <span>₱<?php echo $total + 19; ?>.00</span> </h3>
        <h4 style="text-align:center;">(₱<?php echo $total;?>.00 + ₱19.00 delivery fee)</h4>
        <form method="POST" action="order_proc.php"> 
            <input type="hidden" id="cart_det" name="hid_cart_det" value="<?php echo $_SESSION["shopping_cart"]; ?>">
            <input type="hidden" id="ord_total" name="hid_total" value="<?php echo $total; ?>">
            <input type="hidden" name="hid_email" value="<?php echo $_SESSION["email"]; ?>">
            <button type="submit" name="submit" class="btn">Place order</button>
        </form>
        <?php 
              }
              else
              {
                  echo '<h1>Cart is empty.</h1>';
              } 
        ?>
    </div>

    <?php
    require('db.php');
    // When form submitted, check and create user session.
    if (isset($_POST['email'])) {
        $email = stripslashes($_REQUEST['email']);    // removes backslashes
        $email = mysqli_real_escape_string($con, $email);
        $pwd = stripslashes($_REQUEST['pwd']);
        $pwd = mysqli_real_escape_string($con, $pwd);

        // Check user is exist in the database
        $query = "SELECT * FROM `customer` WHERE email='$email' AND pwd='". md5($pwd) . "';";

        $result = mysqli_query($con, $query) or die(mysql_error());
        $rows = mysqli_num_rows($result);
        // $users = mysqli_fetch_row($result);

        if ($rows == 1) {

            $users = mysqli_fetch_row($result);

            foreach($users as $user)
            {
                $_SESSION['email'] = $email;

                if($_SESSION['email'] == "admin@hydroex.com")
                {
                    // echo '<script>window.location = "admin.php";</script>'; 
                    header('Location: admin.php');
                }
                else
                {
                    // Redirect to user main page
                    header('Location: index.php');
                }

                exit();
            }
        } else {
            echo "<script>
            alert('Incorrect email and/or password.');
            location = 'index.php';
            </script>";
        }
    }   
    else 
    {
?>

    <form method="POST" class="login-form">
        <h3>Login</h3>
        <input type="email" name="email" placeholder="Email" class="box">
        <input type="password" name="pwd" placeholder="Password" class="box">
        <div class="remember">
            <!-- <input type="checkbox" name="" id="remember-me">
            <label for="remember-me">Remember me</label> -->
        </div>
        <input type="submit" value="Login" class="btn">
        <!-- <p>Forgot password? <a href="#">Click here</a></p> -->
        <p>Doesn't have an account yet? <a href="reg.php">Register</a></p>
    </form>

<?php 
    }
?>

</header>