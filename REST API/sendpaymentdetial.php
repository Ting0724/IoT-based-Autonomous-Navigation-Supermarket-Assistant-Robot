<?php
    header("Access-Control-Allow-Origin: *");
    include("connection.php");
    
    $Toothpaste = $_POST['Toothpaste_qty'];
    $Shampoo = $_POST['Shampoo_qty'];
    $Soap = $_POST['Soap_qty'];
    $Toilet_paper = $_POST['Toilet_paper_qty'];
    $Laundry_detergent = $_POST['Laundry_detergent_qty'];
    $Dishwashing_liquid = $_POST['Dishwashing_liquid_qty'];
    $Facial_tissues = $_POST['Facial_tissues_qty'];
    $Trash_bags = $_POST['Trash_bags_qty'];
    $Aluminum_foil = $_POST['Aluminum_foil_qty'];
    $Plastic_wrap = $_POST['Plastic_wrap_qty'];
    $Cleaning_spray = $_POST['Cleaning_spray_qty'];
    $Hand_sanitizer = $_POST['Hand_sanitizer_qty'];
    $Total_price = $_POST['Total_price'];
    $User_email = $_POST['User_email'];
    /*
    $Toothpaste = 1;
    $Shampoo = 2;
    $Soap = 0;
    $Toilet_paper = 1;
    $Laundry_detergent = 0;
    $Dishwashing_liquid = 0;
    $Facial_tissues = 0;
    $Trash_bags = 0;
    $Aluminum_foil = 0;
    $Plastic_wrap = 0;
    $Cleaning_spray = 0;
    $Hand_sanitizer = 0;
    $Total_price = 33;
    $User_email = '1001954392@ucsiuniversity.edu.my';
    */

    $sql_h = "INSERT INTO `supermarketrobot`.`paymenthistory` (`date`, `Toothpaste`, `Shampoo`, `Soap`, `Toilet paper`, `Laundry detergent`, `Dishwashing liquid`, `Facial tissues`, `Trash bags`, `Aluminum foil`, `Plastic wrap`, `Cleaning spray`, `Hand sanitizer`, `Total price`, `Useremail`, `Sendaction`) VALUES (CURRENT_TIMESTAMP(), '{$Toothpaste}', '{$Shampoo}', '{$Soap}', '{$Toilet_paper}', '{$Laundry_detergent}', '{$Dishwashing_liquid}', '{$Facial_tissues}', '{$Trash_bags}', '{$Aluminum_foil}', '{$Plastic_wrap}', '{$Cleaning_spray}', '{$Hand_sanitizer}', '{$Total_price}', '{$User_email}', 1);";
    //$sql_h = "UPDATE `supermarketrobot`.`navigation` SET `action` = '{$action}', `coordinate` = '{$coordinate}' WHERE `ActionID` = 0;";
    $result_h = mysqli_query($conn, $sql_h);
    echo "Completed";
?>



