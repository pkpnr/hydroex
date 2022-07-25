<?php
    // Enter your host name, database username, password, and database name.
    // If you have not set database password on localhost then set empty.
    $con = mysqli_connect("localhost","root", "","hydroex");
    // Check connection
    if (mysqli_connect_errno()){
        echo "Failed to connect to MySQL: " . mysqli_connect_error();
    }

    // <?php

    // $dsn = 'mysql:host=localhost;dbname=hydroex';
    // $username = 'root';
    // $password = '';

    // try 
    // {
    //     // connect to mysql
    //     $con = new PDO($dsn,$username, $password);
    //     $con->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    // } catch (Exception $ex) {
    //     echo 'Not Connected '.$ex->getMessage();
    // }
?>
