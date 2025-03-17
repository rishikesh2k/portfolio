import 'package:dev_rishikesh/providers/navigation_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/navigation.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => NavigationProvider(),
    child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rishikesh Yadav Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        textTheme: TextTheme(
          headlineMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(color: Colors.black87),
        ),
      ),
      home: Navigation(),
    );
  }
}