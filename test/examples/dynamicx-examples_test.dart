
import 'package:convenient_utils/classes/Dynamicx.dart';
import 'package:flutter_test/flutter_test.dart';

import 'models/my_class.dart';

void main() {
  test("Basic Usage", basicUsage);
  test("Basic Usage 2", basicUsage2);
  test("Basic Usage 3", basicUsage3);
  test("Basic Usage 4", basicUsage4);
  test("Basic Usage 5", basicUsage5);
  test("Get Property", getPropertyOfDynamic);
  test("Check value is INT", checkIsInt);
  test("Check value is not INT", checkIsNotInt);
  test("Check value is DOUBLE", checkIsDouble);
  test("Check value is not DOUBLE", checkIsNotDouble);
  test("Check value is BOOL", checkIsBool);
  test("Check value is not BOOL", checkIsNotBool);
  test("Check value is STRING", checkIsString);
  test("Check value is not STRING", checkIsNotString);
  test("Check value is LIST", checkIsList);
  test("Check value is not LIST", checkIsNotList);
  test("Check value is MAP", checkIsMap);
  test("Check value is not MAP", checkIsNotMap);
  test("Get INT as BOOL", getIntAsBool);
  test("Get NESTED INT as BOOL", getNestedIntAsBool);
  test("Get NULL as BOOL", getNullAsBool);
  test("Get 'yes' as BOOL", getLowerYesAsBool);
  test("Get 'YES' as BOOL", getUpperYesAsBool);
  test("Get 'Yes' as BOOL", getCamelYesAsBool);
  test("Get 'y' as BOOL", getLowerYasBool);
  test("Get 'Y' as BOOL", getUpperYasBool);
  test("Get 'no' as BOOL", getLowerNoAsBool);
  test("Get 'NO' as BOOL", getUpperNoAsBool);
  test("Get 'No' as BOOL", getCamelNoAsBool);
  test("Get 'n' as BOOL", getLowerNasBool);
  test("Get 'N' as BOOL", getUpperNasBool);
  test("Get INT as STRING", getIntAsString);
  test("Get DOUBLE as STRING", getDoubleAsString);
  test("Get MAP as STRING", getMapAsString);
  test("Get LIST as STRING", getListAsString);
  test("Get Custom Class as STRING", getCustomClassAsString);
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

void getPropertyOfDynamic() {
  dynamic value = {"Hello": "World"};
  dynamic propValue = Dynamicx(value).prop("Hello", outputType: Typex.string, fallback: "Can't Find");
  print("getPropertyOfDynamic => $propValue");
  assert(propValue==value["Hello"]);
}

void checkIsInt() {
  dynamic value = 25;
  bool isInt = Dynamicx.isType(value, Typex.int);
  print("checkIsInt => $isInt");
  assert(isInt==true);
}

void checkIsNotInt() {
  dynamic value = "red.25";
  bool isInt = Dynamicx.isType(value, Typex.int);
  print("checkIsNotInt => $isInt");
  assert(isInt==false);
}

void checkIsDouble() {
  dynamic value = 68.9;
  bool isDouble = Dynamicx.isType(value, Typex.double);
  print("checkIsDouble => $isDouble");
  print(isDouble==true);
}

void checkIsNotDouble() {
  dynamic value = "blue.68.9";
  bool isDouble = Dynamicx.isType(value, Typex.double);
  print("checkIsNotDouble => $isDouble");
  assert(isDouble==false);
}

void checkIsBool() {
  dynamic value = true;
  bool isBool = Dynamicx.isType(value, Typex.bool);
  print("checkIsBool => $isBool");
  assert(isBool==true);
}

void checkIsNotBool() {
  dynamic value = "not.true";
  bool isBool = Dynamicx.isType(value, Typex.bool);
  print("checkIsNotBool => $isBool");
  assert(isBool==false);
}

void checkIsString() {
  dynamic value = "Hello, World!";
  bool isString = Dynamicx.isType(value, Typex.string);
  print("checkIsString => $isString");
  assert(isString==true);
}

void checkIsNotString() {
  dynamic value = 15.76;
  bool isString = Dynamicx.isType(value, Typex.string);
  print("checkIsNotString => $isString");
  assert(isString==false);
}

void checkIsList() {
  dynamic value = [1,2,3,4];
  bool isList = Dynamicx.isType(value, Typex.list);
  print("checkIsList => $isList");
  assert(isList==true);
}

void checkIsNotList() {
  dynamic value;
  bool isList = Dynamicx.isType(value, Typex.list);
  print("checkIsNotList => $isList");
  assert(isList==false);
}

void checkIsMap() {
  dynamic value = {"Hello": "World"};
  bool isMap = Dynamicx.isType(value, Typex.map);
  print("checkIsMap => $isMap");
  assert(isMap==true);
}

void checkIsNotMap() {
  dynamic value = ["first", "second", "third"];
  bool isMap = Dynamicx.isType(value, Typex.map);
  print("checkIsNotMap => $isMap");
  assert(isMap==false);
}

void getIntAsBool() {
  dynamic value = 1;
  bool _value = Dynamicx.xasBool(value);
  print("getAsBool => $_value");
  assert(_value==true);
}

void getNestedIntAsBool() {
  dynamic value = {"status": 1};
  bool _value = Dynamicx.xasBool(value, varPath: "status");
  print("getAsBool2 => $_value");
  assert(_value==true);
}

void getNullAsBool() {
  dynamic value;
  bool _value = Dynamicx.xasBool(value);
  print("getNullAsBool => $_value");
  assert(_value==false);
}

void getLowerYesAsBool() {
  dynamic value = "yes";
  bool _value = Dynamicx.xasBool(value);
  print("getLowerYesAsBool => $_value");
  assert(_value==true);
}

void getUpperYesAsBool() {
  dynamic value = "YES";
  bool _value = Dynamicx.xasBool(value);
  print("getUpperYesAsBool => $_value");
  assert(_value==true);
}

void getCamelYesAsBool() {
  dynamic value = "Yes";
  bool _value = Dynamicx.xasBool(value);
  print("getCamelYesAsBool => $_value");
  assert(_value==true);
}

void getLowerYasBool() {
  dynamic value = "y";
  dynamic _value = Dynamicx.xasBool(value);
  print("getLowerYAsBool => $_value");
  assert(_value==true);
}

void getUpperYasBool() {
  dynamic value = "Y";
  dynamic _value = Dynamicx.xasBool(value);
  print("getUpperYasBool => $_value");
  assert(_value==true);
}

void getLowerNoAsBool() {
  dynamic value = "no";
  bool _value = Dynamicx.xasBool(value);
  print("getLowerNoAsBool => $_value");
  assert(_value==false);
}

void getUpperNoAsBool() {
  dynamic value = "NO";
  bool _value = Dynamicx.xasBool(value);
  print("getUpperNoAsBool => $_value");
  assert(_value==false);
}

void getCamelNoAsBool() {
  dynamic value = "No";
  bool _value = Dynamicx.xasBool(value);
  print("getCamelNoAsBool => $_value");
  assert(_value==false);
}

void getLowerNasBool() {
  dynamic value = "n";
  dynamic _value = Dynamicx.xasBool(value);
  print("getLowerNasBool => $_value");
  assert(_value==false);
}

void getUpperNasBool() {
  dynamic value = "N";
  dynamic _value = Dynamicx.xasBool(value);
  print("getUpperNasBool => $_value");
  assert(_value==false);
}

void getIntAsString() {
  dynamic value = 15;
  String _value = Dynamicx.xasString(value);
  print("getIntAsString => $_value");
  assert(_value=="15");
}

void getDoubleAsString() {
  dynamic value = 15.6;
  String _value = Dynamicx.xasString(value);
  print("getDoubleAsString => $_value");
  assert(_value=="15.6");
}

void getMapAsString() {
  dynamic value = {"Hello": "World"};
  String _value = Dynamicx.xasString(value);
  print("getMapAsString => $_value");
  assert(_value=='{"Hello":"World"}');
}

void getListAsString() {
  dynamic value = [1,"two",3,"four"];
  String _value = Dynamicx.xasString(value);
  print("getListAsString => $_value");
  assert(_value=='[1,"two",3,"four"]');
}

void getCustomClassAsString() {
  MyClass myClass = new MyClass(id: "1", name: "Item 1", description: "The first item");
  String _value = Dynamicx.xasString(myClass);
  print("getCustomClassAsString => $_value");
  assert(_value=='{"id":"1","name":"Item 1","description":"The first item"}');
}

