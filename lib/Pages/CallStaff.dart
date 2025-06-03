import 'package:flutter/material.dart';
import 'package:supermarket_robot_ui/API%20Controller/APIcommunication.dart';

class Callstaff extends StatefulWidget {
  const Callstaff({super.key});

  @override
  State<Callstaff> createState() => _CallstaffState();
}

class _CallstaffState extends State<Callstaff> {
  final APIHelp = APIcommunication();
  late TextEditingController helpcontroller;

  @override
  void initState() {
    super.initState();
    helpcontroller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        "Contact Staff",
        style: TextStyle(
          fontSize: 40, 
          color: Colors.black, 
          fontWeight: FontWeight.w800,
        ),
        textAlign: TextAlign.center
      ),
      content: TextField(
        autofocus: true,
        decoration: InputDecoration(
          hintText: 'Please state the problem you encountered' 
        ),
        controller: helpcontroller,
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
            print("This is my problem");
            print(helpcontroller.text.runtimeType);
            APIHelp.SendHelp(helpcontroller.text);
            Navigator.pop(context);
            showDialog(
              context: context, 
              builder: (context) => AlertDialog (
                title: Text(
                  "Send Sucessfully",
                  style: TextStyle(
                    fontSize: 40, 
                    color: Colors.black, 
                    fontWeight: FontWeight.w800,
                  ),
                  textAlign: TextAlign.center
                ),
                content: Text(
                  "Please be patient as we're coming to help you!",
                  style: TextStyle(
                    fontSize: 30, 
                    fontWeight: FontWeight.w400
                  ),
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
                ],
              )
            );
          }, 
          child: Text(
            'Submit',
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