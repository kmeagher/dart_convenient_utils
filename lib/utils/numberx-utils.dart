
/// Globally accessible list of exceptions caught and handled by Numberx
final List<dynamic> numberxCaughtExceptions = [];

class NumberxUtils {

  static int? parseInt(dynamic value, {String? varPath, bool nullable = true, int? fallback}) {
    if (value==null && nullable) return fallback;
    if (value==null && !nullable) {
      return fallback==null ? 0 : fallback;
    }
    if (value is Map && varPath!=null) {
      dynamic pathValue = value[varPath];
      return parseInt(pathValue, nullable: nullable, fallback: fallback);
    }
    if (value is int) return value;
    return int.tryParse(value);
  }

  static int guaranteeInt(dynamic value, {String? varPath, int? fallback}) {
    int? x = parseInt(value, varPath: varPath, fallback: fallback);
    if (x==null) return 0;
    return x;
  }

  static double? parseDouble(dynamic value, {String? varPath, bool nullable = true, double? fallback}) {
    if (value==null && nullable) return fallback;
    if (value==null && !nullable) {
      return fallback==null ? 0 : fallback;
    }
    if (value is Map && varPath!=null) {
      dynamic pathValue = value[varPath];
      return parseDouble(pathValue, nullable: nullable, fallback: fallback);
    }
    if (value is double) return value;
    return double.tryParse(value);
  }

  static double guaranteeDouble(dynamic value, {String? varPath, double? fallback}) {
    double? x = parseDouble(value, varPath: varPath, fallback: fallback);
    if (x==null) return 0;
    return x;
  }

}