/*
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'background.dart';
import 'package:calisanimnerede/component/roundd_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: size.height * 0.01),
                RoundedButton(
                  text: "GPS Turn On and Be Active",
                  press: () {

                  },
                ),
              ],
            ),
            Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.50),
                  FloatingActionButton(child: Icon(Icons.attach_email),onPressed: (){})
                ],
            )
          ],
        ),
      ),
    );
  }
}
*/