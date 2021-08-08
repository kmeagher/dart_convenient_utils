
import '../utils/listx-utils.dart';

class Listx<T> {

  List<T>? value;

  Listx(dynamic value, {String? varPath, bool nullable = true, List<T>? fallback}) {
    this.value = xparse<T>(value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  List<T>? parse<T>({String? varPath, bool nullable = true, List<T>? fallback}) {
    return ListxUtils.parse<T>(this.value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  static List<T>? xparse<T>(dynamic value, {String? varPath, bool nullable = true, List<T>? fallback}) {
    return ListxUtils.parse<T>(value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  List<T> guarantee<T>({String? varPath}) {
    return ListxUtils.guarantee<T>(this.value, varPath: varPath);
  }

  static List<T> xguarantee<T>(dynamic value, {String? varPath}) {
    return ListxUtils.guarantee<T>(value, varPath: varPath);
  }

  bool isList({String? varPath}) {
    return ListxUtils.isList(this.value, varPath: varPath);
  }

  static bool xisList(dynamic value, {String? varPath}) {
    return ListxUtils.isList(value, varPath: varPath);
  }

}