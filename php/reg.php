<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Registration</title>
	<link rel="stylesheet" href="../css/reg.css">
	<script src="../https://kit.fontawesome.com/b99e675b6e.js"></script>
</head>
<body>
<?php
    require('db.php');
    // When form submitted, insert values into the database.
    if (isset($_REQUEST['email'])) {
        $prof_img = stripslashes($_REQUEST['prof_img']);
        $prof_img = mysqli_real_escape_string($con, $prof_img);
        // removes backslashes
        $fname = stripslashes($_REQUEST['fname']);
        //escapes special characters in a string
        $fname = mysqli_real_escape_string($con, $fname);
        $lname = stripslashes($_REQUEST['lname']);
        //escapes special characters in a string
        $lname = mysqli_real_escape_string($con, $lname);
        $address = stripslashes($_REQUEST['address']);
        //escapes special characters in a string
        $address = mysqli_real_escape_string($con, $address);
        $cont_num = stripslashes($_REQUEST['cont_num']);
        //escapes special characters in a string
        $cont_num = mysqli_real_escape_string($con, $cont_num);
        $email    = stripslashes($_REQUEST['email']);
        $email    = mysqli_real_escape_string($con, $email);
        $pwd = stripslashes($_REQUEST['pwd']);
        $pwd = mysqli_real_escape_string($con, $pwd);
        $create_datetime = date("Y-m-d H:i:s");

        $query    = "INSERT into `customer` (prof_img, fname, lname, address, cont_num, pwd, email, create_datetime)
                     VALUES ('$prof_img', '$fname','$lname','$address', '$cont_num', '" . md5($pwd) . "', '$email', '$create_datetime');";
        $result   = mysqli_query($con, $query);
        if ($result) {
            echo "<script>
            alert('You have successfully registered!.')
            location = 'index.php';
            </script>";
        } else {
            echo "<div class='form'>
                  <h3>Required fields are missing.</h3><br/>
                  <p class='link'>Click here to <a href='registration.php'>registration</a> again.</p>
                  </div>";
        }
    } 
?>

        <form class="form" action="" method="POST">
            <div class="wrapper">
                <div class="left">
                    <div class="profile-pic-div">
                        <img src="../image/P8.gif"
                        alt="user" width="100" id="photo">
                        <input type="file" name="prof_img" id="file">
                        <label for="file" id="upload">Choose photo</label>
                    </div>
                </div>

                <div class="right">
                    <div class="info">
                     
                    <h1 class="login-title">Registration</h1>
                    <input type="text" class="login-input" name="fname" placeholder="First Name" required />
                    <input type="text" class="login-input" name="lname" placeholder="Last Name" required />
                    <input type="text" class="login-input" name="address" placeholder="Address" required />
                    <input type="text" class="login-input" name="cont_num" placeholder="Phone Number" required />
                    <input type="text" class="login-input" name="email" placeholder="Email Address">
                    <input type="pwd" class="login-input" name="pwd" placeholder="Password">
                    <input type="pwd" class="login-input" name="conf_pwd" placeholder="Confirm Password">
                    <input type="submit" name="submit" value="Register" class="login-button">
                </form>

                <p>Already have an account? <a href="index.php">Back to Home</a></p>
                    </div>
                  
                  
                    
            </div>

<script src="../js/reg.js"></script>
</body>
</html>