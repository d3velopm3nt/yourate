import 'package:flutter/material.dart';
import 'package:yourate/ui/views/main/main_view.dart';
import '/app/locator.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'You Rate',
      home: MainView(),
    );
  }
}
