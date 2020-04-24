import 'dart:async';
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
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

  Future<void> _handleRefresh() {
    final Completer<void> completer = Completer<void>();
    Timer(const Duration(milliseconds: 500), () {
      completer.complete();
    });
    return completer.future.then<void>((_) {
      _scaffoldKey.currentState?.showSnackBar(SnackBar(
          content: const Text('Refresh complete'),
          action: SnackBarAction(
              label: 'RETRY',
              onPressed: () {
                _refreshIndicatorKey.currentState.show();
              })));
    });
  }
  static final List<Widget> _items = <Widget>[
    FadeAnimation(1.2,  SlideShow()),
    FadeAnimation(1.4,PopularCategory()),
    FadeAnimation(1.6,TopSell()),
    FadeAnimation(1.8,GreateDiscount()),
    FadeAnimation(2,NewProduct()),
    FadeAnimation(2.2,JustForYou()),
  ];
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
          height: 45.0,
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
                borderRadius: BorderRadius.all(Radius.circular(0)),
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
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "assets/images/language.png",
              width: 24,
            ),
            iconSize: 24.0,
            color: Colors.white,
            onPressed: (){
            },
          ),
        ],
      ),
      body: LiquidPullToRefresh(
        color:  Colors.deepOrange,
        key: _refreshIndicatorKey,
        onRefresh: _handleRefresh,
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (BuildContext context, int index) {
            final  item = _items[index];
            return Column(
              children: <Widget>[
                item,
              ],
            );
          },
        ),
      ),
    );
  }
}
