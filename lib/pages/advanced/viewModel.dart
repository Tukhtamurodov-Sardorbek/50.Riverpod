import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _taps = 0;

  int get taps => _taps;

  void incrementTaps(){
    _taps++;
    notifyListeners();
  }
}
