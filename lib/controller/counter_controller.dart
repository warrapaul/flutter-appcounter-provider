import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CounterController extends ChangeNotifier {
  int count = 4;

  //defining getters

  get increment {
    ++count;
    notifyListeners();
    return count;
  }

  get decrement {
    --count;
    notifyListeners();
    return count;
  }

  //as getter func

  get resetter {
    count = 0;
    notifyListeners();
  }

//normal func
  void reset() {
    count = 0;
    notifyListeners();
  }
}

class Stinger extends ChangeNotifier {
  String _name = 'Warra';

  set nam(String value) {
    _name = 'vic';
    notifyListeners();
  }

  get name {
    return _name;
  }
}
