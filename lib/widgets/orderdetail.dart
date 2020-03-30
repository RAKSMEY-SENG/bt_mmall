
import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/models/data.dart';
import 'package:btmmall/screens/login_screen.dart';
import 'package:btmmall/widgets/overview_screen.dart';
import 'package:btmmall/widgets/review_screen.dart';
import 'package:btmmall/widgets/specification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderDetail extends StatefulWidget {
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  int _selectIndex = 0;
  double money = 50.00;
  Widget CallPage(int index){
    switch(index){
      case 0: return OverviewScreen();
      case 1: return ReviewScreen();
      case 2: return SpecificationScreen();
      break;
      default: return OverviewScreen();
    }
  }
  custom() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.transparent,
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                "assets/images/cart.png",
                width: 25,
              ),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: (){

              },
            ),
            IconButton(
              icon: Image.asset(
                "assets/images/search.png",
                width: 25,
              ),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: (){

              },
            ),
          ],
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            title: Text(
              "",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
            background: Image.asset(
              "assets/images/slide1.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            child: Center(
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 10,right: 270),
                      child: Text(
                        "\$89.00",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.redAccent,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10,left: 10),
                      child: Text(
                        "Essager Megnetic Cable Micro USB Type hargi Cab Samsung iPhone 7 6 Charge Magnet cable USB C Cord Wires",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5,left: 10),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              width: 150,
                              child: TextField(
                                readOnly: true,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                                controller: null,
                                decoration: InputDecoration(
                                  hintText: "Black",
                                  hintStyle: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      )
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: EdgeInsets.all(20),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    iconSize: 20,
                                    color: Colors.black,
                                    onPressed: () {
                                      _ColorModalBottomSheet(context);
                                    },
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        width: 0,
                                        color: Colors.deepOrange
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              width: 150,
                              child: TextField(
                                readOnly: true,
                                style: TextStyle(color: Colors.white),
                                textAlign: TextAlign.left,
                                keyboardType: TextInputType.text,
                                controller: null,
                                decoration: InputDecoration(
                                  hintText: "50m",
                                  hintStyle: GoogleFonts.openSans(
                                      textStyle: TextStyle(
                                        fontSize: 16,
                                        color: Colors.black,
                                      )
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: EdgeInsets.all(20),
                                  suffixIcon: IconButton(
                                    icon: Icon(Icons.keyboard_arrow_down),
                                    iconSize: 20,
                                    color: Colors.black,
                                    onPressed: () {
                                      _SizeModalBottomSheet(context);
                                    },
                                  ),
                                  filled: true,
                                  fillColor: Colors.grey[200],
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    borderSide: BorderSide(
                                        width: 0,
                                        color: Colors.deepOrange
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Column(
                        children: <Widget>[
                          Container(
                            child: BottomNavigationBar(
                              backgroundColor: Colors.white,
                              currentIndex: _selectIndex,
                              onTap: (value){
                                _selectIndex = value;
                                setState(() {});
                              },
                              type: BottomNavigationBarType.fixed,
                              items:[
                                new BottomNavigationBarItem(
                                  icon:  _selectIndex == 0?new Icon(Icons.receipt,color:  Colors.deepOrange): new Icon(Icons.receipt,color:  Colors.black),
                                  title: Text('Overview'),
                                ),
                                new BottomNavigationBarItem(
                                  icon: _selectIndex == 1?new Icon(Icons.dashboard,color:  Colors.deepOrange): new Icon(Icons.dashboard,color:  Colors.black),
                                  title: Text('Review'),
                                ),
                                new BottomNavigationBarItem(
                                  icon:  _selectIndex == 2?new Icon(Icons.library_books,color:  Colors.deepOrange): new Icon(Icons.library_books,color:  Colors.black),
                                  title: Text('Specification'),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            child: CallPage(_selectIndex),
                          )
                        ],
                      )
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: custom(),
      bottomNavigationBar: Container(
        height: 50,
        child: Row(
          children: <Widget>[
            Container(
              width: 180,
              height: 50,
              color: Colors.orangeAccent,
              child: Container(
                  child: LoginButton(
                    label: "Add To Cart",
                    backbround: Colors.transparent,
                    borderColor: Colors.transparent,
                    fontColor: Colors.white,
                    child: LoginScreen(),
                  )
              ),
            ),
            Container(
              width: 180,
              height: 50,
              color: Colors.redAccent,
              child: Container(
                child: LoginButton(
                  label: "Buy Now",
                  backbround: Colors.transparent,
                  borderColor: Colors.transparent,
                  fontColor: Colors.white,
                  child: LoginScreen(),
                )
              ),
            )
          ],
        ),
      ),
    );
  }
  void _ColorModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
            ),
            child: new Wrap(
              children: <Widget>[

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15),
                  child: Text("Choose Color", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 150,
                  child: ListView.builder(
                      itemCount: getcolor.length,
                      itemBuilder: (BuildContext context, int index){
                        return Material(
                          child: InkWell(
                            onTap: (){},
                            child: new Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  margin: EdgeInsets.only(top: 15,left: 30),
                                  child: Text(getcolor[index].colorname, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
  void _SizeModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20))
            ),
            child: new Wrap(
              children: <Widget>[

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 15),
                  child: Text("Choose Size", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                ),
                SizedBox(height: 5,),
                Container(
                  height: 150,
                  child: ListView.builder(
                    itemCount: getsize.length,
                    itemBuilder: (BuildContext context, int index){
                      return Material(
                        child: InkWell(
                          onTap: (){},
                          child: new Column(
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                margin: EdgeInsets.only(top: 15,left: 30),
                                child: Text(getsize[index].prosize, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}
