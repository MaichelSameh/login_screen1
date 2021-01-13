import 'package:flutter/material.dart';

class Size {
  double _screenHeight;
  double _screenWidth;
  double _modelHeight = 760;
  double _modelWidth = 360;
  static const double pi = 22 / 7;
  final BuildContext context;
  Size(this.context);

  double screenHeight() {
    _screenHeight = MediaQuery.of(context).size.height;
    return _screenHeight;
  }

  double screenWidth() {
    _screenWidth = MediaQuery.of(context).size.width;
    return _screenWidth;
  }

  double sheetHeight() {
    _screenHeight = MediaQuery.of(context).size.height;
    return _screenHeight * 3 / 4;
  }

  double modelHeight() {
    return _modelHeight;
  }

  double modelWidth() {
    return _modelWidth;
  }

  double font(double fontSize) {
    if (_screenWidth == null) {
      _screenWidth = MediaQuery.of(context).size.width;
    }
    if (_screenHeight == null) {
      _screenHeight = MediaQuery.of(context).size.width;
    }
    double screenwidth =
        (_screenHeight > _screenWidth) ? _screenWidth : _screenHeight;
    double screenheight =
        (_screenHeight > _screenWidth) ? _screenHeight : _screenWidth;
    double finalFont = fontSize - (fontSize * 2 / 5);
    return (screenheight * (finalFont / screenwidth));
  }

  double height(double number) {
    if (_screenHeight == null) {
      _screenHeight = screenHeight();
    }
    double result = _screenHeight * (number / _modelHeight);
    return result;
  }

  double width(double number) {
    if (_screenWidth == null) {
      _screenWidth = screenWidth();
    }
    return _screenWidth * (number / _modelWidth);
  }

  List<int> statusDash(
      {@required int dashNumber,
      @required double radius,
      @required double maxSpace}) {
    int space = _space(dashNumber, maxSpace, radius);
    double result = _cicumference(radius) - (space * dashNumber);
    return [result ~/ dashNumber, space];
  }

  int _space(int number, double max, double radius) {
    max = height(max);
    if (number == 1) {
      return 0;
    } else if ((number * max) < _cicumference(radius) / 3) {
      return max.toInt();
    } else {
      int temp = 1;
      while ((max / temp) * number > (_cicumference(radius) / 3)) {
        ++temp;
      }
      double result = (max / temp);
      return height(result).toInt();
    }
  }

  double _cicumference(double radius) {
    double result = height(radius) * 2 * pi;
    return result;
  }

  double circle(double number) {
    double result = height(number * 2);
    return result;
  }
}
