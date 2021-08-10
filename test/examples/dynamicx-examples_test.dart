
import 'package:convenient_utils/classes/Dynamicx.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Basic Usage", () => basicUsage());
  test("Basic Usage 2", () => basicUsage2());
  test("Basic Usage 3", () => basicUsage3());
  test("Basic Usage 4", () => basicUsage4());
  test("Basic Usage 5", () => basicUsage5());
}

void basicUsage() {
  dynamic value = {"Hello": "World"};
  dynamic _value = Dynamicx.xparse(value);
  print("basicUsage => $_value");
  assert(_value==value);
}

void basicUsage2() {
  dynamic value = 1.345;
  dynamic _value = Dynamicx.xparse(value);
  print("basicUsage2 => $_value");
  assert(_value==value);
}

void basicUsage3() {
  dynamic value = true;
  dynamic _value = Dynamicx.xparse(value);
  print("basicUsage3 => $_value");
  assert(_value==value);
}

void basicUsage4() {
  dynamic value = [1,2,3];
  dynamic _value = Dynamicx.xparse(value);
  print("basicUsage4 => $_value");
  assert(_value==value);
}

void basicUsage5() {
  dynamic value = "Hello, World!";
  dynamic _value = Dynamicx.xparse(value);
  print("basicUsage5 => $_value");
  assert(_value==value);
}
