import 'package:example_flutter/sequence/sequence_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Empty sequence', () {
    final model = new SequenceModel();
    expect(model.totalNumberOfBases, equals(0));
  });
  test('Adding individual bases saves base and notifies listeners', () {
    final model = new SequenceModel();
    int called = 0;
    model.addListener(() {
      expect(model.totalNumberOfBases, greaterThan(0));
      called++;
    });
    model.addBase("C".codeUnitAt(0));
    model.addBase("C".codeUnitAt(0));
    model.addBase("A".codeUnitAt(0));
    model.addBase("A".codeUnitAt(0));
    model.addBase("C".codeUnitAt(0));
    model.addBase("T".codeUnitAt(0));
    model.addBase("G".codeUnitAt(0));
    expect(model.totalNumberOfBases, equals(7));
    expect(new String.fromCharCodes(model.bases), equals("CCAACTG"));
    expect(called, equals(7));
  });
  test('Adding multiple bases saves base and notifies listeners once', () {
    final model = new SequenceModel();
    int called = 0;
    model.addListener(() {
      expect(model.totalNumberOfBases, greaterThan(0));
      called++;
    });
    model.addBases("CTTCT");
    model.addBases("TAAAGT");
    expect(model.totalNumberOfBases, equals(11));
    expect(new String.fromCharCodes(model.bases), equals("CTTCTTAAAGT"));
    expect(called, equals(2));
  });
}
