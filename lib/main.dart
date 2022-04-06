import 'package:e_learning_app_ui/root_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
    theme: ThemeData(fontFamily: 'WorkSans'),
    debugShowCheckedModeBanner: false,
    home: const RootApp(),
  ));
}