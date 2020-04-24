import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SpecificationScreen extends StatefulWidget {
  @override
  _SpecificationScreenState createState() => _SpecificationScreenState();
}

class _SpecificationScreenState extends State<SpecificationScreen> {

  @override
  Widget build(BuildContext context) {
    final ProductModel data = ModalRoute.of(context).settings.arguments;
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 18,bottom: 18, left: 10, right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("Brand Name"),
                        new Text(":"),
                        Container(
                            width: 200,
                            child: new Text(data.name,)
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 0.3,child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(color: Colors.black12,),
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 18,bottom: 18, left: 10, right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("Control Button"),
                        new Text(":"),
                        Container(
                            width: 200,
                            child: new Text(data.name,)
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 0.3,child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(color: Colors.black12,),
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 18,bottom: 18, left: 10, right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("Communication"),
                        new Text(":"),
                        Container(
                            width: 200,
                            child: new Text(data.name,)
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 0.3,child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(color: Colors.black12,),
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 18,bottom: 18, left: 10, right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("Style"),
                        new Text(":"),
                        Container(
                            width: 200,
                            child: new Text(data.name,)
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 0.3,child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(color: Colors.black12,),
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 18,bottom: 18, left: 10, right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("Wireless Type"),
                        new Text(":"),
                        Container(
                            width: 200,
                            child: new Text(data.name,)
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 0.3,child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(color: Colors.black12,),
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 18,bottom: 18, left: 10, right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("Line Length"),
                        new Text(":"),
                        Container(
                            width: 200,
                            child: new Text(data.name,)
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 0.3,child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(color: Colors.black12,),
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 18,bottom: 18, left: 10, right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("Support Memory Card"),
                        new Text(":"),
                        Container(
                            width: 150,
                            child: new Text("Yes")
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 0.3,child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(color: Colors.black12,),
              ),),
              Padding(
                padding: const EdgeInsets.only(top: 18,bottom: 18, left: 10, right: 10),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text("Charging Case Capacity"),
                        new Text(":"),
                        Container(
                            width: 150,
                            child: new Text("2000mAh")
                        ),
                      ]
                  ),
                ),
              ),
              SizedBox(height: 0.3,child: Padding(
                padding: EdgeInsets.only(left: 10,right: 10),
                child: Container(color: Colors.black12,),
              ),),
            ],
          )
      ),
    );
  }
}
