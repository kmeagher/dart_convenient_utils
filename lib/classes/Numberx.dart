
import '../utils/commonx-utils.dart';
import '../utils/numberx-utils.dart';

class Numberx {

  dynamic value;
  
  Numberx(dynamic value, {String? varPath, bool nullable = true, int? intFallback, double? doubleFallback}) {
    this.value = CommonxUtils.parse(value, path: varPath);
    if (this.value==null) {
      if (intFallback!=null) {
        this.value = intFallback;
      } else if (doubleFallback!=null) {
        this.value = doubleFallback;
      }
      if (this.value==null && !nullable) this.value = 0;
    }
  }

  int? parseInt({String? varPath, bool nullable = true, int? fallback}) {
    return xparseInt(this.value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  static int? xparseInt(dynamic value, {String? varPath, bool nullable = true, int? fallback}) {
    return NumberxUtils.parseInt(value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  int guaranteeInt({String? varPath, int fallback = 0}) {
    return xguaranteeInt(this.value, varPath: varPath, fallback: fallback);
  }

  static int xguaranteeInt(dynamic value, {String? varPath, int fallback = 0}) {
    return NumberxUtils.guaranteeInt(value, varPath: varPath, fallback: fallback);
  }

  double? parseDouble({String? varPath, bool nullable = true, double? fallback}) {
    return xparseDouble(this.value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  static double? xparseDouble(dynamic value, {String? varPath, bool nullable = true, double? fallback}) {
    return NumberxUtils.parseDouble(value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  double guaranteeDouble({String? varPath, double fallback = 0.0}) {
    return xguaranteeDouble(this.value, varPath: varPath, fallback: fallback);
  }

  static double xguaranteeDouble(dynamic value, {String? varPath, double fallback = 0.0}) {
    return NumberxUtils.guaranteeDouble(value, varPath: varPath);
  }

}