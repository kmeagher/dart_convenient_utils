
import '../const/Typex.dart';
import 'common-utils.dart';
import 'listx-utils.dart';
import 'numberx-utils.dart';
import 'stringx-utils.dart';

class DynamicxUtils {

  static dynamic parse(dynamic value, {String? varPath, Typex outputType = Typex.nullable, dynamic fallback}) {
    dynamic _value = CommonxUtils.parse(value, path: varPath);
    if (_value==null && outputType==Typex.nullable) return null;
    if (_value==null && outputType!=Typex.nullable) {
      switch(outputType) {
        case Typex.bool: 
          return fallback!=null && fallback is bool ? fallback : false;
        case Typex.double:
          return fallback!=null && fallback is double ? fallback : 0.0;
        case Typex.dynamic:
          return fallback!=null ? fallback : {};
        case Typex.int:
          return fallback!=null && fallback is int ? fallback : 0;
        case Typex.list:
          return fallback!=null && fallback is List ? fallback : [];
        case Typex.map:
          return fallback!=null && fallback is Map ? fallback : {};
        case Typex.string:
          return fallback!=null && fallback is String ? fallback : "";
        default:
          return fallback!=null ? fallback : "";
      }
    }
    switch(outputType) {
      case Typex.bool: 
        return false;
      case Typex.double:
        return NumberxUtils.guaranteeDouble(_value);
      case Typex.int:
        return NumberxUtils.guaranteeInt(_value);
      case Typex.list:
        return ListxUtils.parse(_value);
      case Typex.map:
        return _value is Map ? _value : {"value": _value};
      case Typex.string:
        return StringxUtils.guarantee(_value);
      default:
        return _value;
    }
  }

}