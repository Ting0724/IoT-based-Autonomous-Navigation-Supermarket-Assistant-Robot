import 'dart:async';
import 'dart:js_interop';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:supermarket_robot_ui/Controller/getxcontroller.dart';
import 'package:supermarket_robot_ui/Controller/getxvariable.dart';
import 'package:supermarket_robot_ui/navigation.dart';

//Global Variable
dynamic screenheight;
dynamic screenwidth;
List listrfid = [];
List listpurchase = [];
List listiteminfo = [];
dynamic feature_readrfid = 0;
dynamic feature_paymentrfid = 0;
dynamic feature_item = 0;


void main() {
  UpdateAPIData APIData = Get.put(UpdateAPIData());
  ItemInfoAPI RFIDRead_GX = Get.put(ItemInfoAPI());
  Timer.periodic(const Duration(milliseconds: 100), autoupdatedata);
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

void autoupdatedata(Timer timer) {
  UpdateAPIData APIData = Get.find();
  ItemInfoAPI RFIDRead_GX = Get.find();
  if(feature_readrfid == 1) {
    APIData.GetRFIDRead();
    //RFIDRead_GX.CheckItemRFID.value = listrfid.length;
    if(feature_readrfid == 1 && listrfid.isNotEmpty) {
      RFIDRead_GX.ItemID_GX.value = listrfid[0][1];
      RFIDRead_GX.ItemName_GX.value = listrfid[0][2];
      RFIDRead_GX.ItemPrice_GX.value = listrfid[0][3];
      RFIDRead_GX.ItemOffer_GX.value = listrfid[0][4];
      RFIDRead_GX.ItemDescription_GX.value = listrfid[0][5];
      RFIDRead_GX.ItemLocation_GX.value = listrfid[0][6];
      RFIDRead_GX.CheckItemRFID.value = int.parse(RFIDRead_GX.ItemID_GX.value);
      //print(listrfid);
      //print(RFIDRead_GX.ItemID_GX.value.runtimeType);
      //print(RFIDRead_GX.ItemID_GX.value);
    }
  }
  if(feature_paymentrfid == 1) {
    APIData.GetRFIDPurchaseList();
    RFIDRead_GX.CheckListObtain.value = listpurchase.length;
    if(feature_paymentrfid == 1 && listpurchase.isNotEmpty) {
      print(listpurchase);
      print(RFIDRead_GX.CheckListObtain.value);
      //print(RFIDRead_GX.PurchaseItemList_GX[0]);
      //print(RFIDRead_GX.ItemID_GX.value.runtimeType);
      //print(RFIDRead_GX.ItemID_GX.value);
    }
  }
  if(feature_item == 1) {
    APIData.GetItemInfo();
    if(feature_item == 1 && listiteminfo.isNotEmpty) {
      RFIDRead_GX.Toothpaste_NameGX_display.value = listiteminfo[0][1];
      RFIDRead_GX.Toothpaste_PriceGX_display.value = listiteminfo[0][2];
      if(listiteminfo[0][3] == null) {
        RFIDRead_GX.Toothpaste_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Toothpaste_OfferGX_display.value = listiteminfo[0][3];
      }
      RFIDRead_GX.Toothpaste_DescriptionGX_display.value = listiteminfo[0][4];
      RFIDRead_GX.Toothpaste_QuantityGX_display.value = listiteminfo[0][5];
      RFIDRead_GX.Toothpaste_LocationGX_display.value = listiteminfo[0][6];

      RFIDRead_GX.Shampoo_NameGX_display.value = listiteminfo[1][1];
      RFIDRead_GX.Shampoo_PriceGX_display.value = listiteminfo[1][2];
      if(listiteminfo[1][3] == null) {
        RFIDRead_GX.Shampoo_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Shampoo_OfferGX_display.value = listiteminfo[1][3];
      }
      RFIDRead_GX.Shampoo_DescriptionGX_display.value = listiteminfo[1][4];
      RFIDRead_GX.Shampoo_QuantityGX_display.value = listiteminfo[1][5];
      RFIDRead_GX.Shampoo_LocationGX_display.value = listiteminfo[1][6];

      RFIDRead_GX.Soap_NameGX_display.value = listiteminfo[2][1];
      RFIDRead_GX.Soap_PriceGX_display.value = listiteminfo[2][2];
      if(listiteminfo[2][3] == null) {
        RFIDRead_GX.Soap_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Soap_OfferGX_display.value = listiteminfo[2][3];
      }
      RFIDRead_GX.Soap_DescriptionGX_display.value = listiteminfo[2][4];
      RFIDRead_GX.Soap_QuantityGX_display.value = listiteminfo[2][5];
      RFIDRead_GX.Soap_LocationGX_display.value = listiteminfo[2][6];

      RFIDRead_GX.Toiletpaper_NameGX_display.value = listiteminfo[3][1];
      RFIDRead_GX.Toiletpaper_PriceGX_display.value = listiteminfo[3][2];
      if(listiteminfo[3][3] == null) {
        RFIDRead_GX.Toiletpaper_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Toiletpaper_OfferGX_display.value = listiteminfo[3][3];
      }
      RFIDRead_GX.Toiletpaper_DescriptionGX_display.value = listiteminfo[3][4];
      RFIDRead_GX.Toiletpaper_QuantityGX_display.value = listiteminfo[3][5];
      RFIDRead_GX.Toiletpaper_LocationGX_display.value = listiteminfo[3][6];

      RFIDRead_GX.Laundrydetergent_NameGX_display.value = listiteminfo[4][1];
      RFIDRead_GX.Laundrydetergent_PriceGX_display.value = listiteminfo[4][2];
      if(listiteminfo[4][3] == null) {
        RFIDRead_GX.Laundrydetergent_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Laundrydetergent_OfferGX_display.value = listiteminfo[4][3];
      }
      RFIDRead_GX.Laundrydetergent_DescriptionGX_display.value = listiteminfo[4][4];
      RFIDRead_GX.Laundrydetergent_QuantityGX_display.value = listiteminfo[4][5];
      RFIDRead_GX.Laundrydetergent_LocationGX_display.value = listiteminfo[4][6];

      RFIDRead_GX.Dishwashingliquid_NameGX_display.value = listiteminfo[5][1];
      RFIDRead_GX.Dishwashingliquid_PriceGX_display.value = listiteminfo[5][2];
      if(listiteminfo[5][3] == null) {
        RFIDRead_GX.Dishwashingliquid_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Dishwashingliquid_OfferGX_display.value = listiteminfo[5][3];
      }
      RFIDRead_GX.Dishwashingliquid_DescriptionGX_display.value = listiteminfo[5][4];
      RFIDRead_GX.Dishwashingliquid_QuantityGX_display.value = listiteminfo[5][5];
      RFIDRead_GX.Dishwashingliquid_LocationGX_display.value = listiteminfo[5][6];

      RFIDRead_GX.Facialtissues_NameGX_display.value = listiteminfo[6][1];
      RFIDRead_GX.Facialtissues_PriceGX_display.value = listiteminfo[6][2];
      if(listiteminfo[6][3] == null) {
        RFIDRead_GX.Facialtissues_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Facialtissues_OfferGX_display.value = listiteminfo[6][3];
      }
      RFIDRead_GX.Facialtissues_DescriptionGX_display.value = listiteminfo[6][4];
      RFIDRead_GX.Facialtissues_QuantityGX_display.value = listiteminfo[6][5];
      RFIDRead_GX.Facialtissues_LocationGX_display.value = listiteminfo[6][6];

      RFIDRead_GX.Trashbags_NameGX_display.value = listiteminfo[7][1];
      RFIDRead_GX.Trashbags_PriceGX_display.value = listiteminfo[7][2];
      if(listiteminfo[7][3] == null) {
        RFIDRead_GX.Trashbags_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Trashbags_OfferGX_display.value = listiteminfo[7][3];
      }
      RFIDRead_GX.Trashbags_DescriptionGX_display.value = listiteminfo[7][4];
      RFIDRead_GX.Trashbags_QuantityGX_display.value = listiteminfo[7][5];
      RFIDRead_GX.Trashbags_LocationGX_display.value = listiteminfo[7][6];

      RFIDRead_GX.Aluminumfoil_NameGX_display.value = listiteminfo[8][1];
      RFIDRead_GX.Aluminumfoil_PriceGX_display.value = listiteminfo[8][2];
      if(listiteminfo[8][3] == null) {
        RFIDRead_GX.Aluminumfoil_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Aluminumfoil_OfferGX_display.value = listiteminfo[8][3];
      }
      RFIDRead_GX.Aluminumfoil_DescriptionGX_display.value = listiteminfo[8][4];
      RFIDRead_GX.Aluminumfoil_QuantityGX_display.value = listiteminfo[8][5];
      RFIDRead_GX.Aluminumfoil_LocationGX_display.value = listiteminfo[8][6];

      RFIDRead_GX.Plasticwrap_NameGX_display.value = listiteminfo[9][1];
      RFIDRead_GX.Plasticwrap_PriceGX_display.value = listiteminfo[9][2];
      if(listiteminfo[9][3] == null) {
        RFIDRead_GX.Plasticwrap_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Plasticwrap_OfferGX_display.value = listiteminfo[9][3];
      }
      RFIDRead_GX.Plasticwrap_DescriptionGX_display.value = listiteminfo[9][4];
      RFIDRead_GX.Plasticwrap_QuantityGX_display.value = listiteminfo[9][5];
      RFIDRead_GX.Plasticwrap_LocationGX_display.value = listiteminfo[9][6];

      RFIDRead_GX.Cleaningspray_NameGX_display.value = listiteminfo[10][1];
      RFIDRead_GX.Cleaningspray_PriceGX_display.value = listiteminfo[10][2];
      if(listiteminfo[10][3] == null) {
        RFIDRead_GX.Cleaningspray_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Cleaningspray_OfferGX_display.value = listiteminfo[10][3];
      }
      RFIDRead_GX.Cleaningspray_DescriptionGX_display.value = listiteminfo[10][4];
      RFIDRead_GX.Cleaningspray_QuantityGX_display.value = listiteminfo[10][5];
      RFIDRead_GX.Cleaningspray_LocationGX_display.value = listiteminfo[10][6];

      RFIDRead_GX.Handsanitizer_NameGX_display.value = listiteminfo[11][1];
      RFIDRead_GX.Handsanitizer_PriceGX_display.value = listiteminfo[11][2];
      if(listiteminfo[11][3] == null) {
        RFIDRead_GX.Handsanitizer_OfferGX_display.value = "";
      }
      else {
        RFIDRead_GX.Handsanitizer_OfferGX_display.value = listiteminfo[11][3];
      }
      RFIDRead_GX.Handsanitizer_DescriptionGX_display.value = listiteminfo[11][4];
      RFIDRead_GX.Handsanitizer_QuantityGX_display.value = listiteminfo[11][5];
      RFIDRead_GX.Handsanitizer_LocationGX_display.value = listiteminfo[11][6];

      //print(RFIDRead_GX.ItemID_GX.value.runtimeType);
      //print(RFIDRead_GX.ItemID_GX.value);
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    screenheight = MediaQuery.of(context).size.height;
    screenwidth = MediaQuery.of(context).size.width;
    //print('This is height: $screenheight');
    //print('This is width: $screenwidth');
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NavigationPage(),
    );
  }
}