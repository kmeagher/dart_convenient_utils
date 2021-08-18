
import 'dart:math';

final Random rnd = Random();

const alphaNumericChars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
const alphaNumericCharsWithSpecial = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890#!@+_)(*&^%\$<>.,:;\'"|\\/[]';
const int DEFAULT_RANDOM_STRING_LENGTH = 18;

const int DEFAULT_RANDOM_NUMBER_LENGTH = 10;
const int MIN_INT = 0;
const int MAX_INT = 10;
const double MIN_DOUBLE = 0;
const double MAX_DOUBLE = 10.0;
const int MAX_RANDOM_LOOP = 1000;

const List FALLBACK_LIST = [];