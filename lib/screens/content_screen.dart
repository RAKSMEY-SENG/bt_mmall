import 'dart:ui';
import 'package:btmmall/screens/account_screen.dart';
import 'package:btmmall/screens/cart_screen.dart';
import 'package:btmmall/screens/category_screen.dart';
import 'package:btmmall/screens/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ContentScreen extends StatefulWidget {
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  static const _imageheiht = 100.0;
  int _selectIndex = 0;
  Widget CallPage(int index){
    switch(index){
      case 0: return HomeScreen();
      case 1: return CategoryScreen();
      case 2: return CartScreen();
      case 3: return AccountSceen();
        break;
        default: return HomeScreen();
    }
  }
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
      body: CallPage(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectIndex,
        onTap: (value){
          _selectIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items:[
          new BottomNavigationBarItem(
            icon:  _selectIndex == 0?new Icon(Icons.home,color:  Colors.deepOrange): new Icon(Icons.home,color:  Colors.black),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            icon: _selectIndex == 1?new Icon(Icons.border_all,color:  Colors.deepOrange): new Icon(Icons.border_all,color:  Colors.black),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            icon:  _selectIndex == 2?new Icon(Icons.shopping_cart,color:  Colors.deepOrange): new Icon(Icons.shopping_cart,color:  Colors.black),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            icon:  _selectIndex == 3?new Icon(Icons.person,color:  Colors.deepOrange): new Icon(Icons.person,color:  Colors.black),
            title: Text(''),
          ),
        ],
      ),
    );
  }
}
