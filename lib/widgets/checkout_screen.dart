import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckOutScreen extends StatefulWidget {
  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
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
            'CART',
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
            icon: Icon(Icons.delete),
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
                              padding: EdgeInsets.only(top: 5,bottom: 5),
                              child: Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: isChecked,
                                    activeColor: Colors.redAccent,
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value;
                                      });
                                    },
                                  ),
                                  Container(
                                    height: 90,
                                    width: 85,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3.0),
                                      image: DecorationImage(
                                        image: AssetImage('assets/images/sl.jpg'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
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
                                            padding: EdgeInsets.only(top: 5),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Container(
                                                  height: 50,
                                                  width: 110,
                                                    child: Column(
                                                      children: <Widget>[
                                                        Container(
                                                          width: 110,
                                                          child: Text("Color: BLACK"),
                                                        ),
                                                        Container(
                                                          padding: EdgeInsets.only(top: 2),
                                                          width: 110,
                                                          child: Text("Size: 50m"),
                                                        ),
                                                      ],
                                                    )
                                                ),
                                                Container(
                                                  height: 30,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                    children: <Widget>[
                                                      IconButton(
                                                        icon: Icon(Icons.do_not_disturb_on,color: Colors.grey),
                                                        onPressed: (){},
                                                      ),
                                                      Text("1"),
                                                      IconButton(
                                                        icon: Icon(Icons.add_circle,color: Colors.grey),
                                                        onPressed: (){},
                                                      )
                                                    ],
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
                SizedBox(child: Container(height: 7,color: Colors.grey[300])),
                Container(
                  height: 70,
                  padding: EdgeInsets.only(left: 10,right: 10),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: new Icon(Icons.credit_card),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 20,left: 15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: EdgeInsets.only(right: 37),
                                  child: new Text("Cash on Delivery",style: TextStyle(color: Color(0xFF0000b3),fontSize: 12)),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 2),
                                  child: new Text("Pay with cash when you receive your products",style: TextStyle(color: Colors.black87,fontSize: 10)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      new Text("CHANGE",style: TextStyle(color: Colors.redAccent,fontSize: 14),)
                    ],
                  ),
                ),
                SizedBox(child: Container(height: 7,color: Colors.grey[300])),
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
      bottomNavigationBar: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Container(
          width: MediaQuery.of(context).size.width/2,
          height: 50,
          color: Colors.redAccent,
          child: Container(
              child: LoginButton(
                label: "CHECK OUT",
                background: Colors.transparent,
                borderColor: Colors.transparent,
                fontColor: Colors.white,
                onTap: () async{

                },
              )
          ),
        ),
      ),
    );
  }
}
