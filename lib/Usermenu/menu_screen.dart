import 'package:calisanimnerede/component/rounded_name_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:calisanimnerede/Usermenu/componentmenu/user.dart';
import 'package:calisanimnerede/component/roundd_button.dart';

import 'componentmenu/background.dart';

class Menu_Screen extends StatefulWidget {
  static const String id = 'menu_screen';

  @override
  _Menu_ScreenState createState() => _Menu_ScreenState();
}

class _Menu_ScreenState extends State<Menu_Screen> {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
  String name;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    }
    catch(e){
      print(e);
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.01),
                  RoundedNameField(
                    hintText: "Your Name",
                    onChanged: (value) {
                      name= value;
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  RoundedButton(
                    text: "GPS Turn On and Be Active",
                    press: () {
                      if(name.isEmpty){
                        return'Name cannot be empty';
                      }
                      else{

                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.01),
                  RoundedButton(
                    text: "GPS Turn Off",
                    press: () {
                      _auth.signOut();
                      Navigator.pop(context);
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
