import 'package:flutter/material.dart';
import 'package:global_news/Screens/Common_Screen.dart';
import 'package:global_news/Screens/Description.dart';
import 'package:global_news/Screens/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      initialRoute: "/homescreen",
      routes: {
        "/homescreen": (context) => HomeScreen(),
      },
    );
  }
}
