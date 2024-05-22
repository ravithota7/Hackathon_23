import 'package:hackathon/constants.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Util{
  static final oCcy = NumberFormat("#,##0.00", "en_US");

  static Future<String> getSavedThemeColor() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('themeColor') ?? ColorSeed.baseColor.label;
  }

  static Future<void> saveThemeColor(String color) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setString('themeColor', color);
  }

  static String getDateFromEpoch(epochTime){
    return DateFormat.yMMMMd('en_US').format(DateTime.fromMillisecondsSinceEpoch(epochTime));
  }

  static String convertToDollarValue(num){
    if (num > 999 && num < 99999) {
        return "\$ ${(num / 1000).toStringAsFixed(1)} K";
      } else if (num > 99999 && num < 999999) {
        return "\$ ${(num / 1000).toStringAsFixed(0)} K";
      } else if (num > 999999 && num < 999999999) {
        return "\$ ${(num / 1000000).toStringAsFixed(1)} M";
      } else if (num > 999999999) {
        return "\$ ${(num / 1000000000).toStringAsFixed(1)} B";
      } else {
        return num.toString();
      }
  }
}
