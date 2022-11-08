
import 'package:calisanimnerede/Login/login_screen.dart';
import 'package:calisanimnerede/Usermenu/menu_screen.dart';
import 'package:calisanimnerede/component/already_have_an_account.dart';
import 'package:calisanimnerede/component/roundd_button.dart';
import 'package:calisanimnerede/component/rounded_input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:calisanimnerede/component/rounded_password_field.dart';
import 'package:calisanimnerede/component/rounded_name_field.dart';
import '../../constants.dart';
import 'background.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  String email;
  String password;
  bool showProgress = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset('assets/icons/sign.jpeg'),
            SizedBox(height: size.height * 0.01),
            /*RoundedNameField(
                hintText: "Your Name",
                onChanged: (value) {
                  if(value.isEmpty){
                    return'Name cannot be empty';
                  }
                },
              ),
            SizedBox(height: size.height * 0.01),*/
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                if(value.isEmpty){
                  return'Email cannot be empty';
                }else {
                  email = value;
                }
                },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                if(value.isEmpty){
                  return'Password cannot be empty';
                }else {
                  password = value;
                }
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              press: () async {
                try {
                  final newUser = await _auth.createUserWithEmailAndPassword(
                      email: email, password: password);
                  if(newUser != null) {
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
            SizedBox(height: size.height * 0.01),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
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

