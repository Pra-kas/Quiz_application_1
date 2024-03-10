import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<bool> validateUser(TextEditingController email, TextEditingController password, TextEditingController conformpassword) async{
    if(email.text.trim().isNotEmpty && password.text.trim().isNotEmpty && conformpassword.text.trim().isNotEmpty){
      var requestBody = {
      "email":email.text.trim(),
      "password":password.text.trim(),
      "confirmPassword":conformpassword.text.trim(),
    };

    var response = await http.post(Uri.parse("http://192.168.42.55:3000/signup"),
    headers:{"content-Type":"application/json"},
    body:jsonEncode(requestBody)
    );

    var decodeResponse = jsonDecode(response.body);
    print("hello ${decodeResponse["message"].toString()}");
    if(decodeResponse['status']){
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
