import 'package:http/http.dart' as http;
import 'dart:convert';

Future<dynamic> correct_answer(String option, int index) async{
  dynamic obj = {"index" : index,"answer" : option};
  print("Entered..");
  try{
    var requestBody = await http.post(Uri.parse("http://localhost:3000/answerValidation"),
      headers: {"Content-Type" : "application/json"},
      body: jsonEncode(obj),
    );
     var decode = jsonDecode(requestBody.body);
    if(decode['message'] == '1') return 1;
  }
  catch(error){
    print(error);
  };
 
  return 0;
}