
import 'package:flutter_test/flutter_test.dart';

import '../../lib/classes/Boolx.dart';

void main() {
  test("Basic Usage", () => basicUsage());
  test("Basic Usage 2", () => basicUsage2());
  test("Use For Nested Property", () => useForNestedProperty());
}

void basicUsage() {
  bool source = true;
  bool _bool = Boolx.xparse(source);
  print("_bool => $_bool");
  assert(_bool==source);
}

void basicUsage2() {
  bool source = true;
  Boolx _boolx = new Boolx(source);
  print("_boolx => ${_boolx.value}");
  assert(_boolx.value==source);
}

void useForNestedProperty() {
  Map<String, dynamic> _map = {
    "user": {
      "settings": {
        "darkmode": true
      }
    }
  };
  bool _bool = Boolx.xparse(_map, varPath: "user.settings.darkmode");
  print("_bool => $_bool");
  assert(_bool==_map["user"]["settings"]["darkmode"]);
}