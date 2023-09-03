import 'package:flutter/foundation.dart';

class TextScaleFactorNotifier extends ChangeNotifier {
  double _textScaleFactor = 1.0;

  double get textScaleFactor => _textScaleFactor;

  void increaseTextScale() {
    _textScaleFactor += 0.1;
    notifyListeners();
  }

  void decreaseTextScale() {
    _textScaleFactor -= 0.1;
    notifyListeners();
  }
}