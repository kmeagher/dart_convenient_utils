
import '../utils/stringx-utils.dart';
import '../utils/listx-utils.dart';

class Objectx<T> {

  T? value;

  Objectx(T value) {
    this.value = value;
  }

  String? toNullableString({String? varPath}) {
    return StringxUtils.parse(this.value, varPath: varPath);
  }

  String toString({String? varPath}) {
    return StringxUtils.guarantee(this.value, varPath: varPath);
  }

  List<T>? toNullbaleList<T>({String? varPath}) {
    return ListxUtils.parse<T>(this.value, varPath: varPath);
  }

  List<T> toList<T>({String? varPath}) {
    List<T>? _list = ListxUtils.parse<T>(this.value, varPath: varPath);
    return _list==null ? [] : _list; 
  }

}