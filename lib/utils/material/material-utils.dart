
import 'package:flutter/material.dart';

import '../logx-utils.dart';

class MaterialUtils {

  static bool isMaterialColor(dynamic color) {
    return (color!=null && color is MaterialColor);
  }

  static LogxColorDef toLogxColor(dynamic color) {
   LogxColor xColor = LogxColor.none;
    if (isMaterialColor(color)) {
      if (color==Colors.black) {
        xColor = LogxColor.black;
      } else if (color==Colors.red) {
        xColor = LogxColor.red;
      } else if (color==Colors.green) {
        xColor = LogxColor.green;
      } else if (color==Colors.yellow) {
        xColor = LogxColor.yellow;
      } else if (color==Colors.blue) {
        xColor = LogxColor.blue;
      } else if (color==Colors.purple) {
        xColor = LogxColor.magenta;
      } else if (color==Colors.cyan) {
        xColor = LogxColor.cyan;
      } else if (color==Colors.white) {
        xColor = LogxColor.white;
      } else if (color==Colors.grey) {
        xColor = LogxColor.gray;
      } else if (color==Colors.redAccent) {
        xColor = LogxColor.brightRed;
      } else if (color==Colors.greenAccent) {
        xColor = LogxColor.brightGreen;
      } else if (color==Colors.blueAccent) {
        xColor = LogxColor.brightBlue;
      } else if (color==Colors.purpleAccent) {
        xColor = LogxColor.brightMagenta;
      } else if (color==Colors.cyanAccent) {
        xColor = LogxColor.brightCyan;
      }
    }
    return LogxColorMap[xColor]!;
  }

}