
import 'common-utils.dart';

class BoolxUtils {

  static bool parse(dynamic value, {String? varPath, bool fallback = false}) {
    dynamic _value = CommonxUtils.parse(value, path: varPath);
    if (_value==null) return fallback;
    if (_value is bool) return _value;
    if (_value is String) return _value.trim().toLowerCase()=="y" || _value.trim().toLowerCase()=="yes" || _value.trim().toLowerCase()=="true" || _value.trim().toLowerCase()=="1";
    if (_value is List) return _value.length>0;
    if (_value is int) return _value==1;
    if (_value is double) return _value==1.0;
    return fallback;
  }

}