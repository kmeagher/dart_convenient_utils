
import 'package:convenient_utils/classes/Listx.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Basic Usage", basicUsage);
  test("Guarantee List", guaranteeList);
  test("Check is LIST", checkIsList);
  test("Check is not LIST", checkIsNotList);
  test("Get List of Random Integers", getListOfRandomIntegers);
  test("Get List of Random Integers Between", getListOfRandomIntegersBetween);
  test("Get Sorted List of Random Integers (ASC)", getSortedAscendingListOfRandomIntegers);
  test("Get Sorted List of Random Integers (DESC)", getSortedDescendingListOfRandomIntegers);
  test("Get List of Random Doubles", getListOfRandomDoubles);
  test("Get List of Random Doubles Between", getListOfRandomDoublesBetween);
  test("Get Sorted List of Random Doubles (ASC)", getSortedAscendingListOfRandomDoubles);
  test("Get Sorted List of Random Doubles (DESC)", getSortedDescendingListOfRandomDoubles);
  test("Check if List is empty", checkIsEmpty);
  test("Check NULL List length", checkNullLength);
  test("Get List Length", getLength);
  test("Get First Item", getFirstItem);
  test("Get First Item from Empty List", getFirstItemFromEmptyList);
  test("Get Last Item", getLastItem);
  test("Get Last Item from Empty List", getLastItemFromEmptyList);
  test("Get Item at Index", itemAtIndex);
  test("Get Item at Index from Empty List", itemAtIndexFromEmptyList);
}

void basicUsage() {
  List<String> list = ["1","2","3"];
  List<String>? xList = Listx.xparse<String>(list);
  print("basicUsage => $xList");
  assert(list==xList);
}

void guaranteeList() {
  dynamic list;
  List<String> xList = Listx.xguarantee<String>(list);
  print("guaranteeList => $xList");
}

void checkIsList() {
  dynamic value = [1,2,3,4];
  bool isList = Listx.xisList(value);
  print("checkIsList => $isList");
  assert(isList==true);
}

void checkIsNotList() {
  dynamic value = "Hello, World!";
  bool isList = Listx.xisList(value);
  print("checkIsNotList => $isList");
  assert(isList==false);
}

void getListOfRandomIntegers() {
  List<int> randoms = Listx.xrandomInts();
  print("getListOfRandomIntegers => $randoms");
}

void getListOfRandomIntegersBetween() {
  int min = 1000;
  int max = 1099;
  List<int> randoms = Listx.xrandomInts(min: min, max: max);
  print("getListOfRandomIntegersBetween $min and $max => $randoms");
}

void getSortedAscendingListOfRandomIntegers() {
  List<int> randoms = Listx.xrandomInts(direction: "asc");
  print("getSortedAscendingListOfRandomIntegers => $randoms");
}

void getSortedDescendingListOfRandomIntegers() {
  List<int> randoms = Listx.xrandomInts(direction: "desc");
  print("getSortedDescendingListOfRandomIntegers => $randoms");
}

void getListOfRandomDoubles() {
  List<double> randoms = Listx.xrandomDoubles();
  print("getListOfRandomDoubles => $randoms");
}

void getListOfRandomDoublesBetween() {
  double min = 10.146;
  double max = 11.60;
  List<double> randoms = Listx.xrandomDoubles(min: min, max: max);
  print("getListOfRandomIntegersBetween $min and $max => $randoms");
}

void getSortedAscendingListOfRandomDoubles() {
  List<double> randoms = Listx.xrandomDoubles(direction: "asc");
  print("getSortedAscendingListOfRandomDoubles => $randoms");
}

void getSortedDescendingListOfRandomDoubles() {
  List<double> randoms = Listx.xrandomDoubles(direction: "desc");
  print("getSortedDescendingListOfRandomDoubles => $randoms");
}

void checkIsEmpty() {
  List? list;
  bool empty = Listx.xisEmpty(list);
  print("checkEmpty => $empty");
  assert(empty==true);
}

void checkNullLength() {
  List? list;
  int length = Listx.xlength(list);
  print("checkNullLength => $length");
  assert(length==0);
}

void getLength() {
  List? list = [1,2,3];
  int length = Listx.xlength(list);
  print("getLength => $length");
  assert(length==list.length);
}

void getFirstItem() {
  List list = [1,2,3,4];
  int first = Listx.xfirst(list);
  print("getFirstItem => $first");
  assert(first==1);
}

void getFirstItemFromEmptyList() {
  List list = [];
  dynamic first = Listx.xfirst(list);
  print("getFirstItem => $first");
  assert(first==null);
}

void getLastItem() {
  List list = [1,2,3,4];
  int first = Listx.xlast(list);
  print("getLastItem => $first");
  assert(first==4);
}

void getLastItemFromEmptyList() {
  List list = [];
  dynamic first = Listx.xlast(list);
  print("getLastItemFromEmptyList => $first");
  assert(first==null);
}

void itemAtIndex() {
  List list = [1,2,3];
  int item = Listx.xatIndex(list, 1);
  print("itemAtIndex => $item");
  assert(item==2);
}

void itemAtIndexFromEmptyList() {
  List list = [];
  dynamic item = Listx.xatIndex(list, 2);
  print("itemAtIndexFromEmptyList => $item");
  assert(item==null);
}

