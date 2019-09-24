import 'dart:collection';

import 'package:flutter/widgets.dart';

class SequenceModel extends ChangeNotifier {
  final List<int> bases = [];

  bool suspendNotifications = false;

  UnmodifiableListView<int> get items => UnmodifiableListView(bases);

  /// Total number of bases in this sequence
  int get totalNumberOfBases => bases.length;

  /// Adds [base] to the model.
  void addBase(int base) {
    bases.add(base);
    if (!suspendNotifications) {
      notifyListeners();
    }
  }

  void addBases(String multipleBases) {
    suspendNotifications = true;
    multipleBases.runes.forEach(addBase);
    suspendNotifications = false;
    notifyListeners();
  }
}
