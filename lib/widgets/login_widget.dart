import 'package:flutter/material.dart';
import 'package:itti_technical_test/widgets/login_form_widget.dart';
import 'package:itti_technical_test/widgets/logo_ueno_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        LogoUeno(),
        SizedBox(
          height: 100.0,
        ),
        LoginFormWidget(),
      ],
    );
  }
}
