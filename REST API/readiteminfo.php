<?php
    header("Access-Control-Allow-Origin: *");
    include("connection.php");
    
    $sql_Item = "SELECT * FROM supermarketrobot.itemtype;";
    $result_Item = mysqli_query($conn, $sql_Item);
    $dataItem = mysqli_fetch_all($result_Item);
    echo json_encode($dataItem);
?>

