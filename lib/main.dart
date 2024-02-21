import 'package:flutter/material.dart';
import 'package:lab3_form/components/formpage.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Form Page'),
          ),
          body: const FormPage()),
    );
  }
}
