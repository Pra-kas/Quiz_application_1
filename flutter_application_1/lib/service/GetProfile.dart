import 'dart:convert';
import 'package:flutter_application_1/data/repository/UserDetails.dart';
import 'package:http/http.dart' as http;

Future<bool> fetchProfile(name) async {
  print("Prakash");
  var decodeResponse = {};
  try {
    var url = Uri.parse('${User.Ip}/getProfile');
    
    var response = await http.post(url, headers: {"Content-Type": "application/json"},body: jsonEncode({"username":User.name}));
    decodeResponse = jsonDecode(response.body);
    if (decodeResponse['status']) {
      User.totalquiz = decodeResponse['message']["totalquiz"].toString();
      User.totalpoint = decodeResponse['message']["totalpoints"].toString();
      User.totalwrong = decodeResponse['message']["wronganswer"].toString();
      User.totalcorrect = decodeResponse['message']["correctanswer"].toString();
      print(User.totalcorrect + User.totalpoint + User.totalquiz + User.totalwrong);
      return true;
    }
  } catch (error) {
    print('Error fetching username: $error');
  }
  return false;
}
