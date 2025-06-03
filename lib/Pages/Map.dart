import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:supermarket_robot_ui/Controller/itemcontroller.dart';

class Supermarket_Map extends StatelessWidget {
  const Supermarket_Map({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              child: Text(
                "Supermarket Map",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Color.fromARGB(255, 83, 82, 82)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              child: Container(
                alignment: Alignment.bottomRight,
                height: 720,
                width: 1020,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ItemController.map_image)
                  )
                )
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              child: Text(
                "3D View",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 50,
                  color: Color.fromARGB(255, 83, 82, 82)
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 25, bottom: 25),
              child: Container(
                alignment: Alignment.bottomRight,
                height: 600,
                width: 900,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(ItemController.View3D_image)
                  )
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}