import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/components/buttonLoginAnimation.dart';
import 'package:btmmall/components/customButtonAnimation.dart';
import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
            'MY CART',
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
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: IconButton(
              icon: Icon(Icons.delete),
              iconSize: 24.0,
              color: Colors.white,
              onPressed: (){

              },
            ),
          ),
        ],
      ),
      body: Container(
        child: Container(
          child: Stack(
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 200.0,
                      color: Colors.white,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Column(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.shopping_cart),
                              iconSize: 24.0,
                              color: Colors.black38,
                              onPressed: (){

                              },
                            ),
                            Text(
                              'Your cart is empty',
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 18.0,
                                letterSpacing: 1.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 15,left: 100,right: 100,),
                              child: LoginButton(
                                label: "Contiune Shopping",
                                backbround: Colors.redAccent,
                                borderColor: Colors.white,
                                fontColor: Colors.white,
                                child: ContentScreen(),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child:  FadeAnimation(1.2,JustForYou()),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
