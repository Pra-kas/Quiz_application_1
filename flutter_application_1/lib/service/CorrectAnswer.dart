// ignore: file_names
import 'dart:convert';
import 'package:flutter_application_1/data/repository/UserDetails.dart';
import 'package:http/http.dart' as http;

Future<dynamic> setCorrectAnswer(int correct) async {
  print("Prakash");
  try {
    var url = Uri.parse('${User.Ip}/setprofile');
    
    var response = await http.post(url, headers: {"Content-Type": "application/json"},body: jsonEncode({"correct" : correct,"username":User.name}));
    var decode = jsonDecode(response.body);
    print(decode);
    return decode;

  } catch (error) {
    // print('Error fetching username: $error');
  }
}
