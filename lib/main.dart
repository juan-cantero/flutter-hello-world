import 'package:flutter/material.dart';
import 'package:hello_world/presentation/screens/counter_function_screen.dart';
import 'package:hello_world/presentation/screens/counter_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterFunctionScreen(),
      theme: ThemeData(colorSchemeSeed: Colors.tealAccent),
    );
  }
}
