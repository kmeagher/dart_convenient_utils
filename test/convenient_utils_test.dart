import 'package:flutter_test/flutter_test.dart';

import 'package:convenient_utils/convenient_utils.dart';

Map valueA = {
  "int": 15,
  "double": 23.85,
  "string": { 
    "value": "Hello, World!"
  }
};

void main() {
  test('Test Stringx', () {
    dynamic value = DynamicxUtils.parse(valueA, outputType: Typex.string);
    print(value);
    // String a = Stringx.xguarantee(valueA, varPath: "string.value");
    // print("a => $a");
    // final calculator = Calculator();
    // expect(calculator.addOne(2), 3);
    // expect(calculator.addOne(-7), -6);
    // expect(calculator.addOne(0), 1);
  });
}

