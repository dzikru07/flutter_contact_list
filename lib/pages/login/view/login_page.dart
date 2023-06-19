import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../style/color.dart';
import '../../../style/text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email;
  String? _password;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login Form',
          style: appBarTextStyle,
        ),
        backgroundColor: mainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const SizedBox(),
              Image.asset(
                'assets/images/logo.png',
                width: width / 4,
              ),
              Column(
                children: [
                  TextFormField(
                    style: loginFormStyle,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please type an email';
                      }
                      _email = input;
                      return null;
                    },
                    onSaved: (input) => _email = input,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Email Address',
                        hintStyle: loginHintStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    obscureText: true,
                    style: loginFormStyle,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please type a password';
                      }
                      _password = input;
                      return null;
                    },
                    onSaved: (input) => _password = input,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade200,
                        hintText: 'Password',
                        hintStyle: loginHintStyle,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        )),
                  ),
                  SizedBox(
                    height: height / 15,
                  ),
                  SizedBox(
                    height: 50,
                    width: width,
                    child: Material(
                      borderRadius: BorderRadius.circular(5),
                      color: mainColor,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(5),
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            Get.offAllNamed('/home');
                          }
                        },
                        highlightColor: Colors.red.withOpacity(0.4),
                        splashColor: Colors.purple.withOpacity(0.5),
                        child: Center(
                            child: Text(
                          "Login",
                          style: loginButtonStyle,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
