import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/components/trackingButton.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ChangeAddressScreen extends StatefulWidget {
  @override
  _ChangeAddressScreenState createState() => _ChangeAddressScreenState();
}

class _ChangeAddressScreenState extends State<ChangeAddressScreen> {
  String username,password;
  SharedPreferences sharedPreferences;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
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
              'CHANGE ADDRESS',
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
      body: Padding(
        padding: const EdgeInsets.only(left: 10,right: 10),
        child: Column(
          children: <Widget>[
            SizedBox(height: 20),
            Container(
              width: MediaQuery.of(context).size.width,
                child: Text(
                    'Addresses',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.grey[500])
                )
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: Colors.white,
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.add_circle),
                    color: Colors.redAccent,
                    onPressed: (){
                      Navigator.push(context, PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: MapScreen()
                      ));
                    },
                  ),
                  Text('Add an address',style: TextStyle(color: Color(0xFF0000b3),fontSize: 16)),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String username,password;
  SharedPreferences sharedPreferences;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
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
                'CHANGE ADDRESS',
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
        body: Column(
          children: <Widget>[

          ],
        )
    );
  }
}
