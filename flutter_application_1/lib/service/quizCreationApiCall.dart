import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

    Future<bool> quiz_validation(TextEditingController question,TextEditingController A, TextEditingController B, TextEditingController C,TextEditingController D,TextEditingController answer, TextEditingController title, List<Map<String,String>> obj) async{
      if(question.text.trim().isNotEmpty && A.text.trim().isNotEmpty && B.text.trim().isNotEmpty && C.text.trim().isNotEmpty && D.text.trim().isNotEmpty && answer.text.trim().isNotEmpty){
        print(title.text.trim() + jsonEncode(obj));
        var response = await http.post(Uri.parse("http://192.168.42.55:3000/insertQuiz"),
          headers:{"collectionName":title.text.trim(),
          "Content-Type":"application/json"},
          body:jsonEncode(obj)
        );
        print(jsonEncode(obj));
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