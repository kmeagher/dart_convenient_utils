
import 'commonx-utils.dart';
import 'stringx-utils.dart';

/// Globally accessible list of exceptions caught and handled by Numberx
final List<dynamic> numberxCaughtExceptions = [];

class NumberxUtils {

  static int? parseInt(dynamic value, {String? varPath, bool nullable = true, int? fallback}) {
    dynamic _value = CommonxUtils.parse(value, path: varPath);
    if (_value==null && nullable) return fallback;
    if (_value==null && !nullable) {
      return fallback==null ? 0 : fallback;
    }
    if (_value is int) return _value;
    return int.tryParse(StringxUtils.guarantee(_value));
  }

  static int guaranteeInt(dynamic value, {String? varPath, int? fallback}) {
    int? x = parseInt(value, varPath: varPath, fallback: fallback);
    if (x==null) return 0;
    return x;
  }

  static double? parseDouble(dynamic value, {String? varPath, bool nullable = true, double? fallback}) {
    dynamic _value = CommonxUtils.parse(value, path: varPath);
    if (_value==null && nullable) return fallback;
    if (_value==null && !nullable) {
      return fallback==null ? 0 : fallback;
    }
    if (_value is double) return _value;
    return double.tryParse(StringxUtils.guarantee(_value));
  }

  static double guaranteeDouble(dynamic value, {String? varPath, double? fallback}) {
    double? x = parseDouble(value, varPath: varPath, fallback: fallback);
    if (x==null) return 0;
    return x;
  }

}