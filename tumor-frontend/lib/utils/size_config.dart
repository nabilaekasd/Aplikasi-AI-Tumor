import 'package:flutter/widgets.dart';

class SizeConfig {
  // variables
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static const double _minWidth = 375.0; // mobile smallest
  static const double _maxWidth = 1920.0;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  // initiate
  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    _safeAreaHorizontal =
        _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }

  // basic block horizontal
  static double horizontal(double value) {
    return SizeConfig.blockSizeHorizontal * value;
  }

  // basic block vertical
  static double vertical(double value) {
    return SizeConfig.blockSizeVertical * value;
  }

  // safe block horizontal
  static double safeHorizontal(double value) {
    return SizeConfig.safeBlockHorizontal * value;
  }

  // safe block vertical
  static double safeVertical(double value) {
    return SizeConfig.safeBlockVertical * value;
  }

  // Fluid spacing yang menyesuaikan dengan lebar layar
  static double fluidSpacing(double minSpace, double maxSpace) {
    double scaleFactor = (screenWidth - _minWidth) / (_maxWidth - _minWidth);
    scaleFactor = scaleFactor.clamp(0.0, 1.0);
    return minSpace + (maxSpace - minSpace) * scaleFactor;
  }
}
