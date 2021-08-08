
import 'dart:convert';
import 'commonx-utils.dart';
import '../const/Constantx.dart' as constants;

/// Globally accessible list of exceptions caught and handled by Stringx
final List<dynamic> stringXCaughtExceptions = [];

class StringxUtils {

  /// parses the provided value into a String?, if needed
  /// 
  /// `String? [varPath]` can be used when this value is a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  /// 
  /// `bool [nullable]` default `true`
  /// 
  /// - passing `false` converts a null incoming value into an empty String `""`
  /// 
  /// `String? [fallback]` default `null`
  /// 
  /// - when [nullable] is `true` and the value is null, [fallback] will be returned
  /// - when [nullable] is `false` and the value is null, will return [fallback] or an empty String `""`
  static String? parse(dynamic value, {String? varPath, bool nullable = true, String? fallback}) {
    dynamic _value = CommonxUtils.parse(value, path: varPath);
    if (_value==null && nullable) return fallback;
    if (_value==null && !nullable) {
      return fallback==null ? "" : fallback; 
    }
    if (!(_value is String)) {
      _value = jsonEncode(_value);
    }
    return _value;
  }

  /// guarantees that the returned value will not be null. 
  /// 
  /// a null value will be converted into an empty String `""`
  ///  
  /// `dynamic [value]`
  /// 
  /// - the value to be parsed and replace the current value
  ///
  /// `String? [varPath]` can be used when providing a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  /// 
  /// `String? [fallback]` default `null`
  /// 
  /// - when [nullable] is `true` and the value is null, [fallback] will be returned
  /// - when [nullable] is `false` and the value is null, will return [fallback] or an empty String `""`
  static String guarantee(dynamic value, {String? varPath, String fallback = ""}) {
    String? _value = parse(value, varPath: varPath, fallback: fallback, nullable: false);
    if (_value==null) {
      return fallback;
    }
    return _value;
  }

  /// determines if the provided value is equal to the provided `compareValue`
  /// 
  /// `bool [ignoreCase]` default `false`
  /// 
  /// - when `true` will ignore casing during the comparison
  /// 
  /// `bool [trim]` default `true`
  /// 
  /// - when `true` trims whitespace using `str.trim()`
  static bool equals(String? value, String? compareValue, {bool ignoreCase = false, bool trim = true}) {
    if ((value==null && compareValue!=null) || (value!=null && compareValue==null)) return false;
    if (value==null && compareValue==null) return true;
    String _compare = guarantee(compareValue);
    String _value = guarantee(value);
    if (ignoreCase && trim) {
      return _value.trim().toLowerCase()==_compare.trim().toLowerCase();
    } else if (ignoreCase) {
      return _value.toLowerCase()==_compare.toLowerCase();
    } else if (trim) {
      return _value.trim()==_compare.trim();
    }
    return _value==_compare;
  }

  /// determines if the provided value is NOT equal to the provided `compareValue`
  /// 
  /// `bool [ignoreCase]` default `false`
  /// 
  /// - when `true` will ignore casing during the comparison
  /// 
  /// `bool [trim]` default `true`
  /// 
  /// - when `true` trims whitespace using `str.trim()`
  static bool notEquals(String? value, String? compareValue, {bool ignoreCase = false, bool trim = true}) {
    return !equals(value, compareValue, ignoreCase: ignoreCase, trim: trim);
  }

  /// determines if the provided value is `null` or an empty String `""`
  /// 
  /// `dynamic [value]`
  /// 
  /// - the value to be parsed and replace the current value
  ///
  /// `String? [varPath]` can be used when this value a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  static bool isEmpty(dynamic value, {String? varPath}) {
    String? _value = parse(value, varPath: varPath);
    return _value==null || _value.trim()=="";
  }

  /// determines if the provided value is NOT a `null` value and is NOT an empty String `""`
  /// 
  /// `dynamic [value]`
  /// 
  /// - the value to be parsed and replace the current value
  ///
  /// `String? [varPath]` can be used when this value a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  static bool notEmpty(dynamic value, {String? varPath}) {
    return !isEmpty(value, varPath: varPath);
  }

  /// determines if the provided value is a String
  /// 
  /// `dynamic [value]`
  /// 
  /// - the value to be parsed and replace the current value
  ///
  /// `String? [varPath]` can be used when this value a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  static bool isString(dynamic value, {String? varPath}) {
    dynamic _value = CommonxUtils.parse(value, path: varPath);
    return _value is String;
  }

  /// generates a random String value
  /// 
  /// `int [length]` default `18`
  /// 
  /// - optionally provide the desired length of the generated String value
  /// 
  /// `String [chars]` default `AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890`
  /// 
  /// - optionally provide the possible characters for the generated String
  static String random({int length = constants.DEFAULT_RANDOM_STRING_LENGTH, String chars = constants.alphaNumericChars}) {
    return CommonxUtils.randomString(length: length, chars: chars);
  }

}