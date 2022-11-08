import 'package:calisanimnerede/component/roundd_button.dart';
import 'package:calisanimnerede/component/rounded_input_field.dart';
import 'package:calisanimnerede/component/rounded_password_field.dart';
import 'package:flutter/material.dart';
import 'package:calisanimnerede/Manglog/componentmanager/background.dart';

class Body extends StatelessWidget {
const Body({
Key key,
}) : super(key: key);

@override
Widget build(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Background(
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "MANAGER LOGIN",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.03),
          Image.asset('assets/icons/manager.jpeg'),
          SizedBox(height: size.height * 0.03),
          RoundedInputField(
            hintText: "Your Email",
            onChanged: (value) {

            },
          ),
          RoundedPasswordField(
            onChanged: (value) {},
          ),
          RoundedButton(
            text: "LOGIN",
            press: () {

            },
          ),
          SizedBox(height: size.height * 0.03),
        ],
      ),
    ),
  );
}
}
