import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class ExamplePage extends StatefulWidget {
  const ExamplePage({super.key});

  @override
  State<ExamplePage> createState() => _ExamplePageState();
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 78, 34, 132),
    );
  }
}