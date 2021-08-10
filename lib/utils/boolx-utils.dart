
import 'commonx-utils.dart';

enum BoolxFormat {
  camelCase, lowerCase, upperCase
}

class BoolxUtils {

  static bool parse(dynamic value, {String? varPath, bool fallback = false}) {
    dynamic _value = CommonxUtils.parse(value, path: varPath);
    if (_value==null) return fallback;
    if (_value is bool) return _value;
    if (_value is String) return _value.trim().toLowerCase()=="y" || _value.trim().toLowerCase()=="yes" || _value.trim().toLowerCase()=="true" || _value.trim().toLowerCase()=="1";
    if (_value is List) return _value.length>0;
    if (_value is int) return _value==1;
    if (_value is double) return _value==1.0;
    return fallback;
  }

  static int asInt(dynamic value, {String? varPath}) {
    bool _value = parse(value, varPath: varPath);
    return _value ? 1 : 0;
  }

  static double asDouble(dynamic value, {String? varPath}) {
    bool _value = parse(value, varPath: varPath);
    return _value ? 1.0 : 0.0;
  }

  static String asTrueFalse(dynamic value, {String? varPath, bool fallback = false, BoolxFormat format = BoolxFormat.lowerCase}) {
    bool _value = parse(value, varPath: varPath, fallback: fallback);
    String str = _value ? "True" : "False";
    switch(format) {
      case BoolxFormat.camelCase:
        return str;
      case BoolxFormat.upperCase:
        return str.toUpperCase();
      default: 
        return str.toLowerCase();
    }
  }

  static String asYesNo(dynamic value, {String? varPath, bool fallback = false, BoolxFormat format = BoolxFormat.lowerCase}) {
    bool _value = parse(value, varPath: varPath, fallback: fallback);
    String str = _value ? "Yes" : "No";
    switch(format) {
      case BoolxFormat.camelCase:
        return str;
      case BoolxFormat.upperCase:
        return str.toUpperCase();
      default: 
        return str.toLowerCase();
    }
  }

  static asYN(dynamic value, {String? varPath, bool fallback = false, BoolxFormat format = BoolxFormat.lowerCase}) {
    bool _value = parse(value, varPath: varPath, fallback: fallback);
    String str = _value ? "Y" : "N";
    if (format==BoolxFormat.lowerCase) {
      return str.toLowerCase();
    }
    return str;
  }

}