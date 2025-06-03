<?php
    header("Access-Control-Allow-Origin: *");
    include("connection.php");
    
    $sql_h = "UPDATE `supermarketrobot`.`navigation` SET `action` = 1, `coordinate` = '(1,1,00)1' WHERE `ActionID` = 0;";
    $result_h = mysqli_query($conn, $sql_h);
    echo "Completed";
?>


