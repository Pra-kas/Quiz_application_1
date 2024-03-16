import 'dart:convert';
import 'package:http/http.dart' as http;


 Future<dynamic> getQuestions(String content) async {
 
  var response = await http.post(Uri.parse("http://localhost:3000/getQuiz"),
    headers:{"Content-Type":"application/json"},
    body:jsonEncode({"collectionName":content})
  );
  var decodeResponse = jsonDecode(response.body);
  print(decodeResponse["message"]);
  return decodeResponse; 
}