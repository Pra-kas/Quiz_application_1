import 'dart:convert';
import 'package:flutter_application_1/data/repository/UserDetails.dart';
import 'package:http/http.dart' as http;


 Future<dynamic> getQuestions(String content) async {
 
  var response = await http.post(Uri.parse("${User.Ip}/getQuiz"),
    headers:{"Content-Type":"application/json",
    "session" : User.session},
    body:jsonEncode({"collectionName":content})
  );
  var decodeResponse = jsonDecode(response.body);
  print(decodeResponse["message"]);
  return decodeResponse; 
}