// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:calculator_binary_hexa/logic/converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Calculate decimal to binary (first)', () {
    expect(Converter.calculateDecimalToBinary(5), equals('101'));
  });
  test('Calculate decimal to binary (second)', () {
    expect(Converter.calculateDecimalToBinary(93), equals('1011101'));
  });
  test('Calculate decimal to binary (third)', () {
    expect(Converter.calculateDecimalToBinary(157), equals('10011101'));
  });

  test('Calculate binary to decimal (first)', () {
    expect(Converter.calculateBinaryToDecimal(101101101), 365);
  });

  test('Calculate binary to decimal (second)', () {
    expect(Converter.calculateBinaryToDecimal(10100011), 163);
  });

  test('Calculate binary to decimal (third)', () {
    expect(Converter.calculateBinaryToDecimal(110111), 55);
  });
  test('Calculate hexa to decimal (first)', () {
    expect(Converter.calculateHexaToDecimal('2A3'), 675);
  });
  test('Calculate hexa to decimal (second)', () {
    expect(Converter.calculateHexaToDecimal('C'), 12);
  });
  test('Calculate hexa to decimal (third)', () {
    expect(Converter.calculateHexaToDecimal('3A6'), 934);
  });
  test('Calculate decimal to hexa (first)', () {
    expect(Converter.calculateDecimalToHexa(255), 'FF');
  });

  test('Calculate decimal to hexa (second)', () {
    expect(Converter.calculateDecimalToHexa(1456), '5B0');
  });

  test('Calculate decimal to hexa (first)', () {
    expect(Converter.calculateDecimalToHexa(5), '5');
  });
}
