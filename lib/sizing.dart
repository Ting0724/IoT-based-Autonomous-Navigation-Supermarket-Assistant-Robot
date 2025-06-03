import 'package:supermarket_robot_ui/main.dart';

class SizingComponent {
  static const ratio = 1.0;
  static const ratio_height = 844.0755004882812;
  static const ratio_width = 1739.773681640625;
  final displayheight = screenheight;
  final displaywidth = screenwidth;
  final double screenheight_ratio = screenheight/ratio_height;
  final double screenwidth_ratio = screenwidth/ratio_width;

  //For topbar and menu
  late double topbar_size = 30.0 * ratio;
  late double menu_width = 100.0 * ratio;

  //For display item -- outer
  late double height_item = 310.0 * ratio;
  late double width_item = 300.0 * ratio;
  late double space_horizontal = 10.0 * ratio;
  late double space_vertical = 10.0 * ratio;
  late double borderwidth = 5.0 * ratio;
  late double borderradius = 10.0 * ratio;

  //For display item -- inner
  late double image_height = 200.0 * ratio;
  late double image_width = 300.0 * ratio;
  late double offertext_size = 20.0 * ratio;
  late double itemname_size = 30.0 * ratio;
  late double itemname_borderwidth = 5.0 * ratio;
  late double itemspace_right = 10.0 * ratio;
  late double itemspace_top = 0.0 * ratio;
  late double pricetext_size = 20.0 * ratio;
  late double buttonspace_left = 10.0 * ratio;
  late double buttonspace_top = 0.0 * ratio;
  late double buttontext_size = 20.0 * ratio;
  late double buttonsize_height = (30.0/1.5) * ratio;
  late double buttonsize_width = (130.0/1.5) * ratio;
  late double dialogcancel_size = 50.0 * ratio;
} 


/*
class SizingComponent {
  static const ratio = 1.5;
  static const ratio_height = 844.0755004882812;
  static const ratio_width = 1739.773681640625;
  final displayheight = screenheight;
  final displaywidth = screenwidth;
  final double screen_ratio = ((screenheight/ratio_height)+(screenwidth/ratio_width))/2.0;

  //For topbar and menu
  final topbar_size = 30.0 * ratio;
  final menu_width = 100.0 * ratio;

  //For display item -- outer
  final height_item = 300.0 * ratio;
  final width_item = 300.0 * ratio;
  final space = 10.0 * ratio;
  final borderwidth = 5.0 * ratio;
  final borderradius = 10.0 * ratio;

  //For display item -- inner
  final image_height = 200.0 * ratio;
  final image_width = 300.0 * ratio;
  final offertext_size = 20.0 * ratio;
  final itemname_size = 30.0 * ratio;
  final itemname_borderwidth = 5.0 * ratio;
  final itemspace_right = 10.0 * ratio;
  final itemspace_top = 5.0 * ratio;
  final pricetext_size = 20.0 * ratio;
  final buttonspace_left = 10.0 * ratio;
  final buttonspace_top = 5.0 * ratio;
  final buttontext_size = 20.0 * ratio;
  final dialogcancel_size = 100.0 * ratio;
} 

*/
