<?php
    $pageNm = 'Home';
    // include('auth_session.php');
    include('header.php');
    
?>

<section class="home">

    <div class="slides-container">

        <div class="slide active">
            <div class="content">
                <span>Cure for dry mouth</span>
                <h3>Body thirst</h3>
                <a href="shop_ALL_ITEMS.php" class="btn">shop now</a>
            </div>
            <div class="image">
                <img src="../image/W1.png" alt="">
            </div>
        </div>

        <div class="slide">
            <div class="content">
                <span>Cure for dry mouth</span>
                <h3>Body thirst</h3>
                <a href="shop_ALL_ITEMS.php" class="btn">shop now</a>
            </div>
            <div class="image">
                <img src="../image/W2.png" alt="">
            </div>
        </div>

        <div class="slide">
            <div class="content">
                <span>Cure for dry mouth</span>
                <h3>Body thirst</h3>
                <a href="shop_ALL_ITEMS.php" class="btn">shop now</a>
            </div>
            <div class="image">
                <img src="../image/W3.png" alt="">
            </div>
        </div>

    </div>

    <div id="next-slide" class="fas fa-angle-right" onclick="next()"></div>
    <div id="prev-slide" class="fas fa-angle-left" onclick="next()"></div>

</section>

<section class="banner-container">

    <div class="banner">
        <img src="../image/W1BG.png" alt="">
        <div class="content">
            <span>Limited-time sale</span>
            <h3>Up to 50% OFF</h3>
            <a href="shop_ALL_ITEMS.php" class="btn">shop now</a>
        </div>
    </div>

    <div class="banner">
        <img src="../image/W2BG.png" alt="">
        <div class="content">
            <span>Limited-time offers</span>
            <h3>Free delivery</h3>
            <a href="shop_ALL_ITEMS.php" class="btn">shop now</a>
        </div>
    </div>

    <div class="banner">
        <img src="../image/W3BGF.png" alt="">
        <div class="content">
            <span>Limited-time PRO access</span>
            <h3>Huge discounts</h3>
            <a href="shop_ALL_ITEMS.php" class="btn">shop now</a>
        </div>
    </div>

</section>



<?php
    include('footer.php');
?>