import 'package:flutter/material.dart';
import 'package:portfolio/portfolio.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio',
      theme: ThemeData(
        canvasColor: Colors.purple.shade50,
        primarySwatch: Colors.purple,
        useMaterial3: true,
        fontFamily: "custom",
      ),
      home:const Portfolio(),
    );
  }
}

