import 'dart:convert';
import 'package:flutter_application_1/data/repository/UserDetails.dart';
import 'package:http/http.dart' as http;


Future<void> getLeaderProfile() async{
  var url = Uri.parse('${User.Ip}/getleaderboard');
  var response = await http.post(url, headers: {"Content-Type": "application/json"},body: jsonEncode({"username":User.name}));
  var decode = jsonDecode(response.body);
  User.topscore = decode['message'];
  print(User.topscore);
}