
import '../utils/stringx-utils.dart';
import '../const/Constantx.dart' as constants;

/// A utility and wrapper class intended to add convenience to coding around Strings
class Stringx {

  /// the raw value
  String? value;

  /// creates a new instance of `Stringx` setting the value based on the [value] passed in
  /// 
  /// `dynamic [value]`
  /// 
  /// - the value to be parsed and assigned as the current value
  /// 
  /// `String? [varPath]` default `null`
  /// 
  /// - can be used when providing a `newValue` that is a `Map<String, ?>` as the incoming value. 
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
  Stringx(dynamic value, {String? varPath, bool nullable = true, String? fallback}) {
    this.value = xparse(value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  /// updates this value and will parse the `newValue` into a String?, if needed
  /// 
  /// `dynamic [newValue]`
  /// 
  /// - the value to be parsed and replace the current value
  /// 
  /// `String? [varPath]` default `null`
  /// 
  /// - can be used when providing a `newValue` that is a `Map<String, ?>` as the incoming value. 
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
  void setValue(dynamic newValue, {String? varPath, bool nullable = true, String? fallback}) {
    this.value = xparse(value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  /// parses this value into a String?, if needed
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
  String? parse({String? varPath, bool nullable = true, String? fallback}) {
    return StringxUtils.parse(value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  /// parses a value into a String?, if needed
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
  /// `bool [nullable]` default `true`
  /// 
  /// - passing `false` converts a null incoming value into an empty String `""`
  /// 
  /// `String? [fallback]` default `null`
  /// 
  /// - when [nullable] is `true` and the value is null, [fallback] will be returned
  /// - when [nullable] is `false` and the value is null, will return [fallback] or an empty String `""`
  static String? xparse(dynamic value, {String? varPath, bool nullable = true, String? fallback}) {
    return StringxUtils.parse(value, varPath: varPath, nullable: nullable, fallback: fallback);
  }

  /// guarantees that the returned value will not be null. 
  /// 
  /// a null value will be converted into an empty String `""`
  /// 
  /// `String? [varPath]` can be used when this value is a `Map<String, ?>` as the incoming value. 
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
  String guarantee({String? varPath, String fallback = ""}) {
    return StringxUtils.guarantee(this.value, varPath: varPath, fallback: fallback);
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
  static String xguarantee(dynamic value, {String? varPath, String fallback = ""}) {
    return StringxUtils.guarantee(value, varPath: varPath, fallback: fallback);
  }

  /// determines if this value is `null` or an empty String `""`
  /// 
  /// `String? [varPath]` can be used when this value a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  bool isEmpty({String? varPath}) {
    return StringxUtils.isEmpty(this.value, varPath: varPath);
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
  static bool xisEmpty(dynamic value, {String? varPath}) {
    return StringxUtils.isEmpty(value, varPath: varPath);
  }

  /// determines if this value is NOT a `null` value and is NOT an empty String `""`
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
  bool notEmpty({String? varPath}) {
    return StringxUtils.notEmpty(this.value, varPath: varPath);
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
  static bool xnotEmpty(dynamic value, {String? varPath}) {
    return StringxUtils.notEmpty(value, varPath: varPath);
  }
  
  /// determines if this value is equal to the provided `compareValue`
  /// 
  /// `bool [ignoreCase]` default `false`
  /// 
  /// - when `true` will ignore casing during the comparison
  /// 
  /// `bool [trim]` default `true`
  /// 
  /// - when `true` trims whitespace using `str.trim()`
  bool equals(String? compareValue, {bool ignoreCase = false, bool trim = true}) {
    return StringxUtils.equals(this.value, compareValue, ignoreCase: ignoreCase, trim: trim);
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
  static bool xequals(String? value, String? compareValue, {bool ignoreCase = false, bool trim = true}) {
    return StringxUtils.equals(value, compareValue, ignoreCase: ignoreCase, trim: trim);
  }

  /// determines if this value is NOT equal to the provided `compareValue`
  /// 
  /// `bool [ignoreCase]` default `false`
  /// 
  /// - when `true` will ignore casing during the comparison
  /// 
  /// `bool [trim]` default `true`
  /// 
  /// - when `true` trims whitespace using `str.trim()`
  bool notEquals(String? compareValue, {bool ignoreCase = false, bool trim = true}) {
    return StringxUtils.notEquals(this.value, compareValue, ignoreCase: ignoreCase, trim: trim);
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
  static bool xnotEquals(String? value, String? compareValue, {bool ignoreCase = false, bool trim = true}) {
    return StringxUtils.notEquals(value, compareValue, ignoreCase: ignoreCase, trim: trim);
  }

  /// determines if this value is a String
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
  bool isString({String? varPath}) {
    return StringxUtils.isString(this.value, varPath: varPath);
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
  static bool xisString(dynamic value, {String? varPath}) {
    return StringxUtils.isString(value, varPath: varPath);
  }

  /// generates a random String value
  /// 
  /// `int [length]` default `18`
  /// 
  /// - optionally provide the desired length of the generated String value
  String random({int length = constants.DEFAULT_RANDOM_STRING_LENGTH, String chars = constants.alphaNumericChars}) {
    return StringxUtils.random(length: length, chars: chars);
  }

  /// generates a random String value
  /// 
  /// `int [length]` default `18`
  /// 
  /// - optionally provide the desired length of the generated String value
  static String xrandom({int length = constants.DEFAULT_RANDOM_STRING_LENGTH, String chars = constants.alphaNumericChars}) {
    return StringxUtils.random(length: length, chars: chars);
  }

}