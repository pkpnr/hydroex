<?php
    session_start();
    if(!isset($_SESSION["email"])) {
        header('Location: '.$_SERVER['PHP_SELF']);
        exit();
    }
?>
