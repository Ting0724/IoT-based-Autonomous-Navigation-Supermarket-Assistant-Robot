<?php
    header("Access-Control-Allow-Origin: *");
    include("connection.php");
    
    $sql_h = "TRUNCATE TABLE supermarketrobot.holdlistofitem;";
    $result_h = mysqli_query($conn, $sql_h);
    echo "Completed";
?>

