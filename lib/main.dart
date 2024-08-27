import 'package:expense_tracker/home_header.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // scaffoldBackgroundColor: Color.fromARGB(179, 255, 255, 255),
        // colorScheme: ColorScheme.fromSeed(
        // seedColor: Colors.deepPurpleAccent,
        // ),
        useMaterial3: true,
      ),
      home: const HomeHeader(),
    );
  }
}
