import 'dart:convert';
import 'package:http/http.dart' as http;


 Future<dynamic> getQuestions(String content) async {
  if(content == "General knowledge") content = "general_knowledges";
     print(content);
     var response = await http.post(Uri.parse("http://192.168.42.55:3000/getQuiz"),
    headers:{"Content-Type":"application/json"},
    body:jsonEncode({"collectionName":content})
  );
  var decodeResponse = jsonDecode(response.body);
  // print(decodeResponse["message"]);
  return decodeResponse; 
}