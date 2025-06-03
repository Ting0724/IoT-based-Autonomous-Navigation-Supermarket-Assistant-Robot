import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:supermarket_robot_ui/API%20Controller/APIcommunication.dart';
import 'package:supermarket_robot_ui/Controller/getxvariable.dart';
import 'package:supermarket_robot_ui/Controller/itemcontroller.dart';
import 'package:supermarket_robot_ui/sizing.dart';

class Item12 extends StatefulWidget {
  const Item12({super.key});

  @override
  State<Item12> createState() => _Item12State();
}

class _Item12State extends State<Item12> {
  ItemInfoAPI RFIDRead_GX = Get.find();
  @override
  Widget build(BuildContext context) {
    final componentsize = SizingComponent();
    final navigationfunction = APIcommunication();

    final ButtonStyle style = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: componentsize.buttontext_size, color: Colors.black), 
      backgroundColor: Colors.yellow,
      //fixedSize: Size(componentsize.buttonsize_width, componentsize.buttonsize_height)
    );

    return Column(
      children: [
        Container(
          alignment: Alignment.bottomRight,
          height: componentsize.image_height,
          width: componentsize.image_width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(componentsize.borderradius),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(ItemController.image_item6)
            )
          ), //== 'null'  ? '' : RFIDRead_GX.ItemOffer_GX.value
          child: Obx(() => Text(
            '${RFIDRead_GX.Handsanitizer_OfferGX_display.value} ',
            style: TextStyle(
              fontSize: componentsize.offertext_size, 
              color: Colors.red, 
              fontWeight: FontWeight.w600
            )),
          ),
        ),
        Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(color: Colors.black, width: componentsize.itemname_borderwidth),
              bottom: BorderSide(color: Colors.black, width: componentsize.itemname_borderwidth)
            ),
          ), //Obx(() => Selection(context))
          child: Obx(() => Text(
            '${RFIDRead_GX.Handsanitizer_NameGX_display.value}',
            style: TextStyle(
              fontSize: componentsize.itemname_size, 
              color: Colors.black, 
              fontWeight: FontWeight.w800
            ),
          )),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: componentsize.itemspace_right, top: componentsize.itemspace_top),
              child: Container(
                alignment: Alignment.center,
                child: Obx(() => Text(
                  'Price: RM ${RFIDRead_GX.Handsanitizer_PriceGX_display.value}',
                  style: TextStyle(
                    fontSize: componentsize.pricetext_size, 
                    color: Colors.black, 
                    fontWeight: FontWeight.w600
                  ),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: componentsize.itemspace_right, top: componentsize.itemspace_top),
              child: Container(
                alignment: Alignment.center,
                child: Obx(() => Text(
                  'Qty: ${RFIDRead_GX.Handsanitizer_QuantityGX_display.value}',
                  style: TextStyle(
                    fontSize: componentsize.pricetext_size, 
                    color: Colors.black, 
                    fontWeight: FontWeight.w600
                  ),
                )),
              ),
            ),
            Padding(
              //padding: EdgeInsets.only(left: componentsize.buttonspace_left, top: componentsize.buttonspace_top),
              padding: EdgeInsets.only(top: componentsize.buttonspace_top/2, bottom: componentsize.buttonspace_top/2),
              child: ElevatedButton(
                style: style,
                onPressed: () {
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      content: ItemDisplay(),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          }, 
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 30, 
                              fontWeight: FontWeight.w400
                            ),
                          )
                        ),
                        TextButton(
                          onPressed: () {
                            navigationfunction.Sendcoordinate('12');
                            Navigator.pop(context);
                            showDialog(
                              context: context, 
                              builder: (context) => Navigation(context));
                          }, 
                          child: Text(
                            'Navigation',
                            style: TextStyle(
                              fontSize: 30, 
                              fontWeight: FontWeight.w400
                            ),
                          )
                        )
                      ],
                    ),
                  );
                },
                child: const Text('Info'),
              ),
            ),
          ],
        )
      ],
    );
  }
}

Widget ItemDisplay () {
  ItemInfoAPI RFIDRead_GX = Get.find();
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.only(right: 0, top: 0),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            '${RFIDRead_GX.Handsanitizer_NameGX_display.value}',
            style: TextStyle(
              fontSize: 40, 
              color: Colors.black, 
              fontWeight: FontWeight.w600
            ),
          ),
        ),
      ),
      Container(
        alignment: Alignment.bottomRight,
        height: 350,
        width: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(ItemController.image_item6)
          )
        ),
        child: Text(
          '${RFIDRead_GX.Handsanitizer_OfferGX_display.value} ',
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
                '   Price: RM ${RFIDRead_GX.Handsanitizer_PriceGX_display.value}',
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
                '   Location: ${RFIDRead_GX.Handsanitizer_LocationGX_display.value}',
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
            '${RFIDRead_GX.Handsanitizer_DescriptionGX_display.value}',
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

Widget Navigation (BuildContext context) {
  ItemInfoAPI RFIDRead_GX = Get.find();
  final componentsize = SizingComponent();
  final navigationfunction = APIcommunication();
  return AlertDialog(
    content: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height, 
      child: Column(
        children: [
          Text(
            'Please Following',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width/10,
              fontWeight: FontWeight.bold
            ),
          ),
          Lottie.asset(
            ItemController.animation_following,
            //width: screenwidth,
            height: 350,
            repeat: true,
            //fit: BoxFit.cover
          ),
          Text(
            '${RFIDRead_GX.Handsanitizer_NameGX_display.value} ${RFIDRead_GX.Handsanitizer_LocationGX_display.value}',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 50,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    ),
    actions: [
      TextButton(
        onPressed: () {
          navigationfunction.Cancelaction();
          Navigator.pop(context);
        }, 
        child: Text(
          'Cancel',
          style: TextStyle(
            fontSize: 30, 
            fontWeight: FontWeight.w400
          ),
        )
      ),
    ],
  );
}



/*
navigationfunction.Sendcoordinate('1');
                  showDialog(
                    context: context, 
                    builder: (context) => AlertDialog(
                      content: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height, 
                        child: Text(
                          'Please Following',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width/10,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            navigationfunction.Cancelaction();
                            Navigator.pop(context);
                          }, 
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: componentsize.dialogcancel_size
                            ),
                          )
                        ),
                        TextButton(
                          onPressed: () {
                            navigationfunction.Cancelaction();
                            Navigator.pop(context);
                          }, 
                          child: Text(
                            'Navigation',
                            style: TextStyle(
                              fontSize: componentsize.dialogcancel_size
                            ),
                          )
                        )
                      ],
                    ),
                  );
*/