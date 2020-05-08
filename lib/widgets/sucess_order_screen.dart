import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/checkout/checkout_bloc.dart';
import 'package:btmmall/checkout/checkout_event.dart';
import 'package:btmmall/checkout/checkout_state.dart';
import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/components/trackingButton.dart';
import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/widgets/confirm_order_screen.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:btmmall/widgets/order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'change_password_screen.dart';

class SuccessOrderScreen extends StatefulWidget {
  @override
  _SuccessOrderScreenState createState() => _SuccessOrderScreenState();
}

class _SuccessOrderScreenState extends State<SuccessOrderScreen> {
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
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "assets/images/cart.png",
              width: 24,
            ),
            iconSize: 24.0,
            color: Colors.white,
            onPressed: (){

            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 70,left: 10,right: 10),
          child: Center(
              child: Column(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: new NetworkImage(""),
                    backgroundColor: Colors.green,
                  ),
                  SizedBox(height: 50),
                  Text("Your order has been placed!",style: TextStyle(color: Colors.green)),
                  SizedBox(height: 5),
                  Text("We will contact you shortly for delivery",style: TextStyle(color: Colors.black54)),
                  SizedBox(height: 50),
                  Container(
                    height: 50,
                    child: TrackingButton(
                      label: "See My Orders",
                      background: Colors.redAccent,
                      borderColor: Colors.white,
                      fontColor: Colors.white,
                      onTap: () async{
                        Navigator.push(context, PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: OrderScreen()
                        ));
                      },
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 50,
                    child: TrackingButton(
                      label: "Done",
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
              )
          ),
        ),
      ),
    );
  }
}

