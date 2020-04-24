import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/components/trackingButton.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OrderScreen extends StatefulWidget {
  @override
  _OrderScreenState createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  String username,password;
  SharedPreferences sharedPreferences;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.redAccent
          ),
        ),
        title: Center(
          child: Text(
            'MY ODRDERS',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
              letterSpacing: 1.0,
            ),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            iconSize: 24.0,
            color: Colors.white,
            onPressed: (){

            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            iconSize: 24.0,
            color: Colors.white,
            onPressed: (){

            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[200],
                        child: new Text("Your ongoing orders")
                    )),
                Container(
                  padding: EdgeInsets.only(top: 10,bottom: 10),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Column(
                      children: <Widget>[
                        SizedBox(child: Container(height: 1,color: Colors.grey[200])),
                        SizedBox(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: 100,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.0),
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/sl.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Container(
                                      height: 100,
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            height: 50,
                                            child: Column(
                                              children: <Widget>[
                                                Container(
                                                    child: Text("Essager Mangetic Cable Micro USB Type hargi Cab"),
                                                  width: 220,
                                                ),
                                                Container(
                                                  width: 220,
                                                  padding: EdgeInsets.only(top: 2),
                                                  child: Text("\$799.99",style: TextStyle(color: Colors.orange)),
                                                ),
                                              ],
                                            )
                                          ),
                                          Container(
                                            height: 50,
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  height: 50,
                                                  width: 100,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 100,
                                                          child: Text("Color: BLACK"),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(top: 2),
                                                          width: 100,
                                                          child: Text("Size: 50m"),
                                                        ),
                                                      ],
                                                    )
                                                ),
                                                Container(
                                                  height: 30,
                                                  width: 120,
                                                  child: TrackingButton(
                                                    label: "Tracking",
                                                    background: Colors.redAccent,
                                                    borderColor: Colors.white,
                                                    fontColor: Colors.white,
                                                    onTap: () async{
                                                      Navigator.pop(context,true);
                                                      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => ContentScreen()), (Route<dynamic> route) => false);
                                                    },
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      )
                                    ),
                                  ),
                                ],
                              ),
                            )
                        ),
                        SizedBox(child: Container(height: 1,color: Colors.grey[200])),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                    child: Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        color: Colors.grey[200],
                        child: new Text("Your completed orders")
                    )),
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(top: 10),
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
