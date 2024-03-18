import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../data/repository/UserDetails.dart';


Future<bool> validateUser(TextEditingController email,TextEditingController password) async{
 if(email.text.trim().isNotEmpty && password.text.trim().isNotEmpty){
      var requestBody = {
      "email":email.text.trim(),
      "password":password.text.trim(),
    };

    var response = await http.post(Uri.parse("http://localhost:3000/login"),
    headers:{"Content-Type":"application/json"},
    body:jsonEncode(requestBody)
    );

    var decodeResponse = jsonDecode(response.body);
    print("hello ${decodeResponse["message"].toString()}");
    print(decodeResponse["status"]);

    if(decodeResponse['status']){
      User.name = decodeResponse['user'];
      User.session = decodeResponse['session'];
       return true;
    }
    else{
        return false;
    }
  }
  else{
    return false;
  }
}