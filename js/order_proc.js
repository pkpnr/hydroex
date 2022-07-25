function order_proc(){

    var total = $('#ord_total').val();
    var cart_det = $('#cart_det').val();

    // $('#loadingbar').show();
    window.location = "../order_load.html"

    $.ajax({
        method: "POST",
        url: "../php/header.php",
        data: { 
            name: total, cart_det 
        }
    })
    .done(function( msg ) {
        //msg here is the returned data from dowload.php
        alert("Yay nigana!");
        // $('#myfield').val('');
    });
};