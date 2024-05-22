import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/constants.dart';
import 'package:hackathon/util.dart';

class AppState extends ChangeNotifier{
  AppState(this._currentAppBrightness, this._currentColorSeed);
  AdaptiveThemeMode _currentAppBrightness;
  AdaptiveThemeMode get currentAppBrightness => _currentAppBrightness;
  ColorSeed _currentColorSeed;
  ColorSeed get currentColorSeed => _currentColorSeed;
  int _homeBottomNavIndex = 0;
  int get homeBottonNavIndex => _homeBottomNavIndex;
  int _portfolioTouchIndex = -1;
  int get portfolioTouchIndex => _portfolioTouchIndex;

  final int _totalPutnamFunds = 468;
  int get totalPutnamFunds => _totalPutnamFunds;


  void updateHomeBottonNavIndex(value){
    _homeBottomNavIndex = value;
    notifyListeners();
  }

  void updatePortfolioTouchIndex(value){
    _portfolioTouchIndex = value;
    notifyListeners();
  }

  void updateAppBrightness(value) {
    _currentAppBrightness = value;
    notifyListeners();
  }

  void updateThemeColor(BuildContext context, ColorSeed colorSeed) {
    _currentColorSeed = colorSeed;
    Util.saveThemeColor(colorSeed.label);
    AdaptiveTheme.of(context).setTheme(
        light: ThemeData(
            colorSchemeSeed: colorSeed.color,
            brightness: Brightness.light,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            useMaterial3: true),
        dark: ThemeData(
            colorSchemeSeed: colorSeed.color,
            brightness: Brightness.dark,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            useMaterial3: true)
            );
    notifyListeners();
  }

}