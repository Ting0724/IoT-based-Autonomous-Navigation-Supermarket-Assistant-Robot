import 'dart:convert';
import 'package:get/get.dart';
import 'package:supermarket_robot_ui/API%20Controller/APIconnnection.dart';
import 'package:http/http.dart' as http;
import 'package:supermarket_robot_ui/Controller/getxvariable.dart';
import 'package:supermarket_robot_ui/main.dart';

class APIcommunication {

  Future<void> Sendcoordinate (String data) async {
    String uri = API.APISendCoordinate;
    var res = await http.post(Uri.parse(uri), 
    body: {
      "itemselected": data,
    });
  }

  Future<void> SendRFIDEnable (String data1, String data2) async {
    String uri = API.APIRFIDEnable;
    var res = await http.post(Uri.parse(uri), 
    body: {
      "RFIDRead": data1,
      "RFIDPayment": data2,
    });
  }

  Future<void> SendHelp (String problem) async {
    String uri = API.APISendHelp;
    var res = await http.post(Uri.parse(uri), 
    body: {
      "Problem": problem,
    });
  }

  Future<void> RecordPayment (String email) async {
    ItemInfoAPI RFIDRead_GX = Get.find();
    String uri = API.APIRecordPayment;
    var res = await http.post(Uri.parse(uri), 
    body: {
      "Toothpaste_qty": "${RFIDRead_GX.Toothpaste_QuantityGX.value}",
      "Shampoo_qty": "${RFIDRead_GX.Shampoo_QuantityGX.value}",
      "Soap_qty": "${RFIDRead_GX.Soap_QuantityGX.value}",
      "Toilet_paper_qty": "${RFIDRead_GX.Toiletpaper_QuantityGX.value}",
      "Laundry_detergent_qty": "${RFIDRead_GX.Laundrydetergent_QuantityGX.value}",
      "Dishwashing_liquid_qty": "${RFIDRead_GX.Dishwashingliquid_QuantityGX.value}",
      "Facial_tissues_qty": "${RFIDRead_GX.Facialtissues_QuantityGX.value}",
      "Trash_bags_qty": "${RFIDRead_GX.Trashbags_QuantityGX.value}",
      "Aluminum_foil_qty": "${RFIDRead_GX.Aluminumfoil_QuantityGX.value}",
      "Plastic_wrap_qty": "${RFIDRead_GX.Plasticwrap_QuantityGX.value}",
      "Cleaning_spray_qty": "${RFIDRead_GX.Cleaningspray_QuantityGX.value}",
      "Hand_sanitizer_qty": "${RFIDRead_GX.Handsanitizer_QuantityGX.value}",
      "Total_price": "${RFIDRead_GX.Total_PriceGX.value}",
      "User_email": email,
    });
    
    RFIDRead_GX.Toothpaste_PriceGX.value = 0;
    RFIDRead_GX.Toothpaste_QuantityGX.value = 0;
    RFIDRead_GX.Shampoo_PriceGX.value = 0;
    RFIDRead_GX.Shampoo_QuantityGX.value = 0;
    RFIDRead_GX.Soap_PriceGX.value = 0;
    RFIDRead_GX.Soap_QuantityGX.value = 0;
    RFIDRead_GX.Toiletpaper_PriceGX.value = 0;
    RFIDRead_GX.Toiletpaper_QuantityGX.value = 0;
    RFIDRead_GX.Laundrydetergent_PriceGX.value = 0;
    RFIDRead_GX.Laundrydetergent_QuantityGX.value = 0;
    RFIDRead_GX.Dishwashingliquid_PriceGX.value = 0;
    RFIDRead_GX.Dishwashingliquid_QuantityGX.value = 0;
    RFIDRead_GX.Facialtissues_PriceGX.value = 0;
    RFIDRead_GX.Facialtissues_QuantityGX.value = 0;
    RFIDRead_GX.Trashbags_PriceGX.value = 0;
    RFIDRead_GX.Trashbags_QuantityGX.value = 0;
    RFIDRead_GX.Aluminumfoil_PriceGX.value = 0;
    RFIDRead_GX.Aluminumfoil_QuantityGX.value = 0;
    RFIDRead_GX.Plasticwrap_PriceGX.value = 0;
    RFIDRead_GX.Plasticwrap_QuantityGX.value = 0;
    RFIDRead_GX.Cleaningspray_PriceGX.value = 0;
    RFIDRead_GX.Cleaningspray_QuantityGX.value = 0;
    RFIDRead_GX.Handsanitizer_PriceGX.value = 0;
    RFIDRead_GX.Handsanitizer_QuantityGX.value = 0;
    RFIDRead_GX.Total_PriceGX.value = 0;
    RFIDRead_GX.Total_QuantityGX.value = 0;
  }

  Future<void> Cancelaction () async {
    String uri = API.APISendCoordinate;
    var res = await http.post(Uri.parse(uri), 
    body: {
      "itemselected": '0',
    });
  }

  Future<void> ClearRFID () async {
    String uri = API.APIClearRFID;
    var res = await http.post(Uri.parse(uri), 
    body: {
      
    });
  }

  Future<void> DeleteRFIDRecord () async {
    String uri = API.APIDeleteRecordPurchase;
    var res = await http.post(Uri.parse(uri), 
    body: {
      
    });
  }

  Future<void> BackOrigin () async {
    String uri = API.APIBackOrigin;
    var res = await http.post(Uri.parse(uri), 
    body: {
      
    });
  }

  Future<void> ReadRFID () async {
    try {
      String uri = API.APIReadRFID;
      var res = await http.get(Uri.parse(uri));
      if (res.statusCode == 200) {
        //print(res.body);
        final data = jsonDecode(res.body);
        listrfid = data;
        //print('This is data:');
        //print(listrfid);
        //print(listrfid[0][2].runtimeType);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> ReadItemInfo () async {
    try {
      String uri = API.APIReadItemInfo;
      var res = await http.get(Uri.parse(uri));
      if (res.statusCode == 200) {
        //print(res.body);
        final data = jsonDecode(res.body);
        listiteminfo = data;
        //print('This is iteminfo:');
        //print(listiteminfo[0]);
        //print(listrfid[0][2].runtimeType);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> ReadPurchaseList () async {
    try {
      String uri = API.APIReadPurchaseList;
      var res = await http.get(Uri.parse(uri));
      if (res.statusCode == 200) {
        //print(res.body);
        final data = jsonDecode(res.body);
        listpurchase = data;
        //print('This is purchase data:');
        //print(listpurchase);
        //print(listpurchase.length);
        //print(listpurchase[0][2].runtimeType);
      }
    } catch (e) {
      print(e);
    }
  }
}

