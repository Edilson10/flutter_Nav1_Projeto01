import 'package:flutter/material.dart';
import 'package:projeto01/controllers/login_controller.dart';

class CustomLoginButtonComponent extends StatelessWidget {
  final LoginController loginController;
  const CustomLoginButtonComponent({super.key, required this.loginController});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: loginController.inLoader,
      // ignore: prefer_const_constructors
      builder: (_, inLoader, __) => inLoader
          // ignore: prefer_const_constructors
          ? CircularProgressIndicator()
          : ElevatedButton(
              onPressed: () {
                loginController.auth().then((result) {
                  if (result) {
                    // ignore: avoid_print
                    Navigator.of(context).pushReplacementNamed('/home');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Usuario/Senha Invalida'),
                      duration: Duration(seconds: 5),
                    ));
                  }
                });
              },
              // ignore: prefer_const_constructors
              child: Text('Login'),
            ),
    );
  }
}
