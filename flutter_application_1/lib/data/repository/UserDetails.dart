// ignore: file_names
// import 'package:shared_preferences/shared_preferences.dart';

class User{
  static String name = "";
  static String session = "";
  static String totalquiz = "";
  static String totalpoint = "";
  static String totalcorrect = "";
  static String totalwrong = "";
  static List<dynamic> topscore = [];
  static String Ip = "http://172.17.12.98:3000";
 
  // Future<void> clearSession() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.remove('session');
  // }
}


