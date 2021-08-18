
import 'package:convenient_utils/classes/Boolx.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Basic Usage", basicUsage);
  test("Basic Usage 2", basicUsage2);
  test("Use For Nested Property", useForNestedProperty);
  test("Convert [] to BOOL (false)", convertEmptyListToBool);
  test("Convert [1,2,3] to BOOL (true)", convertListToBool);
  test("Convert INT (1) to BOOL (true)", convertIntToBool);
  test("Convert DOUBLE (1.0) to BOOL (true)", convertDoubleToBool);
  test("Convert 'yes', 'YES', 'Yes' to BOOL (true)", convertYesStringToBool);
  test("Convert 'y', 'Y' to BOOL (true)", convertYStringToBool);
  test("Convert 'no', 'NO', 'No' to BOOL (false)", convertNoStringToBool);
  test("Convert 'n', 'N' to BOOL (false)", convertNStringToBool);
  test("Fallback to FALSE when NULL", fallbackToFalseWhenNull);
  test("Fallback to TRUE when NULL", fallbackToTrueWhenNull);
  test("Convert TRUE to INT", convertTrueToInt);
  test("Convert FALSE to INT", convertFalseToInt);
  test("Convert NULL to INT", convertNullToInt);
  test("Convert Nested to INT", convertNestedToInt);
  test("Convert TRUE to DOUBLE", convertTrueToDouble);
  test("Convert FALSE to DOUBLE", convertFalseToDouble);
  test("Convert NULL to DOUBLE", convertNullToDouble);
  test("Convert Nested to DOUBLE", convertNestedToDouble);
  test("Convert TRUE to 'true'", convertTrueToTrueString);
  test("Convert FALSE to 'false'", convertFalseToFalseString);
  test("Convert NULL to false'", convertNullToFalseString);
  test("Convert NULL to 'true'", convertNullToTrueString);
  test("Convert NULL to 'True'", convertNullToCamelTrueString);
  test("Convert NULL to 'False'", convertNullToCamelFalseString);
  test("Convert NULL to 'true'", convertNullToLowerTrueString);
  test("Convert NULL to 'TRUE'", convertNullToUpperTrueString);
  test("Convert NULL to 'FALSE'", convertNullToUpperFalseString);
  test("Convert Nested to 'true'", convertNestedToTrueString);
  test("Convert TRUE to 'yes'", convertTrueToYesString);
  test("Convert FALSE to 'no'", convertFalseToNoString);
  test("Convert NULL to 'no'", convertNullToNoString);
  test("Convert NULL to 'yes'", convertNullToYesString);
  test("Convert NULL to 'Yes'", convertNullToCamelYesString);
  test("Convert NULL to 'No'", convertNullToCamelNoString);
  test("Convert NULL to 'yes'", convertNullToLowerYesString);
  test("Convert NULL to 'YES'", convertNullToUpperYesString);
  test("Convert NULL to 'NO'", convertNullToUpperNoString);
  test("Convert Nested to 'yes'", convertNestedToYesString);
  test("Convert TRUE to 'y'", convertTrueToYString);
  test("Convert FALSE to 'n'", convertFalseToNString);
  test("Convert NULL to 'n'", convertNullToNString);
  test("Convert NULL to 'y'", convertNullToYString);
  test("Convert NULL to 'y'", convertNullToLowerYString);
  test("Convert NULL to 'Y'", convertNullToUpperYString);
  test("Convert NULL to 'N'", convertNullToUpperNString);
  test("Convert Nested to 'y'", convertNestedToYString);
}

void basicUsage() {
  bool source = true;
  bool _bool = Boolx.xparse(source);
  print("basicUsage => $_bool");
  assert(_bool==source);
}

void basicUsage2() {
  bool source = true;
  Boolx _boolx = new Boolx(source);
  print("basicUsage2 => ${_boolx.value}");
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
  print("useForNestedProperty => $_bool");
  assert(_bool==_map["user"]["settings"]["darkmode"]);
}

void convertEmptyListToBool() {
  List l = [];
  bool _bool = Boolx.xparse(l);
  print("convertEmptyListToBool => $_bool");
  assert(_bool==false);
}

void convertListToBool() {
  List l = [1,2,3];
  bool _bool = Boolx.xparse(l);
  print("convertListToBool => $_bool");
  assert(_bool==true);
}

void convertIntToBool() {
  int i = 1;
  bool _bool = Boolx.xparse(i);
  print("convertIntToBool => $_bool");
  assert(_bool==true);
}

void convertDoubleToBool() {
  double i = 1.0;
  bool _bool = Boolx.xparse(i);
  print("convertDoubleToBool => $_bool");
  assert(_bool==true);
}

void convertYesStringToBool() {
  String strLower = "yes";
  String strUpper = "YES";
  String strCamel = "Yes";
  bool _boolLower = Boolx.xparse(strLower);
  bool _boolUpper = Boolx.xparse(strUpper);
  bool _boolCamel = Boolx.xparse(strCamel);
  print("convertYesStringToBool lower => $_boolLower");
  print("convertYesStringToBool upper => $_boolUpper");
  print("convertYesStringToBool camel => $_boolCamel");
  assert(_boolLower==true && _boolUpper==true && _boolCamel==true);
}

void convertYStringToBool() {
  String strLower = "y";
  String strUpper = "Y";
  bool _boolLower = Boolx.xparse(strLower);
  bool _boolUpper = Boolx.xparse(strUpper);
  print("convertYStringToBool lower => $_boolLower");
  print("convertYStringToBool upper => $_boolUpper");
  assert(_boolLower==true && _boolUpper==true);
}

void convertNoStringToBool() {
  String strLower = "no";
  String strUpper = "NO";
  String strCamel = "No";
  bool _boolLower = Boolx.xparse(strLower);
  bool _boolUpper = Boolx.xparse(strUpper);
  bool _boolCamel = Boolx.xparse(strCamel);
  print("convertNoStringToBool lower => $_boolLower");
  print("convertNoStringToBool upper => $_boolUpper");
  print("convertNoStringToBool camel => $_boolCamel");
  assert(_boolLower==false && _boolUpper==false && _boolCamel==false);
}

void convertNStringToBool() {
  String strLower = "n";
  String strUpper = "N";
  bool _boolLower = Boolx.xparse(strLower);
  bool _boolUpper = Boolx.xparse(strUpper);
  print("convertNStringToBool lower => $_boolLower");
  print("convertNStringToBool upper => $_boolUpper");
  assert(_boolLower==false && _boolUpper==false);
}

void fallbackToTrueWhenNull() {
  bool? source;
  bool _bool = Boolx.xparse(source, fallback: true);
  print("fallbackToTrueWhenNull => $_bool");
  assert(_bool==true);
}

void fallbackToFalseWhenNull() {
  bool? source;
  bool _bool = Boolx.xparse(source);
  print("fallbackToFalseWhenNull => $_bool");
  assert(_bool==false);
}

void convertTrueToInt() {
  bool source = true;
  int i = Boolx.xasInt(source);
  print("convertTrueToInt => $i");
  assert(i==1);
}

void convertFalseToInt() {
  bool source = false;
  int i = Boolx.xasInt(source);
  print("convertFalseToInt => $i");
  assert(i==0);
}

void convertNullToInt() {
  bool? source;
  int i = Boolx.xasInt(source);
  print("convertNullToInt => $i");
  assert(i==0);
}

void convertNestedToInt() {
  Map<String, dynamic> _map = {
    "user": {
      "settings": {
        "darkmode": true
      }
    }
  };
  int i = Boolx.xasInt(_map, varPath: "user.settings.darkmode");
  print("convertNestedToInt => $i");
  assert(i==1);
}

void convertTrueToDouble() {
  bool source = true;
  double i = Boolx.xasDouble(source);
  print("convertTrueToDouble => $i");
  assert(i==1);
}

void convertFalseToDouble() {
  bool source = false;
  double i = Boolx.xasDouble(source);
  print("convertFalseToDouble => $i");
  assert(i==0);
}

void convertNullToDouble() {
  bool? source;
  double i = Boolx.xasDouble(source);
  print("convertFalseToDouble => $i");
  assert(i==0);
}

void convertNestedToDouble() {
  Map<String, dynamic> _map = {
    "user": {
      "settings": {
        "darkmode": true
      }
    }
  };
  double i = Boolx.xasDouble(_map, varPath: "user.settings.darkmode");
  print("convertNestedToInt => $i");
  assert(i==1);
}

void convertTrueToTrueString() {
  bool source = true;
  String str = Boolx.xasTrueFalse(source);
  print("convertTrueToTrueString => $str");
  assert(str=="true");
}

void convertFalseToFalseString() {
  bool source = false;
  String str = Boolx.xasTrueFalse(source);
  print("convertFalseToFalseString => $str");
  assert(str=="false");
}

void convertNullToFalseString() {
  bool? source;
  String str = Boolx.xasTrueFalse(source);
  print("convertNullToFalseString => $str");
  assert(str=="false");
}

void convertNullToTrueString() {
  bool? source;
  String str = Boolx.xasTrueFalse(source, fallback: true);
  print("convertNullToTrueString => $str");
  assert(str=="true");
}

void convertNullToCamelTrueString() {
  bool? source;
  String str = Boolx.xasTrueFalse(source, fallback: true, format: BoolxFormat.camelCase);
  print("convertNullToCamelTrueString => $str");
  assert(str=="True");
}


void convertNullToCamelFalseString() {
  bool? source;
  String str = Boolx.xasTrueFalse(source, format: BoolxFormat.camelCase);
  print("convertNullToCamelFalseString => $str");
  assert(str=="False");
}

void convertNullToLowerTrueString() {
  bool? source;
  String str = Boolx.xasTrueFalse(source, fallback: true, format: BoolxFormat.lowerCase);
  print("convertNullToUpperTrueString => $str");
  assert(str=="true");
}

void convertNullToUpperTrueString() {
  bool? source;
  String str = Boolx.xasTrueFalse(source, fallback: true, format: BoolxFormat.upperCase);
  print("convertNullToUpperTrueString => $str");
  assert(str=="TRUE");
}

void convertNullToUpperFalseString() {
  bool? source;
  String str = Boolx.xasTrueFalse(source, format: BoolxFormat.upperCase);
  print("convertNullToUpperFalseString => $str");
  assert(str=="FALSE");
}

void convertNestedToTrueString() {
  Map<String, dynamic> _map = {
    "user": {
      "settings": {
        "darkmode": true
      }
    }
  };
  String str = Boolx.xasTrueFalse(_map, varPath: "user.settings.darkmode");
  print("convertNestedToTrueString => $str");
  assert(str=="true");
}

void convertTrueToYesString() {
  bool source = true;
  String str = Boolx.xasYesNo(source);
  print("convertTrueToYesString => $str");
  assert(str=="yes");
}

void convertFalseToNoString() {
  bool source = false;
  String str = Boolx.xasYesNo(source);
  print("convertFalseToNoString => $str");
  assert(str=="no");
}

void convertNullToNoString() {
  bool? source;
  String str = Boolx.xasYesNo(source);
  print("convertNullToNoString => $str");
  assert(str=="no");
}

void convertNullToYesString() {
  bool? source;
  String str = Boolx.xasYesNo(source, fallback: true);
  print("convertNullToYesString => $str");
  assert(str=="yes");
}

void convertNullToCamelYesString() {
  bool? source;
  String str = Boolx.xasYesNo(source, fallback: true, format: BoolxFormat.camelCase);
  print("convertNullToCamelYesString => $str");
  assert(str=="Yes");
}


void convertNullToCamelNoString() {
  bool? source;
  String str = Boolx.xasYesNo(source, format: BoolxFormat.camelCase);
  print("convertNullToCamelNoString => $str");
  assert(str=="No");
}

void convertNullToLowerYesString() {
  bool? source;
  String str = Boolx.xasYesNo(source, fallback: true, format: BoolxFormat.lowerCase);
  print("convertNullToLowerYesString => $str");
  assert(str=="yes");
}

void convertNullToUpperYesString() {
  bool? source;
  String str = Boolx.xasYesNo(source, fallback: true, format: BoolxFormat.upperCase);
  print("convertNullToUpperYesString => $str");
  assert(str=="YES");
}

void convertNullToUpperNoString() {
  bool? source;
  String str = Boolx.xasYesNo(source, format: BoolxFormat.upperCase);
  print("convertNullToUpperNoString => $str");
  assert(str=="NO");
}

void convertNestedToYesString() {
  Map<String, dynamic> _map = {
    "user": {
      "settings": {
        "darkmode": true
      }
    }
  };
  String str = Boolx.xasYesNo(_map, varPath: "user.settings.darkmode");
  print("convertNestedToYesString => $str");
  assert(str=="yes");
}

void convertTrueToYString() {
  bool source = true;
  String str = Boolx.xasYN(source);
  print("convertTrueToYString => $str");
  assert(str=="y");
}

void convertFalseToNString() {
  bool source = false;
  String str = Boolx.xasYN(source);
  print("convertFalseToNString => $str");
  assert(str=="n");
}

void convertNullToNString() {
  bool? source;
  String str = Boolx.xasYN(source);
  print("convertNullToNString => $str");
  assert(str=="n");
}

void convertNullToYString() {
  bool? source;
  String str = Boolx.xasYN(source, fallback: true);
  print("convertNullToYString => $str");
  assert(str=="y");
}

void convertNullToLowerYString() {
  bool? source;
  String str = Boolx.xasYN(source, fallback: true, format: BoolxFormat.lowerCase);
  print("convertNullToLowerYString => $str");
  assert(str=="y");
}

void convertNullToUpperYString() {
  bool? source;
  String str = Boolx.xasYN(source, fallback: true, format: BoolxFormat.upperCase);
  print("convertNullToUpperYString => $str");
  assert(str=="Y");
}

void convertNullToUpperNString() {
  bool? source;
  String str = Boolx.xasYN(source, format: BoolxFormat.upperCase);
  print("convertNullToUpperNString => $str");
  assert(str=="N");
}

void convertNestedToYString() {
  Map<String, dynamic> _map = {
    "user": {
      "settings": {
        "darkmode": true
      }
    }
  };
  String str = Boolx.xasYN(_map, varPath: "user.settings.darkmode");
  print("convertNestedToYString => $str");
  assert(str=="y");
}