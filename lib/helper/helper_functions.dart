import 'package:flutter/material.dart';

void displayMessageToUser(String message, context){
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Message'),
      content: Text(message),
    ),
  );
}