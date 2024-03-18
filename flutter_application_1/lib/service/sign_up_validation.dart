import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<int> validateUser(TextEditingController email, TextEditingController password, TextEditingController confirmPassword) async {
  // Validate email format
  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email.text.trim())) {
    print('Invalid email format');
    return 400;
  }

  // Validate password length
  if (password.text.trim().length < 8) {
    print('Password must be at least 8 characters long');
    return 304;
  }

  // Check if passwords match
  if (password.text.trim() != confirmPassword.text.trim()) {
    print('Passwords do not match');
    return 104;
  }

  // Make API call to register user
  var requestBody = {
    "email": email.text.trim(),
    "password": password.text.trim(),
    "confirmPassword": confirmPassword.text.trim(),
    "username" : extractUsernameFromEmail(email.text.trim()),
  };

  var response = await http.post(
    Uri.parse("http://localhost:3000/signup"),
    headers: {"Content-Type": "application/json"},
    body: jsonEncode(requestBody),
  );

  var decodeResponse = jsonDecode(response.body);
  print("Response: ${decodeResponse['message'].toString()}");

  return decodeResponse["message"] as int; // Return the status from the server response
}

String extractUsernameFromEmail(String email) {
  List<String> parts = email.split('@');
  if (parts.length != 2 || parts[1].isEmpty) {
    throw const FormatException('Invalid email address format');
  }
  return parts[0];
}


