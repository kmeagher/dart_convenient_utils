
import 'package:convenient_utils/classes/Logx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Basic Usage", basicUsage);
  test("Show Warning", showWarning);
  test("Show Error", showError);
  test("Log with Title", logWithTitle);
  test("Log with Title and Spacer", logWithTitleAndSpacer);
  test("Log with Inline Title", logWithInlineTitle);
  test("Show Red on White", showRedOnWhite);
  test("Show Material Colors Red on White", materialColorRedOnWhite);
  test("Unsupported Material Colors", unsupportedMaterialColor);
  test("Print Magenta", printMagenta);
  test("Print with random color", printWithRandomColor);
  test("Color Combinations", colorCombinations);
}

void basicUsage() {
  Logx.log("Hello, World!");
}

void showWarning() {
  Logx.warn("You have been warned");
}

void showError() {
  Logx.error("An error has occurred. Please stay calm.");
}

void logWithTitle() {
  Logx.log("This is the content", title: "This is the title");
}

void logWithTitleAndSpacer() {
  Logx.log("This is the content", title: "This is the title", spacer: " * ");
}

void logWithInlineTitle() {
  Logx.log("This is the content", title: "This is the title", inlineTitle: true, spacer: "===>");
}

void showRedOnWhite() {
  Logx.printColor("Red on White", backgroundColor: LogxColor.white, foregroundColor: LogxColor.red);
}

void materialColorRedOnWhite() {
  Logx.printColor("Red on White", backgroundColor: Colors.white, foregroundColor: Colors.red);
}

void unsupportedMaterialColor() {
  Logx.printColor("This will not be colored because the material colors are not supported by Logx", backgroundColor: Colors.amber, foregroundColor: Colors.brown);
}

void printMagenta() {
  Logx.printColor("Magenta enjoys biscuits with Blue.", foregroundColor: LogxColor.magenta);
}

void printWithRandomColor() {
  LogxColorDef colorDef = Logx.randomColor();
  Logx.printColor(colorDef.toJson(), foregroundColor: colorDef.color);
}

void colorCombinations() {
  List<LogxColorDef> colors = Logx.allColors();
  colors.forEach((LogxColorDef color) {
    colors.forEach((LogxColorDef bgColor) {
      Logx.printColor({
        "foreground": color.toJson(),
        "background": bgColor.toJson()
      }, foregroundColor: color.color, backgroundColor: bgColor.color);
    });
  });
}