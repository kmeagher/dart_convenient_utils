
import '../const/Constantx.dart' as constants;

class CommonxUtils {

  /// parses an incoming value, determining if a path variable should be retrieved from the value
  /// 
  /// if the [path] is null, then the value is returned
  /// 
  /// if the [value] is NOT type Map, then the [value] is returned
  /// 
  /// `dynamic [value]` 
  /// 
  /// the value to be parsed. 
  /// 
  /// `String? [path]`
  /// 
  /// if the [value] is a Map, then the path is used to pull a property nested within the map
  /// 
  /// - The following would be expected to return the value of the nexted `id` property: `dynamic result = CommonxUtils.parse(source, "session.user.id");`
  static dynamic parse(dynamic value, {String? path}) {
    if (value==null) return null;
    if (value is Map && path!=null) {
      return varPath(value, path);
    }
    return value;
  }

  /// retrieves the value at the provided path
  /// 
  /// - This example returns the value for the nested `id` property: `dynamic pathValue = CommonxUtils.varPath(source, "session.user.id");`
  /// 
  static dynamic varPath(Map? value, String path) {
    if (value==null) return null;
    dynamic pathValue = value;
    List<String> paths = path.split(".");
    for(int i = 0; i < paths.length; i++) {
      pathValue = pathValue[paths[i]];
    }
    return pathValue;
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
  static String randomString({int length = constants.DEFAULT_RANDOM_STRING_LENGTH, String chars = constants.alphaNumericChars}) => String.fromCharCodes(
    Iterable.generate(
      length, (_) => chars.codeUnitAt(constants.rnd.nextInt(chars.length))
    )
  );

  /// generates a random String value
  /// 
  /// includes aplha, numeric and special characters `#!@+_)(*&^%$<>.,:;'"|\/[]`
  /// 
  /// `int [length]` default `18`
  /// 
  /// - optionally provide the desired length of the generated String value
  static String randomStringWithSpecials({int length = constants.DEFAULT_RANDOM_STRING_LENGTH}) => String.fromCharCodes(
    Iterable.generate(
      length, (_) => constants.alphaNumericCharsWithSpecial.codeUnitAt(constants.rnd.nextInt(constants.alphaNumericCharsWithSpecial.length))
    )
  );

/// generates a positive random integer uniformly distributed on the range from [min], inclusive, to [max], exclusive.
static int randomInt({int min = constants.MIN_INT, int max = constants.MAX_INT}) => min + constants.rnd.nextInt(max - min);

/// Generates a positive random double uniformly distributed on the range from [min], inclusive, to [max], exclusive.
static double randomDouble({double min = constants.MIN_DOUBLE, double max = constants.MAX_DOUBLE}) => (constants.rnd.nextDouble() * (min - max) + max);

}