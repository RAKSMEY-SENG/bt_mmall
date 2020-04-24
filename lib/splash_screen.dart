import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/screens/login_screen.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shimmer/shimmer.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState(){
    super.initState();

    _mockCheckForSession().then(
        (status) {
          if (status) {
            _navigateToHome();
          } else {
            _navigateToLogin();
          }
        }
    );
  }


  Future<bool> _mockCheckForSession() async {

    await Future.delayed(Duration(milliseconds: 2500), () {
    });

    return true;
  }

  void _navigateToHome(){
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (BuildContext context) => ContentScreen()
      )
    );
  }

  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/images/login.png", fit: BoxFit.cover),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFF001117).withOpacity(0.7),
          ),
          Shimmer.fromColors(
            period: Duration(milliseconds: 1500),
            baseColor: Colors.transparent,
            highlightColor: Color(0xfffffff),
            child:  Image.asset("assets/images/login.png", fit: BoxFit.cover),
//              child: Container(
//                child: Text(
//                  "Welcome To Makarain Mall",
//                  style: TextStyle(
//                      fontSize: 25.0,
//                      fontFamily: 'Pacifico',
//                      shadows: <Shadow>[
//                        Shadow(
//                            blurRadius: 18.0,
//                            color: Colors.black87,
//                            offset: Offset.fromDirection(120, 12)
//                        )
//                      ]
//                  ),
//                ),
//              ),
          )
        ],
      ),
    );
  }


}