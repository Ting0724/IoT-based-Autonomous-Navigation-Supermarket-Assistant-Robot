import 'package:flutter/material.dart';
import 'package:supermarket_robot_ui/API%20Controller/APIcommunication.dart';

class BackOrigin extends StatefulWidget {
  const BackOrigin({super.key});

  @override
  State<BackOrigin> createState() => _BackOriginState();
}

class _BackOriginState extends State<BackOrigin> {
  final APIfunction = APIcommunication();
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Robot Will Go Back to Origin",
        style: TextStyle(
          fontSize: 40, 
          color: Colors.black, 
          fontWeight: FontWeight.w800,
        ),
        textAlign: TextAlign.center
      ),
      content: Text(
        "Please click 'OK' button, then robot will go back to its origin.\nOtherwise, please click 'Cancel' button.\nThanks for using."
      ),
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
            APIfunction.BackOrigin();
            Navigator.pop(context);
          }, 
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: 30, 
              fontWeight: FontWeight.w400
            ),
          )
        )
      ],
    );
  }
}