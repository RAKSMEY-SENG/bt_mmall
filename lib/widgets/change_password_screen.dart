import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/components/customTextfieldChange.dart';
import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/components/trackingButton.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CurrentPasswordScreen extends StatefulWidget {
  @override
  _CurrentPasswordScreenState createState() => _CurrentPasswordScreenState();
}

class _CurrentPasswordScreenState extends State<CurrentPasswordScreen> {
  String username,password;
  SharedPreferences sharedPreferences;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.redAccent
          ),
        ),
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 40),
            child: Text(
              'CHANGE PASSWORD',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: new NetworkImage("https://cdn1.iconfinder.com/data/icons/social-messaging-ui-color-round-2/254000/62-512.png"),
                  backgroundColor: Colors.black12,
                ),
                SizedBox(height: 5),
                Text("Current Password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                CustomTextFieldChange(
                  label: "Enter your current password",
                  isPassword: true,
                  icon: Icon(Icons.remove_red_eye, size: 20,color: Colors.redAccent),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: TrackingButton(
                    label: "Next",
                    background: Colors.redAccent,
                    borderColor: Colors.white,
                    fontColor: Colors.white,
                    onTap: () async{
                      Navigator.push(context, PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: NewPasswordScreen()
                      ));
                    },
                  ),
                )
              ],
            )
          ),
        ),
      ),
    );
  }
}

class NewPasswordScreen extends StatefulWidget {
  @override
  _NewPasswordScreenState createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  String username,password;
  SharedPreferences sharedPreferences;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.redAccent
          ),
        ),
        title: Center(
          child: Padding(
            padding: EdgeInsets.only(right: 40),
            child: Text(
              'CHANGE PASSWORD',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                letterSpacing: 1.0,
              ),
            ),
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: new NetworkImage("https://cdn1.iconfinder.com/data/icons/social-messaging-ui-color-round-2/254000/62-512.png"),
                    backgroundColor: Colors.black12,
                  ),
                  SizedBox(height: 5),
                  Text("New Password",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                  SizedBox(height: 15),
                  CustomTextFieldChange(
                    label: "Enter your new password",
                    isPassword: true,
                    icon: Icon(Icons.remove_red_eye, size: 20,color: Colors.redAccent),
                  ),
                  SizedBox(height: 20),
                  Container(
                    height: 50,
                    child: TrackingButton(
                      label: "CHANGE PASSWORD",
                      background: Colors.redAccent,
                      borderColor: Colors.white,
                      fontColor: Colors.white,
                      onTap: () async{

                      },
                    ),
                  )
                ],
              )
          ),
        ),
      ),
    );
  }
}