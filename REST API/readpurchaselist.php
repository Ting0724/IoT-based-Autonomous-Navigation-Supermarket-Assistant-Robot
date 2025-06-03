<?php
    header("Access-Control-Allow-Origin: *");
    include("connection.php");
    
    $sql_RFID = "SELECT * FROM supermarketrobot.holdlistofitem;";
    $result_RFID = mysqli_query($conn, $sql_RFID);
    $dataRFID = mysqli_fetch_all($result_RFID);
    echo json_encode($dataRFID);
?>

