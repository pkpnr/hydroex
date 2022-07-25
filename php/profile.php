<?php
    $pageNm = 'Profile';
    include('db.php');
    include('header.php');
?>

<div class="heading">
    <h1>PROFILE</h1>
    <p> <a href="index.php"><b> Home >> </b></a><b>Profile</b></p>
</div>

<?php
    $sql = 'SELECT * FROM customer WHERE email = "' . $_SESSION['email'] . '";';

    $res = mysqli_query($con, $sql);
    $users = mysqli_fetch_all($res, MYSQLI_ASSOC);

    foreach($users as $user)
    {
        echo '<section class="contact">

    <div class="name">
        <img src="../image/' . $user['prof_img'] .'" alt="">
        <div class="content">
            <h3>' . $user['fname'] . ' ' . $user['lname'] . '</h3>
        </div>
    </div>
</section>

<section class="contact">

    <div class="icons-container">

        <div class="icons">
            <i class="fas fa-phone"></i>
            <h3>Number</h3>
            <p>' . $user['cont_num'] . '</p>
        </div>

        <div class="icons">
            <i class="fas fa-envelope"></i>
            <h3>Email</h3>
            <p>' . $user['email'] . '</p>
        </div>

        <div class="icons">
            <i class="fas fa-map-marker-alt"></i>
            <h3>Address</h3>
            <p>' . $user['address'] . '</p>
        </div>

    </div>';
    }

?>

    <div class="row">

        <form action="">
            <h3>Additional Address</h3>
            <div class="inputBox">
                <input type="text" placeholder="Street no." class="box">
                <input type="email" placeholder="Barangay" class="box">
            </div>
            <div class="inputBox">
                <input type="number" placeholder="Phone Number" class="box">
                <input type="text" placeholder="Label" class="box">
            </div>
            <textarea placeholder="(Optional) Additional notes:" cols="30" rows="10"></textarea>
            <input type="submit" value="Add address" class="btn">
        </form>

        <iframe class="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d15784.660922210622!2d124.65375026951466!3d8.483309925430996!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x32fff2c095854673%3A0x41996445358510f1!2sLapasan%2C%20Cagayan%20de%20Oro%2C%20Misamis%20Oriental!5e0!3m2!1sen!2sph!4v1642615510097!5m2!1sen!2sph" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy"></iframe>

    </div>

</section>


<?php
    include('footer.php');
?>