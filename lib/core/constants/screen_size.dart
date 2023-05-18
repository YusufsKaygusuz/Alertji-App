import 'package:flutter/material.dart';

class ScreenSize {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;

  static void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
  }
}


/*     
    Widget build(BuildContext context) {
    ScreenSize.init(context);  //init yaptıktan sonra o sayfada kullanılabilir 
    .
    .
    height: ScreenSize.screenWidth / 3,

 */