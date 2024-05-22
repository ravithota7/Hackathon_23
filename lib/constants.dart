import 'package:flutter/material.dart';

enum ColorSeed {
  baseColor('M3 Baseline', Color(0xff6750a4)),
  indigo('Indigo', Colors.indigo),
  blue('Blue', Colors.blue),
  teal('Teal', Colors.teal),
  green('Green', Colors.green),
  yellow('Yellow', Colors.yellow),
  orange('Orange', Colors.orange),
  deepOrange('Deep Orange', Colors.deepOrange),
  pink('Pink', Colors.pink);

  const ColorSeed(this.label, this.color);
  final String label;
  final Color color;
}

const List<Map> portfolio = [
  {
    'fundName' : "Fund 1",
    'units' : 20,
    'nav': 34,
    'totalValue': 680
  },
  {
    'fundName' : "Fund 2",
    'units' : 10,
    'nav': 50,
    'totalValue': 500
  },
  {
    'fundName' : "Fund 3",
    'units' : 20,
    'nav': 10,
    'totalValue': 200
  },
  {
    'fundName' : "Fund 4",
    'units' : 15,
    'nav': 40,
    'totalValue': 600
  },
];

class AppColors {
  static const Color primary = contentColorCyan;
  static const Color menuBackground = Color(0xFF090912);
  static const Color itemsBackground = Color(0xFF1B2339);
  static const Color pageBackground = Color(0xFF282E45);
  static const Color mainTextColor1 = Colors.white;
  static const Color mainTextColor2 = Colors.white70;
  static const Color mainTextColor3 = Colors.white38;
  static const Color mainGridLineColor = Colors.white10;
  static const Color borderColor = Colors.white54;
  static const Color gridLinesColor = Color(0x11FFFFFF);

  static const Color contentColorBlack = Colors.black;
  static const Color contentColorWhite = Colors.white;
  static const Color contentColorBlue = Color(0xFF2196F3);
  static const Color contentColorYellow = Color(0xFFFFC300);
  static const Color contentColorOrange = Color(0xFFFF683B);
  static const Color contentColorGreen = Color(0xFF3BFF49);
  static const Color contentColorPurple = Color(0xFF6E1BFF);
  static const Color contentColorPink = Color(0xFFFF3AF2);
  static const Color contentColorRed = Color(0xFFE80054);
  static const Color contentColorCyan = Color(0xFF50E4FF);
}

enum ScreenSelected {
  portfolio(0),
  explore(1),
  orders(2);

  const ScreenSelected(this.value);
  final int value;
}

const double narrowScreenWidthThreshold = 450;

const double mediumWidthBreakpoint = 1000;
const double largeWidthBreakpoint = 1500;

const double transitionLength = 500;

enum ColorSelectionMethod {
  colorSeed,
  image,
}