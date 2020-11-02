import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeConfig {
  static double _screenWidth;
  static double _screenHeight;
  static double _blockSizeHorizontal = 0;
  static double _blockSizeVertical = 0;

  static double textMultiplier;
  static double imageSizeMultiplier;

  void init(BoxConstraints constraints, Orientation orientation) {
    _screenWidth = orientation == Orientation.portrait
        ? constraints.maxWidth
        : constraints.maxHeight;
    _screenHeight = orientation == Orientation.portrait
        ? constraints.maxHeight
        : constraints.maxWidth;

    _blockSizeHorizontal = _screenWidth / 100;
    _blockSizeVertical = _screenHeight / 100;

    textMultiplier = _blockSizeVertical;
    imageSizeMultiplier = _blockSizeHorizontal;
  }
}
