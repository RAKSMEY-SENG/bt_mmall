import 'package:btmmall/widgets/category_detail.dart';
import 'package:flutter/material.dart';
import 'package:btmmall/models/data.dart';

class PopularCategory extends StatefulWidget {
  @override
  _PopularCategoryState createState() => _PopularCategoryState();
}

class _PopularCategoryState extends State<PopularCategory> {
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
                  'Popular Categories',
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
            height: 165.0,
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: cate.length,
              padding: EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 5,
                crossAxisSpacing: 1.0,
                mainAxisSpacing: 5.0,
              ),
              itemBuilder: (BuildContext context, int index) {
                return new Container(
                    child: new Column(
                      children: <Widget>[
                        new Hero(
                            tag: cate[index].name,
                            child: new Material(
                              child: new InkWell(
                                onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                                    builder: (BuildContext context)=>new CategoryDetail(),
                                  ),
                                ),
                                child: new Column(
                                  children: <Widget>[
                                    new Image.asset(cate[index].imageUrl,fit: BoxFit.cover,),
                                    new Text(
                                      cate[index].name,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 7.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ),
                      ],
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
