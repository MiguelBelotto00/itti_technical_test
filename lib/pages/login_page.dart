import 'package:flutter/material.dart';
import 'package:itti_technical_test/widgets/custom_background_widget.dart';
import 'package:itti_technical_test/widgets/login_form_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String path = "assets/images/logo_ueno.png";

  @override
  Widget build(BuildContext context) {
    final sizeOfKeyboard = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      body: Stack(
        children: [
          const CustomBackgroundWidget(),
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: sizeOfKeyboard == 0 ? 300.0 : 250.0,
              height: sizeOfKeyboard == 0 ? 300.0 : 250.0,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(path))),
            ),
          ),
          const LoginFormWidget()
        ],
      ),
    );
  }
}
