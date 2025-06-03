<?php
    header("Access-Control-Allow-Origin: *");
    include("connection.php");

    $Problem = $_POST['Problem'];

    $sql_h = "UPDATE `supermarketrobot`.`callstaff` SET `Problem` = '{$Problem}', `SendAction` = 1 WHERE `RobotID` = 1;";
    $result_h = mysqli_query($conn, $sql_h);
    echo "Completed";
?>

