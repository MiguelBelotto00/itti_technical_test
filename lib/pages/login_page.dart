import 'package:flutter/material.dart';
import 'package:itti_technical_test/widgets/custom_background_widget.dart';
import 'package:itti_technical_test/widgets/login_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: const [CustomBackgroundWidget(), LoginWidget()],
            ),
          ),
        ),
      ),
    );
  }
}
