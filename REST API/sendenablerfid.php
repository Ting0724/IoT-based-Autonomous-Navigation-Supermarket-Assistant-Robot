<?php
    header("Access-Control-Allow-Origin: *");
    include("connection.php");

    $rfid_read = $_POST['RFIDRead'];
    $rfid_payment = $_POST['RFIDPayment'];
    
    $sql_h = "UPDATE `supermarketrobot`.`rfid_enable` SET `rfid_read` = '{$rfid_read}', `rfid_payment` = '{$rfid_payment}' WHERE `RobotID` = 1;";
    $result_h = mysqli_query($conn, $sql_h);
    echo "Completed";
?>
