
import 'commonx-utils.dart';
import 'material/material-utils.dart';
import 'stringx-utils.dart';

enum LogxType {
  log, warn, error
}

enum LogxColor {
  none, black, red, green, yellow, blue, magenta, cyan, white, 
  gray, brightRed, brightGreen, brightYellow, brightBlue,
  brightMagenta, brightCyan, brightWhite
}

class LogxColorDef {
  LogxColor color = LogxColor.none;
  int fg = -1;
  int bg = -1;
  LogxColorDef({
    this.color = LogxColor.none,
    this.fg = -1,
    this.bg = -1
  });
  Map<String, dynamic> toJson() {
    return {
      "color": color.toString(),
      "fg": fg,
      "bg": bg
    };
  }
}

// ignore: non_constant_identifier_names
final Map<LogxColor, LogxColorDef> LogxColorMap = {
  LogxColor.none: LogxColorDef(),
  LogxColor.black: LogxColorDef(color: LogxColor.black, fg: 30, bg: 40),
  LogxColor.red: LogxColorDef(color: LogxColor.red, fg: 31, bg: 41),
  LogxColor.green: LogxColorDef(color: LogxColor.green, fg: 32, bg: 42),
  LogxColor.yellow: LogxColorDef(color: LogxColor.yellow, fg: 33, bg: 43),
  LogxColor.blue: LogxColorDef(color: LogxColor.blue, fg: 34, bg: 44),
  LogxColor.magenta: LogxColorDef(color: LogxColor.magenta, fg: 35, bg: 45),
  LogxColor.cyan: LogxColorDef(color: LogxColor.cyan, fg: 36, bg: 46),
  LogxColor.white: LogxColorDef(color: LogxColor.white, fg: 37, bg: 47),
  LogxColor.gray: LogxColorDef(color: LogxColor.gray, fg: 90, bg: 100),
  LogxColor.brightRed: LogxColorDef(color: LogxColor.brightRed, fg: 91, bg: 101),
  LogxColor.brightGreen: LogxColorDef(color: LogxColor.brightGreen, fg: 92, bg: 102),
  LogxColor.brightYellow: LogxColorDef(color: LogxColor.brightYellow, fg: 93, bg: 103),
  LogxColor.brightBlue: LogxColorDef(color: LogxColor.brightBlue, fg: 94, bg: 104),
  LogxColor.brightMagenta: LogxColorDef(color: LogxColor.brightMagenta, fg: 95, bg: 105),
  LogxColor.brightCyan: LogxColorDef(color: LogxColor.brightCyan, fg: 96, bg: 106),
  LogxColor.brightWhite: LogxColorDef(color: LogxColor.brightWhite, fg: 97, bg: 107),
};

class LogxUtils {

  static List<LogxColorDef> allColors() {
    List<LogxColorDef> list = [
      LogxColorMap[LogxColor.none]!,
      LogxColorMap[LogxColor.black]!,
      LogxColorMap[LogxColor.red]!,
      LogxColorMap[LogxColor.green]!,
      LogxColorMap[LogxColor.yellow]!,
      LogxColorMap[LogxColor.blue]!,
      LogxColorMap[LogxColor.magenta]!,
      LogxColorMap[LogxColor.cyan]!,
      LogxColorMap[LogxColor.white]!,
      LogxColorMap[LogxColor.gray]!,
      LogxColorMap[LogxColor.brightRed]!,
      LogxColorMap[LogxColor.brightGreen]!,
      LogxColorMap[LogxColor.brightYellow]!,
      LogxColorMap[LogxColor.brightBlue]!,
      LogxColorMap[LogxColor.brightMagenta]!,
      LogxColorMap[LogxColor.brightCyan]!,
      LogxColorMap[LogxColor.brightWhite]!,
    ];
    return list;
  }

  static LogxColorDef randomColor() {
    List<LogxColorDef> colors = allColors();
    int random = CommonxUtils.randomInt(min: 0, max: (colors.length+1));
    return colors[random];
  }

  static void printColor(dynamic value, {String? title, bool inlineTitle = false, dynamic foregroundColor = LogxColor.none, dynamic backgroundColor = LogxColor.none, String spacer = "="}) {
    String _value = (value is String) ?  value : StringxUtils.guarantee(value);
    final esc = "\x1B[";
    final clear = "${esc}0m";
    final sb = new StringBuffer();
    LogxColorDef fgColor = LogxColorMap[LogxColor.none]!;
    if (MaterialUtils.isMaterialColor(foregroundColor)) {
      fgColor = MaterialUtils.toLogxColor(foregroundColor);
    } else if (foregroundColor is LogxColor) {
      fgColor = LogxColorMap[foregroundColor]!;
    }
    LogxColorDef bgColor = LogxColorMap[LogxColor.none]!;
    if (MaterialUtils.isMaterialColor(backgroundColor)) {
      bgColor = MaterialUtils.toLogxColor(backgroundColor);
    } else if (backgroundColor is LogxColor) {
      bgColor = LogxColorMap[backgroundColor]!;
    }
    bool doClose = (fgColor.color!=LogxColor.none) || (fgColor.color!=LogxColor.none);
    if (fgColor.color!=LogxColor.none) {
      // int fg = LogxColorMap[fgColor]!.fg; 
      // sb.write("$esc${fg}m");
      sb.write("$esc${fgColor.fg}m");
    }
    if (bgColor.color!=LogxColor.none) {
      // int bg = LogxColorMap[backgroundColor]!.bg; 
      // sb.write("$esc${bg}m");
      sb.write("$esc${bgColor.bg}m");
    }
    if (title!=null) {
      if (inlineTitle) {
        sb.write("$title $spacer ");  
      } else {
        String _spacer = spacer;
        for(int i = 0; i < 25; i++) _spacer += spacer;
        sb.write("$_spacer$title$_spacer\n");
      }
    }
    sb.write(_value);
    if (doClose) {
      sb.write(clear);
    }
    // if (!inlineTitle) printTitle(title, spacer, LogxType.log);
    print(sb.toString());
  }

  static void log(dynamic value, {String? title, bool inlineTitle = false, String spacer = "="}) {
    printColor(value, title: title, inlineTitle: inlineTitle, spacer: spacer);
  }

  static void warn(dynamic value, {String? title, bool inlineTitle = false, String spacer = "="}) {
    printColor(value, title: title, inlineTitle: inlineTitle, spacer: spacer, foregroundColor: LogxColor.yellow);
  }

  static void error(dynamic value, {String? title, bool inlineTitle = false, String spacer = "="}) {
    printColor(value, title: title, inlineTitle: inlineTitle, spacer: spacer, foregroundColor: LogxColor.brightRed);
  }

}