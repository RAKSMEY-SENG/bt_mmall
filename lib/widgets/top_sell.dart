import 'package:btmmall/models/data.dart';
import 'package:btmmall/widgets/category_detail.dart';
import 'package:btmmall/widgets/orderdetail.dart';
import 'package:flutter/cupertino.dart';
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
                        new Hero(
                          tag: product[index].name,
                          child: new Material(
                            child: new InkWell(
                              onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                                builder: (BuildContext context)=>new OrderDetail(),
                              ),
                              ),
                              child: new Column(
                                children: <Widget>[
                                  Container(
                                    child: Stack(
                                      children: <Widget>[
                                        Container(
                                          width: 100,
                                          height: 26,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(1)),
                                          child: Container(
                                            width: 100,
                                            height: 15,
                                            padding: EdgeInsets.only(top: 5),
                                            decoration: BoxDecoration(
                                                color: Color.fromARGB(255,255, 204, 153),
                                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25))),
                                            child: Text(
                                              product[index].name,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w600)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Image.asset(
                                    product[index].imageUrl,
                                    width: 90,
                                  ),
                                ],
                              ),
                            ),
                          ),
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
