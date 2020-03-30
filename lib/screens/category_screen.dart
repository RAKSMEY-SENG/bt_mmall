import 'dart:ui';
import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/components/buttonLoginAnimation.dart';
import 'package:btmmall/components/customButton.dart';
import 'package:btmmall/screens/login_screen.dart';
import 'package:btmmall/widgets/greate_discout.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:btmmall/widgets/new_product.dart';
import 'package:btmmall/widgets/popular_category.dart';
import 'package:btmmall/widgets/slideshow.dart';
import 'package:btmmall/widgets/top_sell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
        ),
        title: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0),
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
                        color: Colors.black26,
                      )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsets.all(16),
                  prefixIcon: IconButton(
                    icon: Image.asset(
                      "assets/images/black_search.png",
                      width: 20,
                    ),
                    iconSize: 20,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(219,219, 219, 219 ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                        width: 0,
                        color: Colors.white
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      "assets/images/black_camera.png",
                      width: 20,
                    ),
                    iconSize: 20.0,
                    color: Colors.black,
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
        child: Column(
          children: <Widget>[
          ],
        ),
      ),
    );
  }
}
