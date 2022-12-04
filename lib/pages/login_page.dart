// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:projeto01/components/login/custom_login_button_component.dart';
import 'package:projeto01/controllers/login_controller.dart';

import '../widgets/custom_text_field_widget.dart';

class LoginPage extends StatelessWidget {
  // ignore: prefer_final_fields
  final LoginController _controller = LoginController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Container(
        // ignore: prefer_const_constructors
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // ignore: prefer_const_constructors
            Icon(
              Icons.people,
              size: MediaQuery.of(context).size.height * 0.2,
            ),
            CustomTextFieldWidget(
                label: 'Login', onChanged: _controller.setLogin),
            CustomTextFieldWidget(
              label: 'Senha',
              onChanged: _controller.setPass,
              obscureText: true,
            ),

            // ignore: prefer_const_constructors
            SizedBox(
              height: 15,
            ),
            // ignore: prefer_const_constructors
            CustomLoginButtonComponent(
              loginController: _controller,
            ),
            // ignore: prefer_const_constructors
            SizedBox(
              height: 15,
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     // ignore: prefer_const_constructors
            //     Text('Nao tem uma conta?'),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
