import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:supermarket_robot_ui/API%20Controller/APIcommunication.dart';
import 'package:supermarket_robot_ui/Controller/getxvariable.dart';
import 'package:supermarket_robot_ui/Controller/itemcontroller.dart';
import 'package:supermarket_robot_ui/main.dart';

class RFIDCheck extends StatefulWidget {
  const RFIDCheck({super.key});

  @override
  State<RFIDCheck> createState() => _RFIDCheckState();
}

class _RFIDCheckState extends State<RFIDCheck> {
  final rfidfunction = APIcommunication();
  @override
  Widget build(BuildContext context) {
    feature_readrfid = 1;
    feature_paymentrfid = 0;
    feature_item = 0;
    rfidfunction.SendRFIDEnable("1","0");
    return Obx(() => Selection());
  }
}

Widget Selection() {
  ItemInfoAPI RFIDRead_GX = Get.find();
  int CheckCondition_ReadRFID = 0;
  int number = 0;
 
  if(RFIDRead_GX.CheckItemRFID.value > 0) {
    CheckCondition_ReadRFID = 1;
  }
  
  if(CheckCondition_ReadRFID > 0) {
    return ItemInfo();
  }
  else {
    return RFIDAnimation();
  }
}

Widget RFIDAnimation() {
  return Column(
    children: [
      Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text(
                "Check Item Info",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Color.fromARGB(255, 83, 82, 82)
                ),
              ),
            ),
            Text(
              "Please hold your item close to the reader",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Color.fromARGB(255, 83, 82, 82)
              ),
            )
          ],
        ),
      ),
      Lottie.asset(
        ItemController.animation_rfid,
        width: screenwidth,
        height: screenheight/1.5,
        repeat: true,
        //fit: BoxFit.cover
      )
    ],
  );
}

Widget ItemInfo () {
  ItemInfoAPI RFIDRead_GX = Get.find();
  final CancelRFID = APIcommunication();
  return Stack(
    children: [
      //RFIDAnimation(),
      AlertDialog(
        title: Text(
          RFIDRead_GX.ItemName_GX.value,
          style: TextStyle(
            fontSize: 50, 
            color: Colors.black, 
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center
        ),           // To display the title it is optional
        content: RFIDDisplay(),   // Message which will be pop up on the screen                      // Action widget which will provide the user to acknowledge the choice
        actions: [
          ElevatedButton(                     // FlatButton widget is used to make a text to work like a button
            onPressed: () {
              CancelRFID.ClearRFID();
            },             // function used to perform after pressing the button
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 30, 
                fontWeight: FontWeight.w400
              )
            ),
          ),
        ],
      ),
    ],
  );
}

Widget RFIDDisplay () {
  ItemInfoAPI RFIDRead_GX = Get.find();
  String ShowImage = '';

  switch (RFIDRead_GX.ItemID_GX.value) {
    case "1":
      ShowImage = ItemController.image_item1;
    case "2":
      ShowImage = ItemController.image_item9;
    case "3":
      ShowImage = ItemController.image_item10;
    case "4":
      ShowImage = ItemController.image_item11;
    case "5":
      ShowImage = ItemController.image_item7;
    case "6":
      ShowImage = ItemController.image_item4;
    case "7":
      ShowImage = ItemController.image_item5;
    case "8":
      ShowImage = ItemController.image_item12;
    case "9":
      ShowImage = ItemController.image_item2;
    case "10":
      ShowImage = ItemController.image_item8;
    case "11":
      ShowImage = ItemController.image_item3;
    case "12":
      ShowImage = ItemController.image_item6;
  }

  return Column(
    children: [
      Container(
        alignment: Alignment.bottomRight,
        height: 300,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ShowImage)
          )
        ),
        child: Text(
          '${RFIDRead_GX.ItemOffer_GX.value == 'null'  ? '' : RFIDRead_GX.ItemOffer_GX.value} ',
          style: TextStyle(
            fontSize: 30, 
            color: Colors.red, 
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5, top: 10),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '   Price: RM ${RFIDRead_GX.ItemPrice_GX.value}',
                style: TextStyle(
                  fontSize: 20, 
                  color: Colors.black, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5, top: 10),
            child: Container(
              alignment: Alignment.center,
              child: Text(
                '   Location: ${RFIDRead_GX.ItemLocation_GX.value}',
                style: TextStyle(
                  fontSize: 20, 
                  color: Colors.black, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.only(right: 0, top: 0),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            '${RFIDRead_GX.ItemDescription_GX.value}',
            style: TextStyle(
              fontSize: 20, 
              color: Colors.black, 
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      )
    ],
  );
}


     