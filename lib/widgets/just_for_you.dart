import 'package:btmmall/models/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'orderdetail.dart';

class JustForYou extends StatefulWidget {
  @override
  _JustForYouState createState() => _JustForYouState();
}

class _JustForYouState extends State<JustForYou> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Just For You',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 540.0,
            child: GridView.builder(
              primary: false,
              itemCount: newproduct.length,
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 1.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 84,
                          width: MediaQuery.of(context).size.width,
                          color: Colors.black,
                          child: Image.asset(
                              newproduct[index].imageUrl,
                              width: MediaQuery.of(context).size.width,
                          )
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 5,left: 7, right: 7),
                          child: Text(
                            newproduct[index].name,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                        Container(
                          child: Stack(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(top: 15, left: 10),
                                child: Stack(
                                  children: <Widget>[
                                    Text(
                                      "\$"+newproduct[index].price,
                                      style: GoogleFonts.openSans(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w600)),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 100),
                                child: Stack(
                                  children: <Widget>[
                                    IconButton(
                                      icon: Image.asset(
                                        "assets/images/ic_cart.png",
                                        width: 20,
                                      ),
                                      iconSize: 20.0,
                                      color: Colors.white,
                                      onPressed: () {
                                        OrderDetail();
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
