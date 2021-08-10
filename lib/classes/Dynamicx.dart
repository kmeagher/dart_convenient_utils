
import '../const/Typex.dart';
import '../utils/boolx-utils.dart';
import '../utils/dynamicx-utils.dart';
import '../utils/stringx-utils.dart';
import '../classes/stringx.dart';

export '../const/Typex.dart' show Typex;

class Dynamicx {

  dynamic value;

  Dynamicx(dynamic value, {String? varPath, bool nullable = true}) {
    this.value = xparse(value, varPath: varPath);
  }

  dynamic parse({String? varPath, bool nullable = true}) {
    return xparse(this.value, varPath: varPath, nullable: nullable);
  }

  static dynamic xparse(dynamic value, {String? varPath, bool nullable = true}) {
    if (nullable) {
      return DynamicxUtils.parse(value, varPath: varPath);
    }
    return DynamicxUtils.parse(value, varPath: varPath, outputType: Typex.dynamic);
  }

  bool xisType(Typex type) {
    return isType(this.value, type);
  }

  static bool isType(dynamic value, Typex type) {
    return DynamicxUtils.isType(value, type);
  }

  dynamic prop(String propName, {Typex outputType = Typex.nullable, dynamic fallback}) {
    return xprop(this.value, propName, outputType: outputType, fallback: fallback);
  }

  static dynamic xprop(dynamic value, String propName, {Typex outputType = Typex.nullable, dynamic fallback}) {
    return DynamicxUtils.parse(value, varPath: propName, outputType: outputType, fallback: fallback);
  }

  bool asBool({String? varPath, bool fallback = false}) {
    return xasBool(value, varPath: varPath, fallback: fallback);
  }

  static bool xasBool(dynamic value, {String? varPath, bool fallback = false}) {
    return BoolxUtils.parse(value, varPath: varPath, fallback: fallback);
  }

  String asString({String? varPath, String fallback = ""}) {
    return xasString(this.value, varPath: varPath, fallback: fallback);
  }

  static String xasString(dynamic value, {String? varPath, String fallback = ""}) {
    return StringxUtils.guarantee(value, varPath: varPath, fallback: fallback);
  }

  Stringx asStringx({String? varPath, bool nullable = true, String? fallback}) {
    return xasStringx(this.value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  static Stringx xasStringx(dynamic value, {String? varPath, bool nullable = true, String? fallback}) {
    return new Stringx(value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

}