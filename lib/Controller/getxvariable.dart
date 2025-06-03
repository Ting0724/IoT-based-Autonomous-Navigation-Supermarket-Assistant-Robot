import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';

class ItemInfoAPI extends GetxController{
  var ItemID_GX = "".obs;
  var ItemName_GX = "".obs;
  var ItemPrice_GX = "".obs;
  var ItemDescription_GX = "".obs;
  var ItemLocation_GX = "".obs;
  var ItemOffer_GX = "".obs;
  var CheckItemRFID = 0.obs;

  var CheckListObtain = 0.obs;
  var Toothpaste_QuantityGX = 0.0.obs;
  var Toothpaste_PriceGX = 0.0.obs;
  var Shampoo_QuantityGX = 0.0.obs;
  var Shampoo_PriceGX = 0.0.obs;
  var Soap_QuantityGX = 0.0.obs;
  var Soap_PriceGX = 0.0.obs;
  var Toiletpaper_QuantityGX = 0.0.obs;
  var Toiletpaper_PriceGX = 0.0.obs;
  var Laundrydetergent_QuantityGX = 0.0.obs;
  var Laundrydetergent_PriceGX = 0.0.obs;
  var Dishwashingliquid_QuantityGX = 0.0.obs;
  var Dishwashingliquid_PriceGX = 0.0.obs;
  var Facialtissues_QuantityGX = 0.0.obs;
  var Facialtissues_PriceGX = 0.0.obs;
  var Trashbags_QuantityGX = 0.0.obs;
  var Trashbags_PriceGX = 0.0.obs;
  var Aluminumfoil_QuantityGX = 0.0.obs;
  var Aluminumfoil_PriceGX = 0.0.obs;
  var Plasticwrap_QuantityGX = 0.0.obs;
  var Plasticwrap_PriceGX = 0.0.obs;
  var Cleaningspray_QuantityGX = 0.0.obs;
  var Cleaningspray_PriceGX = 0.0.obs;
  var Handsanitizer_QuantityGX = 0.0.obs;
  var Handsanitizer_PriceGX = 0.0.obs;
  var Total_PriceGX = 0.0.obs;
  var Total_QuantityGX = 0.0.obs;

  //Display purpose
  var Toothpaste_QuantityGX_display = "".obs;
  var Toothpaste_PriceGX_display = "".obs;
  var Toothpaste_OfferGX_display = "".obs;
  var Toothpaste_DescriptionGX_display = "".obs;
  var Toothpaste_LocationGX_display = "".obs;
  var Toothpaste_NameGX_display = "".obs;

  var Shampoo_QuantityGX_display = "".obs;
  var Shampoo_PriceGX_display = "".obs;
  var Shampoo_OfferGX_display = "".obs;
  var Shampoo_DescriptionGX_display = "".obs;
  var Shampoo_LocationGX_display = "".obs;
  var Shampoo_NameGX_display = "".obs;


  var Soap_QuantityGX_display = "".obs;
  var Soap_PriceGX_display = "".obs;
  var Soap_OfferGX_display = "".obs;
  var Soap_DescriptionGX_display = "".obs;
  var Soap_LocationGX_display = "".obs;
  var Soap_NameGX_display = "".obs;

  var Toiletpaper_QuantityGX_display = "".obs;
  var Toiletpaper_PriceGX_display = "".obs;
  var Toiletpaper_OfferGX_display = "".obs;
  var Toiletpaper_DescriptionGX_display = "".obs;
  var Toiletpaper_LocationGX_display = "".obs;
  var Toiletpaper_NameGX_display = "".obs;

  var Laundrydetergent_QuantityGX_display = "".obs;
  var Laundrydetergent_PriceGX_display = "".obs;
  var Laundrydetergent_OfferGX_display = "".obs;
  var Laundrydetergent_DescriptionGX_display = "".obs;
  var Laundrydetergent_LocationGX_display = "".obs;
  var Laundrydetergent_NameGX_display = "".obs;

  var Dishwashingliquid_QuantityGX_display = "".obs;
  var Dishwashingliquid_PriceGX_display = "".obs;
  var Dishwashingliquid_OfferGX_display = "".obs;
  var Dishwashingliquid_DescriptionGX_display = "".obs;
  var Dishwashingliquid_LocationGX_display = "".obs;
  var Dishwashingliquid_NameGX_display = "".obs;

  var Facialtissues_QuantityGX_display = "".obs;
  var Facialtissues_PriceGX_display = "".obs;
  var Facialtissues_OfferGX_display = "".obs;
  var Facialtissues_DescriptionGX_display = "".obs;
  var Facialtissues_LocationGX_display = "".obs;
  var Facialtissues_NameGX_display = "".obs;  

  var Trashbags_QuantityGX_display = "".obs;
  var Trashbags_PriceGX_display = "".obs;
  var Trashbags_OfferGX_display = "".obs;
  var Trashbags_DescriptionGX_display = "".obs;
  var Trashbags_LocationGX_display = "".obs;
  var Trashbags_NameGX_display = "".obs;  

  var Aluminumfoil_QuantityGX_display = "".obs;
  var Aluminumfoil_PriceGX_display = "".obs;
  var Aluminumfoil_OfferGX_display = "".obs;
  var Aluminumfoil_DescriptionGX_display = "".obs;
  var Aluminumfoil_LocationGX_display = "".obs;
  var Aluminumfoil_NameGX_display = "".obs;

  var Plasticwrap_QuantityGX_display = "".obs;
  var Plasticwrap_PriceGX_display = "".obs;
  var Plasticwrap_OfferGX_display = "".obs;
  var Plasticwrap_DescriptionGX_display = "".obs;
  var Plasticwrap_LocationGX_display = "".obs;
  var Plasticwrap_NameGX_display = "".obs;

  var Cleaningspray_QuantityGX_display = "".obs;
  var Cleaningspray_PriceGX_display = "".obs;
  var Cleaningspray_OfferGX_display = "".obs;
  var Cleaningspray_DescriptionGX_display = "".obs;
  var Cleaningspray_LocationGX_display = "".obs;
  var Cleaningspray_NameGX_display = "".obs;

  var Handsanitizer_QuantityGX_display = "".obs;
  var Handsanitizer_PriceGX_display = "".obs;
  var Handsanitizer_OfferGX_display = "".obs;
  var Handsanitizer_DescriptionGX_display = "".obs;
  var Handsanitizer_LocationGX_display = "".obs;
  var Handsanitizer_NameGX_display = "".obs;
}