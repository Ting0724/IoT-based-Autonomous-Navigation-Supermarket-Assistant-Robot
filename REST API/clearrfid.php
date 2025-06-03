<?php
    header("Access-Control-Allow-Origin: *");
    include("connection.php");
    
    $sql_h = "UPDATE `supermarketrobot`.`rfidcheck` SET `ItemID` = 0 WHERE `RFID` = 0;";
    $result_h = mysqli_query($conn, $sql_h);
    echo "Completed";
?>

