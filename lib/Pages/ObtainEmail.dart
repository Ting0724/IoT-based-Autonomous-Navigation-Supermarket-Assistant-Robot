import 'package:flutter/material.dart';
import 'package:supermarket_robot_ui/API%20Controller/APIcommunication.dart';

class ObtainUserEmail extends StatefulWidget {
  const ObtainUserEmail({super.key});

  @override
  State<ObtainUserEmail> createState() => _ObtainUserEmailState();
}

class _ObtainUserEmailState extends State<ObtainUserEmail> {
  final DeleteRecordRFID = APIcommunication();
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final RecordPayment = APIcommunication();
    return AlertDialog(
      title: Text(
        "Email Address",
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
          hintText: 'Enter Your Email' 
        ),
        controller: controller,
      ),
      actions: [
        TextButton(
          onPressed: () {
            DeleteRecordRFID.DeleteRFIDRecord();
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
            print("This is my email");
            print(controller.text.runtimeType);
            RecordPayment.RecordPayment(controller.text);
            DeleteRecordRFID.DeleteRFIDRecord();
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
                content: Container(
                  height: 180.0,
                  child: const Column(
                    children: [
                      Text(
                        "Please Check Your Email",
                        style: TextStyle(
                          fontSize: 30, 
                          fontWeight: FontWeight.w400
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.0),
                        child: Text(
                          "If you don't receive the email within 5 minutes.\nPlease try again and make sure your email is correct. \nYou may also contact us.",
                          style: TextStyle(
                            fontSize: 15, 
                            fontWeight: FontWeight.w300
                          ),
                        ),
                      ),
                    ],
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