<?php

    include('db.php');
    include('header.php');
    include('nav_shop_products.php');

    // mysql select query
    if(isset($pageNm))
    {
        if ($pageNm == 'Aquabest')
        {
            // $pageNm = 'Alkaline';

            $sql = 'SELECT p.*, wsp.price FROM product AS p INNER JOIN water_station_product AS wsp USING (product_id) WHERE name LIKE "%Aquabest%" ORDER BY product_id ASC;';
        }
        if ($pageNm == "Havens Dwelling")
        {
            $sql = "SELECT p.*, wsp.price FROM product AS p INNER JOIN water_station_product AS wsp USING (product_id) WHERE name LIKE '%Haven''s Dwelling%' ORDER BY product_id ASC;";
        }
        if ($pageNm == "Natures Spring")
        {
            $sql = "SELECT p.*, wsp.price FROM product AS p INNER JOIN water_station_product AS wsp USING (product_id) WHERE name LIKE '%Nature''s Spring%' ORDER BY product_id ASC;";
        }
        if ($pageNm == 'Palm Fresh')
        {
            $sql = 'SELECT p.*, wsp.price FROM product AS p INNER JOIN water_station_product AS wsp USING (product_id) WHERE name LIKE "%Palm Fresh%" ORDER BY product_id ASC;';
        }
        if ($pageNm == 'Viel')
        {
            $sql = 'SELECT p.*, wsp.price FROM product AS p INNER JOIN water_station_product AS wsp USING (product_id) WHERE name LIKE "%Viel%" ORDER BY product_id ASC;';
        }
        if ($pageNm == 'Shops')
        {
            $sql = 'SELECT p.*, wsp.price FROM product AS p INNER JOIN water_station_product AS wsp USING (product_id) ORDER BY product_id ASC;';
        }
    }

    if(isset($pageNm))
    {
        if ($pageNm == 'Alkaline')
        {
            // $pageNm = 'Alkaline';

            $sql = 'SELECT product.*, price FROM product INNER JOIN water_station_product USING (product_id) WHERE name LIKE "%Alkaline%" ORDER BY product_id ASC;';
        }
        if ($pageNm == 'Bottled')
        {
            $sql = 'SELECT product.*, price FROM product INNER JOIN water_station_product USING (product_id) WHERE name LIKE "%Bottled%" ORDER BY product_id ASC;';
        }
        if ($pageNm == 'Distilled')
        {
            $sql = 'SELECT product.*, price FROM product INNER JOIN water_station_product USING (product_id) WHERE name LIKE "%Distilled%" ORDER BY product_id ASC;';
        }
        if ($pageNm == 'Others')
        {
            $sql = 'SELECT product.*, price FROM product INNER JOIN water_station_product USING (product_id) WHERE name NOT LIKE "%Alkaline%" AND name NOT LIKE "%Bottled%" AND name NOT LIKE "%Distilled%" AND name NOT LIKE "%Purified%" ORDER BY product_id ASC;';
        }
        if ($pageNm == 'Purified')
        {
            $sql = 'SELECT product.*, price FROM product INNER JOIN water_station_product USING (product_id) WHERE name LIKE "%Purified%" ORDER BY product_id ASC;';
        }
        if ($pageNm == 'Shops')
        {
            $sql = 'SELECT product.*, price FROM product INNER JOIN water_station_product USING (product_id) ORDER BY product_id ASC;';
        }
    }


    $res = mysqli_query($con, $sql);
    $products = mysqli_fetch_all($res, MYSQLI_ASSOC);

    if(isset($_POST["addToCart"]))
    {
        if(isset($_SESSION["shopping_cart"]))
        {
            $item_arr_id = array_column($_SESSION["shopping_cart"], "id");
            if(!in_array($_GET["id"], $item_arr_id))
            {
                $count = count($_SESSION["shopping_cart"]);
                $item_arr = array(
                    'id' => $_GET["id"],
                    'name' => $_POST['hid_nm'],
                    'desc' => $_POST["hid_desc"],
                    'price' => $_POST['hid_price'],
                    'qty' => $_POST['qty'],
                    'img' => $_POST['hid_img'],
                );

                $_SESSION["shopping_cart"][$count] = $item_arr;

                echo '<script>window.location="' . $fileNm . '.php";</script>';
            }
            else
            {
                echo '<script>alert("Item already added!");</script>';
                echo '<script>window.location="' . $fileNm . '.php";</script>';
            }
        }
        else
        {
            $item_arr = array(
                'id' => $_GET["id"],
                'name' => $_POST['hid_nm'],
                'desc' => $_POST["hid_desc"],
                'price' => $_POST['hid_price'],
                'qty' => $_POST['qty'],
                'img' => $_POST['hid_img'],
            );

            $_SESSION["shopping_cart"][0] = $item_arr;
        }
    }

    if(isset($_GET["action"]))
    {
        if($_GET["action"] == "delete")
        {
            foreach($_SESSION["shopping_cart"] as $k => $v)
            {
                if($v["id"] == $_GET["id"])
                {
                    unset($_SESSION["shopping_cart"][$k]);
                    echo '<script>alert("Item removed.")</script>';
                    echo '<script>window.location = "' . $fileNm . '.php";</script';
                }
            }
        }
    }

?>



    <?php foreach ($products as $product): ?>
        <form method="POST" action="<?php echo $fileNm; ?>.php?action=add&id=<?php echo $product["product_id"]; ?>">
            <div class="box">
                    <div class="icons">
                        <input type="text" name="qty" value="0" style="width: 3em; font-size: 30px;">
                        <button type="submit" name="addToCart"><a class="fas fa-shopping-cart"></a></button>
                    </div>
                <div class="image">
                    <img src="../image/<?php echo $product["img"]; ?>" alt="">
                </div>
                <div class="content">
                    <h3><?php echo $product["name"] ?></h3>
                    <h4><?php echo $product["desc"]; ?>
                <div class="price">₱<?php echo $product["price"]; ?>.00</div>
                <input type="hidden" name="hid_nm" value="<?php echo $product['name']; ?>">
                <input type="hidden" name="hid_desc" value="<?php echo $product['desc']; ?>">
                <input type="hidden" name="hid_price" value="<?php echo $product['price']; ?>">
                <input type="hidden" name="hid_img" value="../image/<?php echo $product['img']; ?>">
                <div class="stars">
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="fas fa-star"></i>
                            <i class="far fa-star"></i>
                        </div>
                    </div>
            </div>
        </form>
    <?php endforeach; ?>
