import 'package:get/get.dart';
import 'package:supermarket_robot_ui/API%20Controller/APIcommunication.dart';
import 'package:supermarket_robot_ui/main.dart';

class UpdateAPIData extends GetxController {

  List RFIDdata = [];
  List RFIDPurchaseList = [];
  List ItemInfoList = [];

  void GetRFIDRead () {
    final rfidfunction = APIcommunication();
    rfidfunction.ReadRFID();
    if ((listrfid.length) > 0) {
      RFIDdata = listrfid;
    }
  }

  void GetRFIDPurchaseList () {
    final rfidpurchase = APIcommunication();
    rfidpurchase.ReadPurchaseList();
    if ((listpurchase.length) > 0) {
      RFIDPurchaseList = listpurchase;
    }
  }

  void GetItemInfo () {
    final ItemInfo = APIcommunication();
    ItemInfo.ReadItemInfo();
    if ((listiteminfo.length) > 0) {
      ItemInfoList = listiteminfo;
    }
  }

}