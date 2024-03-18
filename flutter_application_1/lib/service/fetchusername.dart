import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> fetchUsername() async {
  print("Prakash");
  try {
    var email = 'pk@gmail.com';
    var url = Uri.parse('http://localhost:3000/getProfileDetails');
    
    var response = await http.post(url, headers: {"Content-Type": "plain/text"},body: jsonEncode(email));
    if (response.statusCode == 200) {
      print("Prakash" + jsonEncode(response.body));
      return jsonDecode(response.body);
    } else {
      print('Failed to fetch username: ${response.statusCode}');
    }
  } catch (error) {
    print('Error fetching username: $error');
  }
  return "";
}
