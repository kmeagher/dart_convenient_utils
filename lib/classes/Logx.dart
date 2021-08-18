
import 'package:convenient_utils/utils/logx-utils.dart';

export 'package:convenient_utils/utils/logx-utils.dart' show LogxType, LogxColor, LogxColorDef;

class Logx {

  static log(dynamic value, {String? title, bool inlineTitle = false, String spacer = "="}) {
    LogxUtils.log(value, title: title, inlineTitle: inlineTitle, spacer: spacer);
  }

  static warn(dynamic value, {String? title, bool inlineTitle = false, String spacer = "="}) {
    LogxUtils.warn(value, title: title, inlineTitle: inlineTitle, spacer: spacer);
  }

  static error(dynamic value, {String? title, bool inlineTitle = false, String spacer = "="}) {
    LogxUtils.error(value, title: title, inlineTitle: inlineTitle, spacer: spacer);
  }

  static void printColor(dynamic value, {String? title, bool inlineTitle = false, dynamic foregroundColor = LogxColor.none, dynamic backgroundColor = LogxColor.none, String spacer = "="}) {
    LogxUtils.printColor(value, title: title, inlineTitle: inlineTitle, foregroundColor: foregroundColor, backgroundColor: backgroundColor, spacer: spacer);
  }

  static List<LogxColorDef> allColors() => LogxUtils.allColors();

  static LogxColorDef randomColor() {
    return LogxUtils.randomColor();
  }

}