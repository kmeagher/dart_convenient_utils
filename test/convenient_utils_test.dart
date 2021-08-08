import 'package:flutter_test/flutter_test.dart';

import 'package:convenient_utils/convenient_utils.dart';

class Product {
  int id = 0;
  String name = "unknown";
  String description = "unknown product";
  Product({this.id = 0, this.name = "unknown", this.description = "unknown product"});
}

const int intValue = 25;
const double doubleValue = 99.324;
const String strValue = "I know what you did last summer.";
List<Product> listValue = [
  new Product(id: 0, name: "Paper Towels", description: "Soft, absorbing paper towels"),
  new Product(id: 1, name: "Toilet Paper", description: "Soft, soothing toilet paper"),
  new Product(id: 2, name: "Wet Towelettes", description: "Soothing toilets")
];

const Map testModel = {
  "int": 15,
  "double": 23.85,
  "string": { 
    "value": "Hello, World!"
  },
  "bool": {
    "values": {
      "true": true,
      "false": false
    }
  },
  "list": [
    {
      "name": "Juice"
    },
    {
      "name": "Water"
    },
    {
      "name": "Soda"
    }
  ]
};



void main() {
  test('Basic Tests', () {
    int fifteen = Numberx.xguaranteeInt(testModel, varPath: "int");
    print(fifteen);
    assert(fifteen==15);
    double twentyThreePointEightyFive = Numberx.xguaranteeDouble(testModel, varPath: "double");
    print(twentyThreePointEightyFive);
    assert(twentyThreePointEightyFive==23.85);
    String helloWorld = Stringx.xguarantee(testModel, varPath: "string.value");
    print(helloWorld);
    assert(helloWorld=="Hello, World!");
    bool _boolTrue = Boolx.xparse(testModel, varPath: "bool.values.true");
    print(_boolTrue);
    assert(_boolTrue==true);
    bool _boolFalse = Boolx.xparse(testModel, varPath: "bool.values.false");
    print(_boolFalse);
    assert(_boolFalse==false);
  });
}

