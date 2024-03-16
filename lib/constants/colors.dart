
import 'package:flutter/material.dart';

class MColors {
  static HexColor background = HexColor("#16181d");
  static HexColor foreground = HexColor("#2b2f37");
  static HexColor success = HexColor("#51c56c");
  static HexColor muted = HexColor("#6b6d73");
}

class HexColor extends Color {
  static int _getColorFromHex(String hex) {
    assert(RegExp(r'^#([0-9a-fA-F]{6})|([0-9a-fA-F]{8})$').hasMatch(hex));
    return int.parse(hex.substring(1), radix: 16) +
        (hex.length == 7 ? 0xFF000000 : 0x00000000);
  }

  HexColor(final String hex) : super(_getColorFromHex(hex));
}
