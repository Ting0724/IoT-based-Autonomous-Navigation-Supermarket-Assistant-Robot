<?php
    $host = "localhost:3306";
    //$host = "192.168.105.19:3306";
    $user = "Ting"; 
    $pass = "ting_724";
    $db = "supermarketrobot";
    $conn = "";

    try{
        $conn = mysqli_connect($host, $user, $pass, $db);
    }
    catch (mysqli_sql_exception) {
        //echo "Could not connect <br>";
    }

    if($conn) {
        //echo "You are connected! <br>";
    }
?>