import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/components/customButton.dart';
import 'package:btmmall/components/customButtonAnimation.dart';
import 'package:btmmall/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/login.png", fit: BoxFit.cover),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFF001117).withOpacity(0.7),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30),
            margin: EdgeInsets.only(top: 80, bottom: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    FadeAnimation(2.4,Text("Great Gifts are", style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: 2
                    ))),
                    FadeAnimation(2.6,Text("HERE", style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                        fontWeight: FontWeight.bold
                    ))),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    FadeAnimation(2.8,CustomButton(
                      label: "Login With Facebook",
                      background: Colors.transparent,
                      fontColor: Colors.white,
                      borderColor: Colors.white,
                    )),
                    SizedBox(height: 15),
                    FadeAnimation(3.2,CustomButtonAnimation(
                      label: "Login With Phone Number",
                      backbround: Colors.white,
                      borderColor: Colors.white,
                      fontColor: Color(0xFFF001117),
                      child: SignUpScreen(),
                    )),
                    SizedBox(height: 30),
                    FadeAnimation(3.4,Text("Forgot password", style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        decoration: TextDecoration.underline
                    )))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}