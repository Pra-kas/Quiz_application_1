// import 'dart:convert';
// import 'package:http/http.dart' as http;


// Future<bool> correct_answer(String option) async{
//   var responsebody = await http.post(Uri.parse("http://localhost:3000/getQuiz"),
//     headers: {"content-Type" : "text"},
//     body: jsonEncode(option),
//   );

//   var decodeResponse = jsonDecode(responsebody.body);
//   print(decodeResponse);
//   if(decodeResponse == '1') return true;
//   return false;
// }