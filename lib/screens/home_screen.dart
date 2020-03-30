import 'dart:ui';
import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/widgets/greate_discout.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:btmmall/widgets/new_product.dart';
import 'package:btmmall/widgets/popular_category.dart';
import 'package:btmmall/widgets/slideshow.dart';
import 'package:btmmall/widgets/top_sell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
//        backgroundColor: Colors.deepOrange,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Colors.deepOrangeAccent,
                Colors.deepOrange,
              ],
            ),
          ),
        ),
        title: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 13.0),
            child: Container(
              height: 40.0,
              child: TextField(
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
                keyboardType: TextInputType.text,
                controller: null,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsets.all(16),
                  prefixIcon: IconButton(
                    icon: Image.asset(
                      "assets/images/search.png",
                      width: 20,
                    ),
                    iconSize: 20,
                    color: Colors.white,
                    onPressed: () {},
                  ),
                  filled: true,
                  fillColor: Colors.white30,
                  enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                        width: 0,
                        color: Colors.deepOrange
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      "assets/images/camera.png",
                      width: 20,
                    ),
                    iconSize: 20.0,
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: IconButton(
              icon: Image.asset(
                "assets/images/language.png",
                width: 24,
              ),
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
                    height: 170,
                    child: FadeAnimation(1.2,  SlideShow()),
                  ),
                  Container(
                    height: 210,
                    child: FadeAnimation(1.4,PopularCategory()),
                  ),
                  Container(
                    height: 200,
                    child:  FadeAnimation(1.6,TopSell()),
                  ),
                  Container(
                    height: 270.0,
                    child: FadeAnimation(1.8,GreateDiscount()),
                  ),
                  Container(
                    height: 200,
                    child: FadeAnimation(2,NewProduct()),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: FadeAnimation(2.2,JustForYou()),
                  ),
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
