import 'package:btmmall/models/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TopSell extends StatefulWidget {
  @override
  _TopSellState createState() => _TopSellState();
}

class _TopSellState extends State<TopSell> {
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Top Selling',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
                Text(
                  'See all',
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 150.0,
            child: ListView.builder(
              itemCount: product.length,
              padding: EdgeInsets.all(10.0),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index){
                return Padding(
                  padding: EdgeInsets.all(3.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                product[index].name,
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ),
                        Image.asset(
                          product[index].imageUrl,
                          width: 100,
                        ),
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
