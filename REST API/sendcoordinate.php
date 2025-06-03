<?php
    header("Access-Control-Allow-Origin: *");
    include("connection.php");

    $itemid = $_POST['itemselected'];
    $action = 0;

    if ($itemid == 1) {
        $coordinate = '(2,1,R1)0';
        $action = 1;
    }
    if ($itemid == 2) {
        $coordinate = '(3,1,R1)0';
        $action = 1;
    }
    if ($itemid == 3) {
        $coordinate = '(4,1,R1)0';
        $action = 1;
    }
    if ($itemid == 4) {
        $coordinate = '(2,1,R1)0';
        $action = 1;
    }
    if ($itemid == 5) {
        $coordinate = '(3,1,R1)0';
        $action = 1;
    }
    if ($itemid == 6) {
        $coordinate = '(4,1,R1)0';
        $action = 1;
    }
    if ($itemid == 7) {
        $coordinate = '(2,1,R2)0';
        $action = 1;
    }
    if ($itemid == 8) {
        $coordinate = '(3,1,R2)0';
        $action = 1;
    }
    if ($itemid == 9) {
        $coordinate = '(4,1,R2)0';
        $action = 1;
    }
    if ($itemid == 10) {
        $coordinate = '(2,1,R2)0';
        $action = 1;
    }
    if ($itemid == 11) {
        $coordinate = '(3,1,R2)0';
        $action = 1;
    }
    if ($itemid == 12) {
        $coordinate = '(4,1,R2)0';
        $action = 1;
    }
    if ($itemid == 0) {
        $action = 0;
    }
    
    $sql_h = "UPDATE `supermarketrobot`.`navigation` SET `action` = '{$action}', `coordinate` = '{$coordinate}' WHERE `ActionID` = 0;";
    $result_h = mysqli_query($conn, $sql_h);
    echo "Completed";
?>

