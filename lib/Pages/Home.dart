import 'package:flutter/material.dart';
import 'package:supermarket_robot_ui/API%20Controller/APIcommunication.dart';
import 'package:supermarket_robot_ui/Items/item1.dart';
import 'package:supermarket_robot_ui/Items/item10.dart';
import 'package:supermarket_robot_ui/Items/item11.dart';
import 'package:supermarket_robot_ui/Items/item12.dart';
import 'package:supermarket_robot_ui/Items/item2.dart';
import 'package:supermarket_robot_ui/Items/item3.dart';
import 'package:supermarket_robot_ui/Items/item4.dart';
import 'package:supermarket_robot_ui/Items/item5.dart';
import 'package:supermarket_robot_ui/Items/item6.dart';
import 'package:supermarket_robot_ui/Items/item7.dart';
import 'package:supermarket_robot_ui/Items/item8.dart';
import 'package:supermarket_robot_ui/Items/item9.dart';
import 'package:supermarket_robot_ui/main.dart';
import 'package:supermarket_robot_ui/sizing.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    feature_item = 1;
    feature_readrfid = 0;
    feature_paymentrfid = 0;
    final rfidfunction = APIcommunication();
    final componentsize = SizingComponent();

    rfidfunction.SendRFIDEnable("0","0");
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        //scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //First row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item1(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item2(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item3(),
                  ),
                ),
              ],
            ),
        
            //Second row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item4(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item5(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item6(),
                  ),
                ),
              ],
            ),
        
            //Third row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item7(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item8(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item9(),
                  ),
                ),
              ],
            ),
        
            //Fourth row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item10(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item11(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: componentsize.space_horizontal, right: componentsize.space_horizontal, top: componentsize.space_vertical, bottom: componentsize.space_vertical),
                  child: Container(
                    height: componentsize.height_item,
                    width: componentsize.width_item,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: componentsize.borderwidth),
                      borderRadius: BorderRadius.circular(componentsize.borderradius),
                    ),
                    child: const Item12(),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}