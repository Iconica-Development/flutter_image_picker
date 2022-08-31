import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_image_picker/calculator.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });

  test('substracts one from input values', () {
    final calculator = Calculator();
    expect(calculator.substractOne(40), 39);
    expect(calculator.substractOne(-10), -11);
    expect(calculator.substractOne(0), -1);
  });

  test('input value times ten', () {
    final calculator = Calculator();
    expect(calculator.valueTimesTen(9), 90);
    expect(calculator.valueTimesTen(0), 0);
  });

  test('input value divided by ten', () {
    final calculator = Calculator();
    expect(calculator.valueDividedByTen(100), 10);
    expect(calculator.valueDividedByTen(10), 1);
    expect(calculator.valueDividedByTen(0), 0);
  });
}
