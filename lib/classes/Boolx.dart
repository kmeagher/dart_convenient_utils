
import '../utils/boolx-utils.dart';

export '../utils/boolx-utils.dart' show BoolxFormat;

class Boolx {

  bool? value;

  Boolx(dynamic value, {String? varPath, bool nullable = true, bool fallback = false}) {
    this.value = BoolxUtils.parse(value, varPath: varPath, fallback: fallback);
  }

  bool parse({String? varPath, bool fallback = false}) {
    return xparse(this.value, varPath: varPath, fallback: fallback);
  }

  static bool xparse(dynamic value, {String? varPath, bool fallback = false}) {
    return BoolxUtils.parse(value, varPath: varPath, fallback: fallback);
  }

  int asInt({String? varPath}) {
    return xasInt(this.value, varPath: varPath);
  }

  static int xasInt(dynamic value, {String? varPath}) {
    return BoolxUtils.asInt(value, varPath: varPath);
  }

  double asDouble({String? varPath}) {
    return xasDouble(this.value, varPath: varPath);
  }

  static double xasDouble(dynamic value, {String? varPath}) {
    return BoolxUtils.asDouble(value, varPath: varPath);
  }

  String asTrueFalse({String? varPath, bool fallback = false, BoolxFormat format = BoolxFormat.lowerCase}) {
    return xasTrueFalse(this.value, varPath: varPath, fallback: fallback);
  }

  static String xasTrueFalse(dynamic value, {String? varPath, bool fallback = false, BoolxFormat format = BoolxFormat.lowerCase}) {
    return BoolxUtils.asTrueFalse(value, varPath: varPath, fallback: fallback, format: format);
  }

  String asYesNo({String? varPath, bool fallback = false, BoolxFormat format = BoolxFormat.lowerCase}) {
    return xasYesNo(this.value, varPath: varPath, fallback: fallback, format: format);
  }

  static String xasYesNo(dynamic value, {String? varPath, bool fallback = false, BoolxFormat format = BoolxFormat.lowerCase}) {
    return BoolxUtils.asYesNo(value, varPath: varPath, fallback: fallback, format: format);
  }

  String asYN({String? varPath, bool fallback = false, BoolxFormat format = BoolxFormat.lowerCase}) {
    return xasYN(this.value, varPath: varPath, fallback: fallback, format: format);
  }

  static String xasYN(dynamic value, {String? varPath, bool fallback = false, BoolxFormat format = BoolxFormat.lowerCase}) {
    return BoolxUtils.asYN(value, varPath: varPath, fallback: fallback, format: format);
  }

}