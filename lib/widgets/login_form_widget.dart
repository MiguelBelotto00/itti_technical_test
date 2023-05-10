import 'package:flutter/material.dart';
import 'package:itti_technical_test/pages/home_page.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _userController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? validatorFormFields(String? value) {
    if (value == null || value.isEmpty) {
      return "Este campo es obligatorio";
    } else {
      return null;
    }
  }

  void validateForm() {
    if (_formKey.currentState!.validate()) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              "Debe ingresar el usuario y la contraseña, para continuar")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              validator: validatorFormFields,
              decoration: const InputDecoration(labelText: "Usuario"),
              keyboardType: TextInputType.text,
              controller: _userController,
            ),
            TextFormField(
              validator: validatorFormFields,
              decoration: const InputDecoration(labelText: "Contraseña"),
              keyboardType: TextInputType.number,
              controller: _passwordController,
              maxLength: 5,
            ),
            ElevatedButton(
              onPressed: validateForm,
              child: const Text("Ingresar"),
            ),
          ],
        ),
      ),
    );
  }
}
