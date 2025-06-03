import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supermarket_robot_ui/API%20Controller/APIcommunication.dart';
import 'package:supermarket_robot_ui/Pages/BackOrigin.dart';
import 'package:supermarket_robot_ui/Pages/CallStaff.dart';
import 'package:supermarket_robot_ui/Pages/Example.dart';
import 'package:supermarket_robot_ui/Pages/Map.dart';
import 'package:supermarket_robot_ui/Pages/RFIDCheck.dart';
import 'package:supermarket_robot_ui/Pages/RFIDPayment.dart';
import 'package:supermarket_robot_ui/Pages/home.dart';
import 'package:supermarket_robot_ui/sizing.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;
  final componentsize = SizingComponent();
  

  @override
  Widget build(BuildContext context) {

    final ButtonStyle style1 = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 20, color: Colors.white), 
      backgroundColor: Colors.red,
      //fixedSize: Size(componentsize.buttonsize_width, componentsize.buttonsize_height)
    );

    final ButtonStyle style2 = ElevatedButton.styleFrom(
      textStyle: TextStyle(fontSize: 20, color: Colors.white), 
      backgroundColor: Colors.green,
      //fixedSize: Size(componentsize.buttonsize_width, componentsize.buttonsize_height)
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Supermarket Assistant Robot",
          style: TextStyle(fontSize: componentsize.topbar_size, color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 8, 62, 90),
        centerTitle: true,
      ),
      body: Row(
        children: [
          NavigationRail(
            backgroundColor: Colors.white,
            useIndicator: true,
            indicatorColor: Colors.cyan,
            minWidth: componentsize.menu_width,
            labelType: NavigationRailLabelType.all,
            selectedLabelTextStyle: const TextStyle(
              color: Colors.lightBlue
            ),
            unselectedLabelTextStyle: const TextStyle(
              color: Colors.grey
            ),
            destinations: const [
              NavigationRailDestination(
                //icon: Icon(Icons.shopping_cart_outlined),
                icon: Icon(Icons.shopping_cart_outlined, size: 35,),
                label: Text(
                  'Item',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                )
              ),
              NavigationRailDestination(
                icon: Icon(Icons.search_outlined, size: 35),
                label: Text(
                  'Check',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                )
              ),
              NavigationRailDestination(
                icon: Icon(Icons.paid_outlined, size: 35),
                label: Text(
                  'Payment',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                )
              ),
              NavigationRailDestination(
                icon: Icon(Icons.map_outlined, size: 35),
                label: Text(
                  'Map',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                )
              )
            ], 
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            trailing: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        
                      )
                    ),
                    child: ElevatedButton (
                      style: style1,
                      onPressed: () {
                        showDialog(
                          context: context, 
                          builder: (context) => Callstaff()
                        );
                      }, 
                      child: Text(
                        ' Help ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(
                          
                        )
                      ),
                      child: ElevatedButton (
                        style: style2,
                        onPressed: () {
                          //APIfunction.BackOrigin();
                          showDialog(
                          context: context, 
                          builder: (context) => BackOrigin()
                        );
                        }, 
                        child: Text(
                          'Origin',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: buildPages(),
          )
        ],
      ),
    );
  }

  Widget buildPages() {
    switch (_selectedIndex) {
      case 0:
        return const HomePage();
        //return const ExamplePage();
      case 1:
        return const RFIDCheck();
      case 2:
        return const RFIDPayment();
      case 3:
        return const Supermarket_Map();
      default:
        return const HomePage();
    }
  }
}

