import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:supermarket_robot_ui/API%20Controller/APIcommunication.dart';
import 'package:supermarket_robot_ui/Controller/getxcontroller.dart';
import 'package:supermarket_robot_ui/Controller/getxvariable.dart';
import 'package:supermarket_robot_ui/Controller/itemcontroller.dart';
import 'package:supermarket_robot_ui/Pages/ObtainEmail.dart';
import 'package:supermarket_robot_ui/main.dart';

class RFIDPayment extends StatefulWidget {
  const RFIDPayment({super.key});

  @override
  State<RFIDPayment> createState() => _RFIDPaymentState();
}

class _RFIDPaymentState extends State<RFIDPayment> {
  final rfidfunction = APIcommunication();
  @override
  Widget build(BuildContext context) {
    feature_readrfid = 0;
    feature_paymentrfid = 1;
    feature_item = 0;
    rfidfunction.SendRFIDEnable("0","1");
    return Obx(() => Selection(context));
    //return  Selection();
  }
}

Widget Selection(BuildContext context) {
  ItemInfoAPI RFIDPurchaseList_GX = Get.find();
  int CheckCondition_ReadRFID = 0;
  print('Hi ${RFIDPurchaseList_GX.CheckListObtain.value}');
  if(RFIDPurchaseList_GX.CheckListObtain.value > 0) {
    CheckCondition_ReadRFID = 1;
    //SortingItem();
  }

  if(CheckCondition_ReadRFID > 0) {
    return ListInfo(context);
  }
  else {
    return PaymentAnimation();
  }
}

Widget PaymentAnimation() {
  return Center(
    child: Stack(
      children: [
        const Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  "Purchase Your Items",
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
          ItemController.animation_payment,
          width: screenwidth,
          height: screenheight,
          repeat: true,
          //fit: BoxFit.cover
        )
      ],
    ),
  );
}

Widget ListInfo (BuildContext context) {
  ItemInfoAPI RFIDRead_GX = Get.find();
  final DeleteRecordRFID = APIcommunication();
  return Stack(
    children: [
      //PaymentAnimation(),
      AlertDialog(
        shape: RoundedRectangleBorder (
          side: BorderSide(
            color: Colors.black,
            width: 5
          ),
        ),
        title: Text(
          "Payment Info",
          style: TextStyle(
            fontSize: 40, 
            color: Colors.black, 
            fontWeight: FontWeight.w800,
          ),
          textAlign: TextAlign.center
        ),           // To display the title it is optional
        content: ReceiptDisplay(context),   // Message which will be pop up on the screen                      // Action widget which will provide the user to acknowledge the choice
        actions: [
          ElevatedButton(                     // FlatButton widget is used to make a text to work like a button
            onPressed: () {
              DeleteRecordRFID.DeleteRFIDRecord();
              //Navigator.pop(context);
            },             // function used to perform after pressing the button
            child: Text(
              'Cancel',
              style: TextStyle(
                fontSize: 30, 
                fontWeight: FontWeight.w400
              )
            ),
          ),
          ElevatedButton(                     // FlatButton widget is used to make a text to work like a button
            onPressed: () {
              GetUserEmail(context);
            },             // function used to perform after pressing the button
            child: Text(
              'Confirm',
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

Widget ReceiptDisplay (BuildContext context) {
  ItemInfoAPI RFIDRead_GX = Get.find();
  SortingItem();
  return Column(
    children: [
      Container(
        height: 350,
        width: 1000,
        decoration: BoxDecoration (
          border: Border(
              top: BorderSide(color: Colors.black, width: 5),
              bottom: BorderSide(color: Colors.black, width: 5)
          ),
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: DataTable(
            columns: [
              DataColumn(label: Text(
                "NO.",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.w600
                ),
              )),
              DataColumn(label: Text(
                "ITEM",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.w600
                ),
              )),
              DataColumn(label: Text(
                "PRICE",
                style: TextStyle(
                  fontSize: 20, 
                  fontWeight: FontWeight.w600
                ),
              ))
            ], 
            rows: List.generate(
              RFIDRead_GX.CheckListObtain.value, 
              (int index) => DataRow(
                cells: [
                  DataCell(Text('${index+1}')),
                  DataCell(Text('${listpurchase[index][1]}')),
                  DataCell(Text('RM ${listpurchase[index][2]}')),
                ]
              )
            )
          ),
        )
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 50.0, top: 25),
            child: Text(
              "Total Quantity: ${RFIDRead_GX.Total_QuantityGX.value}",
              style: TextStyle(
                fontSize: 30, 
                fontWeight: FontWeight.w800
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 50.0, top: 25),
            child: Text(
              "Total Price: RM ${RFIDRead_GX.Total_PriceGX.value}",
              style: TextStyle(
                fontSize: 30, 
                fontWeight: FontWeight.w800
              ),
            ),
          )
        ],
      )
    ],
  );
}

void SortingItem() {
  UpdateAPIData APIData = Get.find();
  ItemInfoAPI RFIDRead_GX = Get.find();

  double Toothpaste_Qty = 0;
  double Toothpaste_Price = 0;
  double Shampoo_Qty = 0;
  double Shampoo_Price = 0;
  double Soap_Qty = 0;
  double Soap_Price = 0;
  double Toiletpaper_Qty = 0;
  double Toiletpaper_Price = 0;
  double Laundrydetergent_Qty = 0;
  double Laundrydetergent_Price = 0;
  double Dishwashingliquid_Qty = 0;
  double Dishwashingliquid_Price = 0;
  double Facialtissues_Qty = 0;
  double Facialtissues_Price = 0;
  double Trashbags_Qty = 0;
  double Trashbags_Price = 0;
  double Aluminumfoil_Qty = 0;
  double Aluminumfoil_Price = 0;
  double Plasticwrap_Qty = 0;
  double Plasticwrap_Price = 0;
  double Cleaningspray_Qty = 0;
  double Cleaningspray_Price = 0;
  double Handsanitizer_Qty = 0;
  double Handsanitizer_Price = 0;
  double Total_price = 0;
  double Total_quantity = 0;

  for (int i = 0; i<listpurchase.length; i++) { 
    if(listpurchase[i][1] == 'Toothpaste') {
      Toothpaste_Qty = Toothpaste_Qty + 1;
      Toothpaste_Price = Toothpaste_Price + 5.0;
    }
    if(listpurchase[i][1] == 'Shampoo') {
      Shampoo_Qty = Shampoo_Qty + 1;
      Shampoo_Price = Shampoo_Price + 10.0;
    }
    if(listpurchase[i][1] == 'Soap') {
      Soap_Qty = Soap_Qty + 1;
      Soap_Price = Soap_Price + 4.0;
    }
    if(listpurchase[i][1] == 'Toilet paper') {
      Toiletpaper_Qty = Toiletpaper_Qty + 1;
      Toiletpaper_Price = Toiletpaper_Price + 8.0;
    }
    if(listpurchase[i][1] == 'Laundry detergent') {
      Laundrydetergent_Qty = Laundrydetergent_Qty + 1;
      Laundrydetergent_Price = Laundrydetergent_Price + 15.0;
    }
    if(listpurchase[i][1] == 'Dishwashing liquid') {
      Dishwashingliquid_Qty = Dishwashingliquid_Qty + 1;
      Dishwashingliquid_Price = Dishwashingliquid_Price + 7.0;
    }
    if(listpurchase[i][1] == 'Facial tissues') {
      Facialtissues_Qty = Facialtissues_Qty + 1;
      Facialtissues_Price = Facialtissues_Price + 5.0;
    }
    if(listpurchase[i][1] == 'Trash bags') {
      Trashbags_Qty = Trashbags_Qty + 1;
      Trashbags_Price = Trashbags_Price + 10.0;
    }
    if(listpurchase[i][1] == 'Aluminum foil') {
      Aluminumfoil_Qty = Aluminumfoil_Qty + 1;
      Aluminumfoil_Price = Aluminumfoil_Price + 8.0;
    }
    if(listpurchase[i][1] == 'Plastic wrap') {
      Plasticwrap_Qty = Plasticwrap_Qty + 1;
      Plasticwrap_Price = Plasticwrap_Price + 6.0;
    }
    if(listpurchase[i][1] == 'Cleaning spray') {
      Cleaningspray_Qty = Cleaningspray_Qty + 1;
      Cleaningspray_Price = Cleaningspray_Price + 7.0;
    }
    if(listpurchase[i][1] == 'Hand sanitizer') {
      Handsanitizer_Qty = Handsanitizer_Qty + 1;
      Handsanitizer_Price = Handsanitizer_Price + 9.0;
    }
  }

  Total_price = Toothpaste_Price + Shampoo_Price + Soap_Price + Toiletpaper_Price + Laundrydetergent_Price + Dishwashingliquid_Price + Facialtissues_Price + Trashbags_Price + Aluminumfoil_Price + Plasticwrap_Price + Cleaningspray_Price + Handsanitizer_Price ;
  Total_quantity = Toothpaste_Qty + Shampoo_Qty + Soap_Qty + Toiletpaper_Qty + Laundrydetergent_Qty + Dishwashingliquid_Qty + Facialtissues_Qty + Trashbags_Qty + Aluminumfoil_Qty + Plasticwrap_Qty + Cleaningspray_Qty + Handsanitizer_Qty;
  
  RFIDRead_GX.Toothpaste_PriceGX.value = Toothpaste_Price;
  RFIDRead_GX.Toothpaste_QuantityGX.value = Toothpaste_Qty;
  RFIDRead_GX.Shampoo_PriceGX.value = Shampoo_Price;
  RFIDRead_GX.Shampoo_QuantityGX.value = Shampoo_Qty;
  RFIDRead_GX.Soap_PriceGX.value = Soap_Price;
  RFIDRead_GX.Soap_QuantityGX.value = Soap_Qty;
  RFIDRead_GX.Toiletpaper_PriceGX.value = Toiletpaper_Price;
  RFIDRead_GX.Toiletpaper_QuantityGX.value = Toiletpaper_Qty;
  RFIDRead_GX.Laundrydetergent_PriceGX.value = Laundrydetergent_Price;
  RFIDRead_GX.Laundrydetergent_QuantityGX.value = Laundrydetergent_Qty;
  RFIDRead_GX.Dishwashingliquid_PriceGX.value = Dishwashingliquid_Price;
  RFIDRead_GX.Dishwashingliquid_QuantityGX.value = Dishwashingliquid_Qty;
  RFIDRead_GX.Facialtissues_PriceGX.value = Facialtissues_Price;
  RFIDRead_GX.Facialtissues_QuantityGX.value = Facialtissues_Qty;
  RFIDRead_GX.Trashbags_PriceGX.value = Trashbags_Price;
  RFIDRead_GX.Trashbags_QuantityGX.value = Trashbags_Qty;
  RFIDRead_GX.Aluminumfoil_PriceGX.value = Aluminumfoil_Price;
  RFIDRead_GX.Aluminumfoil_QuantityGX.value = Aluminumfoil_Qty;
  RFIDRead_GX.Plasticwrap_PriceGX.value = Plasticwrap_Price;
  RFIDRead_GX.Plasticwrap_QuantityGX.value = Plasticwrap_Qty;
  RFIDRead_GX.Cleaningspray_PriceGX.value = Cleaningspray_Price;
  RFIDRead_GX.Cleaningspray_QuantityGX.value = Cleaningspray_Qty;
  RFIDRead_GX.Handsanitizer_PriceGX.value = Handsanitizer_Price;
  RFIDRead_GX.Handsanitizer_QuantityGX.value = Handsanitizer_Qty;
  RFIDRead_GX.Total_PriceGX.value = Total_price;
  RFIDRead_GX.Total_QuantityGX.value = Total_quantity;
}

void GetUserEmail (BuildContext context) {
  late TextEditingController controller;
  final DeleteRecordRFID = APIcommunication();
  showDialog(
    context: context, 
    builder: (context) => ObtainUserEmail()
  );
}

/*
return Column(
    children:[
      Container(
        decoration: BoxDecoration (
          border: Border(
             top: BorderSide(color: Colors.black, width: 5),
             bottom: BorderSide(color: Colors.black, width: 5)
          ),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 50, right: 150, bottom: 0.0),
              child: Text(
                'NO.',
                style: TextStyle(
                  fontSize: 30, 
                  color: Colors.black, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 150, right: 150, bottom: 0.0),
              child: Text(
                'Item',
                style: TextStyle(
                  fontSize: 30, 
                  color: Colors.black, 
                  fontWeight: FontWeight.w600
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0, left: 150, right: 50, bottom: 0.0),
              child: Text(
                'Price',
                style: TextStyle(
                  fontSize: 30, 
                  color: Colors.black, 
                  fontWeight: FontWeight.w600
                ),
              ),
            )
          ],
        ),
      ),
      ListItemAll(context),
    ],
  ); 




Widget ListItemAll(BuildContext context) {
  ItemInfoAPI RFIDRead_GX = Get.find();
  return Container(
    height: 450,
    width: 1000,
    child: ListView.builder(
      //padding: EdgeInsets.only(8),
      itemCount: RFIDRead_GX.CheckListObtain.value,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          //color: const Color.fromARGB(255, 90, 90, 90),
          child: Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 50, right: 150, bottom: 0.0),
                  child: Text(
                    '${index + 1}',
                    style: TextStyle(
                      fontSize: 20, 
                      color: const Color.fromARGB(255, 84, 84, 84), 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 150, right: 150, bottom: 0.0),
                  child: Text(
                    '${listpurchase[index][1]}',
                    style: TextStyle(
                      fontSize: 20, 
                      color: const Color.fromARGB(255, 84, 84, 84), 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 150, right: 50, bottom: 0.0),
                  child: Text(
                    'RM ${listpurchase[index][2]}',
                    style: TextStyle(
                      fontSize: 20, 
                      color: const Color.fromARGB(255, 84, 84, 84), 
                      fontWeight: FontWeight.w500
                    ),
                  ),
                )
              ],
            )
          ),
        );
      }
    ),
  );
}
*/