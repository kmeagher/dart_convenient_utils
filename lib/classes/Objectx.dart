
import '../utils/commonx-utils.dart';
import '../utils/boolx-utils.dart';
import '../utils/stringx-utils.dart';
import '../utils/listx-utils.dart';
import '../utils/numberx-utils.dart';

class Objectx<T> {

  T? value;

  Objectx(T value) {
    this.value = value;
  }

  bool isNull() {
    return this.value==null;
  }

  bool isEmpty({String? varPath}) {
    return xisEmpty(this.value, varPath: varPath);
  }

  static xisEmpty(dynamic value, {String? varPath}) {
    return CommonxUtils.isEmpty(value, varPath: varPath);
  }

  bool asBool({String? varPath}) {
    return xasBool(this.value, varPath: varPath);
  }

  static bool xasBool(dynamic value, {String? varPath}) {
    return BoolxUtils.parse(value, varPath: varPath);
  }

  int? asNullableInt({String? varPath}) {
    return xasNullableInt(this.value, varPath: varPath);
  }

  static int? xasNullableInt(dynamic value, {String? varPath}) {
    return NumberxUtils.parseInt(value, varPath: varPath);
  }

  int asInt({String? varPath}) {
    return xasInt(this.value, varPath: varPath);
  }

  static int xasInt(dynamic value, {String? varPath}) {
    return NumberxUtils.guaranteeInt(value, varPath: varPath);
  }

  double? asNullableDouble({String? varPath}) {
    return xasNullableDouble(this.value, varPath: varPath);
  }

  static double? xasNullableDouble(dynamic value, {String? varPath}) {
    return NumberxUtils.parseDouble(value, varPath: varPath);
  }

  double asDouble({String? varPath}) {
    return xasDouble(this.value, varPath: varPath);
  }

  static double xasDouble(dynamic value, {String? varPath}) {
    return NumberxUtils.guaranteeDouble(value, varPath: varPath);
  }

  List<T>? asNullbaleList<T>({String? varPath}) {
    return xasNullbaleList<T>(this.value, varPath: varPath);
  }

  static List<T>? xasNullbaleList<T>(dynamic value, {String? varPath}) {
    return ListxUtils.parse<T>(value, varPath: varPath);
  }

  List<T> asList<T>({String? varPath}) {
    return xasList(this.value, varPath: varPath);
  }

  static List<T> xasList<T>(dynamic value, {String? varPath}) {
    List<T>? _list = ListxUtils.parse<T>(value, varPath: varPath);
    return _list==null ? [] : _list; 
  }

  String? asNullableString({String? varPath}) {
    return xasNullableString(this.value, varPath: varPath);
  }

  static String? xasNullableString(dynamic value, {String? varPath}) {
    return StringxUtils.parse(value, varPath: varPath);
  }

  String asString({String? varPath}) {
    return StringxUtils.guarantee(this.value, varPath: varPath);
  }

  static String xasString(dynamic value, {String? varPath}) {
    return StringxUtils.guarantee(value, varPath: varPath);
  }

}