import 'dart:async';

import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/components/customButton.dart';
import 'package:btmmall/components/customButtonAnimation.dart';
import 'package:btmmall/screens/account_screen.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/screens/signup_screen.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  StreamSubscription<FirebaseUser> _listener;
  FirebaseUser _currentUser;
  bool isLogged = false;
  SharedPreferences prefs;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }

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
                      onTap: _logIn,
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
  void _logIn() {
    _loginWithFacebook().then((response) {
      _navigateToHome();
    });
  }
  Future<FirebaseUser> _loginWithFacebook() async {
    var facebookLogin = new FacebookLogin();
    var result = await facebookLogin.logInWithReadPermissions(['public_profile']);

    debugPrint(result.status.toString());

    final AuthCredential credential = FacebookAuthProvider.getCredential(
      accessToken: result.accessToken.token,
    );

    if (result.status == FacebookLoginStatus.loggedIn) {
      final FirebaseUser user = await _auth.signInWithCredential(credential);
      List<String> name = user.displayName.split(' ');
      String firstname = name[0];
      String lastname = name[1];
      final api = Provider.of<ApiService>(context, listen: false);
      api.fb_Register(user.uid, "", firstname, lastname, user.displayName).then((it) async{
        prefs = await SharedPreferences.getInstance();
        await prefs.setString('username', user.displayName);
        await prefs.setString('photo', user.photoUrl);
        await prefs.setString('token', user.toString());
        _navigateToHome();
      }).catchError((onError){
        print(onError.toString());
      });
    }
    return null;
  }
  void _navigateToHome(){
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => ContentScreen()), (Route<dynamic> route) => false);
  }
}