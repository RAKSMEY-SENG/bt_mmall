import 'package:btmmall/models/data.dart';
import 'package:btmmall/widgets/orderdetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewProduct extends StatefulWidget {
  @override
  _NewProductState createState() => _NewProductState();
}

class _NewProductState extends State<NewProduct> {
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
                  'New Product',
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
              itemCount: newproduct.length,
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
                       new Material(
                          child: new InkWell(
                            onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context)=>new OrderDetail(),
                            ),
                            ),
                            child: new Column(
                              children: <Widget>[
                                Image.asset(
                                  newproduct[index].imageUrl,
                                  width: 100,
                                ),
                                Container(
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 5, right: 60),
                                        child: Stack(
                                          children: <Widget>[
                                            Text(
                                              "\$"+newproduct[index].price,
                                              style: GoogleFonts.openSans(
                                                  textStyle: TextStyle(
                                                      color: Colors.redAccent,
                                                      fontSize: 10,
                                                      fontWeight: FontWeight.w600)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
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
