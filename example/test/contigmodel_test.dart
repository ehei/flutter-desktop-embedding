import 'package:example_flutter/ContigModel.dart';
import 'package:example_flutter/sequence/sequence.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('model starts out empty', () {
    final model = new ContigModel();
    final startingNumber = model.totalNumberOfSequences;
    expect(startingNumber, equals(0));
  });
  test('adding sequences increases number', () {
    final model = new ContigModel();
    final startingNumber = model.totalNumberOfSequences;
    model.add(new Sequence());
    model.add(new Sequence());
    model.add(new Sequence());
    expect(model.totalNumberOfSequences, equals(startingNumber + 3));
  });
  test('adding sequences updates listeners', () {
    final model = new ContigModel();
    final startingNumber = model.totalNumberOfSequences;
    model.addListener(() {
      expect(model.totalNumberOfSequences, greaterThan(startingNumber));
    });
    model.add(new Sequence());
  });
}
