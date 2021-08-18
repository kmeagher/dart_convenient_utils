
import 'package:convenient_utils/utils/commonx-utils.dart';
import 'package:convenient_utils/utils/logx-utils.dart';

import '../const/Constantx.dart' as constants;

/// Globally accessible list of exceptions caught and handled by Listx
List<dynamic> listxCaughtExceptions = [];

class ListxUtils {

  /// parses the provided value into a List?, if needed
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
  /// - passing `false` converts a null incoming value into an empty List `[]`
  /// 
  /// `List? [fallback]` default `null`
  /// 
  /// - when [nullable] is `true` and the value is null, [fallback] will be returned
  /// - when [nullable] is `false` and the value is null, will return [fallback] or an empty List `[]`
  static List<T>? parse<T>(dynamic value, {String? varPath, bool nullable = true, List<T>? fallback}) {
    dynamic _value = CommonxUtils.parse(value, path: varPath);
    if (_value==null && nullable) return fallback;
    if (_value==null && !nullable) {
      return fallback==null ? [] : fallback;
    }
    if (!(_value is List)) {
      _value = [_value];
    }
    return value as List<T>;
  }

  /// guarantees to return a non-null List
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
  /// - passing `false` converts a null incoming value into an empty List `[]`
  /// 
  /// `List [fallback]` default `null`
  /// 
  /// - when the value is null, [fallback] will be returned
  static List<T> guarantee<T>(dynamic value, {String? varPath, List<T>? fallback}) {
    try {
      List<T>? parsed = parse(value, varPath: varPath, nullable: false, fallback: fallback);
      if (parsed==null) return [];
      return parsed;
    } catch (e) {
      listxCaughtExceptions.add(e);
      return [];
    }
  }

  /// determines if the provided value is a List
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
  static bool isList(dynamic value, {String? varPath}) {
    dynamic _value = CommonxUtils.parse(value, path: varPath);
    return _value is List;
  }

  /// generates a List of positive random integers uniformly distributed on the range from [min], inclusive, to [max], exclusive.
  /// 
  /// `bool [duplicates]` default `false`
  /// 
  /// - when `true` will allow duplicate numbers in the list
  /// - when `false` will ensure that each number in the list is unique
  static List<int> randomInts({int min = constants.MIN_INT, int max = constants.MAX_INT, bool duplicates = false, int length = constants.DEFAULT_RANDOM_NUMBER_LENGTH, String direction = "none"}) {
    List<int> numbers = [];
    if (((max - min) < 0) || (!duplicates && ((max - min) < length))) {
      max = min + length;
    }
    while(numbers.length<length) {
      int nextNum = CommonxUtils.randomInt(min: min, max: max);
      if (duplicates || (!duplicates && numbers.indexOf(nextNum) == -1)) {
        numbers.add(nextNum);
      }
    }
    if (direction=="asc" || direction=="up" || direction=="ascending") {
      numbers.sort((int a, int b) => a.compareTo(b));
    } else if (direction=="desc" || direction=="down" || direction=="descending") {
      numbers.sort((int a, int b) => b.compareTo(a));
    } 
    return numbers;
  }

  /// generates a List of positive random integers uniformly distributed on the range from [min], inclusive, to [max], exclusive.
  /// 
  /// `int [length]` default 10
  /// 
  /// - determines how many numbers will be in the returned list
  /// 
  /// `bool [duplicates]` default `false`
  /// 
  /// - when `true` will allow duplicate numbers in the list
  /// - when `false` will ensure that each number in the list is unique
  static List<double> randomDoubles({double min = constants.MIN_DOUBLE, double max = constants.MAX_DOUBLE, bool duplicates = false, int length = constants.DEFAULT_RANDOM_NUMBER_LENGTH, String direction = "none"}) {
    List<double> numbers = [];
    int lastLength = numbers.length;
    int ticker = 0;
    while(numbers.length<length) {
      double nextNum = CommonxUtils.randomDouble(min: min, max: max);
      if (duplicates || (!duplicates && numbers.indexOf(nextNum) == -1)) {
        numbers.add(nextNum);
      }
      if (numbers.length==lastLength) {
        ticker++;
      }
      lastLength = numbers.length;
      if (ticker>=constants.MAX_RANDOM_LOOP) {
        LogxUtils.error("Listx could not produce $length numbers between $min and $max. We stopped at ${numbers.length} numbers.");
        break;
      }
    }
    if (direction=="asc" || direction=="up" || direction=="ascending") {
      numbers.sort((double a, double b) => a.compareTo(b));
    } else if (direction=="desc" || direction=="down" || direction=="descending") {
      numbers.sort((double a, double b) => b.compareTo(a));
    }
    return numbers;
  }

  /// retrieves the object at index 0
  /// 
  /// if the list is null or empty, will return the [fallback]
  /// 
  /// `String? [varPath]` can be used when this value is a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  static T? first<T>(dynamic value, {String? varPath, T? fallback}) {
    List? _list = parse(value, varPath: varPath, nullable: false, fallback: []);
    if (_list==null || _list.isEmpty) {
      return fallback;
    }
    return _list[0] as T;
  }

  /// retrieves last object in the list
  /// 
  /// if the list is null or empty, will return the [fallback]
  /// 
  /// `String? [varPath]` can be used when this value is a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  static T? last<T>(dynamic value, {String? varPath, T? fallback}) {
    List? _list = parse(value, varPath: varPath, nullable: false, fallback: []);
    if (_list==null || _list.isEmpty) {
      return fallback;
    }
    return _list[_list.length-1] as T;
  }

  /// retrieves the object from the list at the provided [index]
  /// 
  /// if the list is null or empty, will return the [fallback]
  /// 
  /// `String? [varPath]` can be used when this value is a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  static T? atIndex<T>(dynamic value, int index, {String? varPath, T? fallback}) {
    if (index<0) return fallback;
    List? _list = parse(value, varPath: varPath, nullable: false, fallback: []);
    if (_list==null || _list.isEmpty || (_list.length-1)<index) {
      return fallback;
    }
    return _list[index];
  }

  /// determines if the list is null or empty
  /// 
  /// `String? [varPath]` can be used when this value is a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  static bool isEmpty(dynamic value, {String? varPath}) {
    List? _list = parse(value, varPath: varPath);
    return _list==null || _list.isEmpty;
  }

  /// gets the length of the List
  /// 
  /// `String? [varPath]` can be used when this value is a `Map<String, ?>` as the incoming value. 
  /// 
  /// For Example:
  /// - `var desiredValue = source["user"]["id"];` 
  /// - could be changed to: 
  /// - `String desiredValue = Stringx.xguarantee(source, varPath: "user.id");` 
  /// - which would guarantee that the `desiredValue` is a non-null String value.
  static int length(dynamic value, {String? varPath}) {
    List? _list = parse(value, varPath: varPath);
    return _list==null ? 0 : _list.length;
  }

}