import 'package:flutter/material.dart';
import 'package:itti_technical_test/helpers/primary_colors_helpers.dart';
import 'package:itti_technical_test/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Itti Test",
      theme: ThemeData(primarySwatch: PrimaryColorsHelpers.mainAppColor),
      home: const LoginPage(),
    );
  }
}
