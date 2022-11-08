import 'package:calisanimnerede/Signup/signup_screen.dart';
import 'package:calisanimnerede/Usermenu/menu_screen.dart';
import 'package:calisanimnerede/component/already_have_an_account.dart';
import 'package:calisanimnerede/component/roundd_button.dart';
import 'package:calisanimnerede/component/rounded_input_field.dart';
import 'package:calisanimnerede/component/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:calisanimnerede/Login/componentlog/background.dart';

class Body extends StatelessWidget {
  final _auth = FirebaseAuth.instance;
  String email, password;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              Image.asset('assets/icons/log.jpeg'),
              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "Your Email",
                onChanged: (value) {
                  email = value;
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  password = value;
                },
              ),
              RoundedButton(
                text: "LOGIN",
                press: () async{
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return Menu_Screen();
                          },
                        ),
                      );
                    }
                  }
                  catch(e){
                    print(e);
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      );
  }

}