import 'dart:collection';

import 'package:example_flutter/sequence/sequence.dart';
import 'package:flutter/material.dart';

class ContigModel extends ChangeNotifier {
  final List<Sequence> _items = [];

  UnmodifiableListView<Sequence> get items => UnmodifiableListView(_items);

  int get totalNumberOfSequences => _items.length;

  void add(Sequence sequence) {
    _items.add(sequence);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }
}
