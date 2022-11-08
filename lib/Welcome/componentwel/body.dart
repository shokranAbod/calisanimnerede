import 'package:calisanimnerede/component/roundd_button.dart';
import 'package:flutter/material.dart';
import 'package:calisanimnerede/constants.dart';
import 'background.dart';
import 'package:calisanimnerede/Login/login_screen.dart';
import 'package:calisanimnerede/Manglog/manager_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "WELCOME",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            Image.asset('assets/icons/wel.jpeg'),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "USER LOGIN",
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
            RoundedButton(
              text: "MANAGER LOGIN",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ManagerLogInScreen();
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
