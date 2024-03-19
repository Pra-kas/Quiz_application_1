import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/repository/UserDetails.dart';
import 'package:http/http.dart' as http;

    Future<dynamic> quiz_validation(dynamic title,TextEditingController question,TextEditingController A, TextEditingController B, TextEditingController C,TextEditingController D,TextEditingController answer, List<Map<String,String>> obj) async{
      if(question.text.trim().isNotEmpty && A.text.trim().isNotEmpty && B.text.trim().isNotEmpty && C.text.trim().isNotEmpty && D.text.trim().isNotEmpty && answer.text.trim().isNotEmpty){
        // print(title.text.trim() + jsonEncode(obj));
        var response = await http.post(Uri.parse("${User.Ip}/insertQuiz"),
          headers:{"collectionName": title,
          "Content-Type":"application/json",
          "session" : User.session},
          body:jsonEncode(obj)
        );
        print(title + "Nakku");
        print(jsonEncode(obj));
        var decodeResponse = jsonDecode(response.body);
        print("hello ${decodeResponse["message"].toString()}");
        return decodeResponse;
    }
    else{
      return {"status":false,"message":"hello"};
    }
}