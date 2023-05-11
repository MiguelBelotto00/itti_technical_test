import 'package:flutter/material.dart';

class LogoUeno extends StatefulWidget {
  const LogoUeno({super.key});

  @override
  State<LogoUeno> createState() => _LogoUenoState();
}

class _LogoUenoState extends State<LogoUeno> {
  final String path = "assets/images/logo_ueno.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.0,
      height: 250.0,
      decoration:
          BoxDecoration(image: DecorationImage(image: AssetImage(path))),
    );
  }
}
