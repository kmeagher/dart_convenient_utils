
import '../utils/listx-utils.dart';
import '../const/Constantx.dart' as constants;

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

  List<int> randomInts({int min = constants.MIN_INT, int max = constants.MAX_INT, bool duplicates = false, int length = constants.DEFAULT_RANDOM_NUMBER_LENGTH, String direction = "none"}) {
    return xrandomInts(min: min, max: max, duplicates: duplicates, length: length, direction: direction);
  }

  static List<int> xrandomInts({int min = constants.MIN_INT, int max = constants.MAX_INT, bool duplicates = false, int length = constants.DEFAULT_RANDOM_NUMBER_LENGTH, String direction = "none"}) {
    return ListxUtils.randomInts(min: min, max: max, duplicates: duplicates, length: length, direction: direction);
  }

  List<double> randomDoubles({double min = constants.MIN_DOUBLE, double max = constants.MAX_DOUBLE, bool duplicates = false, int length = constants.DEFAULT_RANDOM_NUMBER_LENGTH, String direction = "none"}) {
    return xrandomDoubles(min: min, max: max, duplicates: duplicates, length: length, direction: direction);
  }

  static List<double> xrandomDoubles({double min = constants.MIN_DOUBLE, double max = constants.MAX_DOUBLE, bool duplicates = false, int length = constants.DEFAULT_RANDOM_NUMBER_LENGTH, String direction = "none"}) {
    return ListxUtils.randomDoubles(min: min, max: max, duplicates: duplicates, length: length, direction: direction);
  }

  T? first<T>({String? varPath, T? fallback}) {
    return xfirst<T>(this.value, varPath: varPath, fallback: fallback);
  }

  static T? xfirst<T>(dynamic value, {String? varPath, T? fallback}) {
    return ListxUtils.first<T>(value, varPath: varPath, fallback: fallback);
  }

  T? last<T>({String? varPath, T? fallback}) {
    return xlast(this.value, varPath: varPath, fallback: fallback);
  }

  static T? xlast<T>(dynamic value, {String? varPath, T? fallback}) {
    return ListxUtils.last<T>(value, varPath: varPath, fallback: fallback);
  }

  T? atIndex<T>(dynamic value, int index, {String? varPath, T? fallback}) {
    return xatIndex<T>(this.value, index, varPath: varPath, fallback: fallback);
  }

  static T? xatIndex<T>(dynamic value, int index, {String? varPath, T? fallback}) {
    return ListxUtils.atIndex<T>(value, index, varPath: varPath, fallback: fallback);
  }

  bool isEmpty(dynamic value, {String? varPath}) {
    return xisEmpty(this.value, varPath: varPath);
  }

  static bool xisEmpty(dynamic value, {String? varPath}) {
    return ListxUtils.isEmpty(value, varPath: varPath);
  }

  int length({String? varPath}) {
    return xlength(this.value, varPath: varPath);
  }

  static int xlength(dynamic value, {String? varPath}) {
    return ListxUtils.length(value, varPath: varPath);
  }

}