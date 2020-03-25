import 'dart:ui';
import 'package:btmmall/widgets/greate_discout.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:btmmall/widgets/new_product.dart';
import 'package:btmmall/widgets/popular_category.dart';
import 'package:btmmall/widgets/slideshow.dart';
import 'package:btmmall/widgets/top_sell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Container(
          child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SlideShow(),
                  PopularCategory(),
                  TopSell(),
                  GreateDiscount(),
                  NewProduct(),
                  JustForYou(),
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
