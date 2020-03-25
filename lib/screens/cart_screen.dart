import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
                    ),
                    Container(
                      child: new JustForYou(),
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
