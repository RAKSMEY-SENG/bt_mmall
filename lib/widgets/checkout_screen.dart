import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/checkout/checkout_bloc.dart';
import 'package:btmmall/checkout/checkout_event.dart';
import 'package:btmmall/checkout/checkout_state.dart';
import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/models/add_cart_model.dart';
import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/widgets/confirm_order_screen.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_counter/flutter_counter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CheckOutScreen extends StatelessWidget {

  CheckOutScreen({Key key}) : super(key: key);

  @override
  _CheckOutScreenState createState() => _CheckOutScreenState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider<CheckoutBloc>(
      create: (context)=> CheckoutBloc(),
      child: _CheckOutScreenState(),
    );
  }
}

class _CheckOutScreenState extends StatelessWidget {
  String username,password;
  SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) {
    CheckoutBloc _checkoutBloc = BlocProvider.of<CheckoutBloc>(context);
    int total = 0;
    _checkoutBloc.add(LoadItemsEvent());
    Map<String, dynamic> _item = Map<String,dynamic>();
    CardModel data = ModalRoute.of(context).settings.arguments;
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      builder: (context, state){
        if(state is ItemsLoadedState) {
          print(state.itemCart);
          _item = state.itemCart;
//          _item.forEach((k,v)=>total=total+v);
        }
        return Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(
                  color: Colors.redAccent
              ),
            ),
            title: Center(
              child: Text(
                'CART',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            elevation: 0.0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.delete),
                iconSize: 24.0,
                color: Colors.white,
                onPressed: (){

                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height-135,
                  child: ListView.builder(
                      itemCount: _item.keys.length,
                      itemBuilder: (BuildContext context, int count) {
                        String key = _item.keys.elementAt(count);
                        String price = _item[key].toString();
                        return Column(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(top: 10,bottom: 10),
                                color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 5, bottom: 5),
                                  child: Column(
                                    children: <Widget>[
                                      SizedBox(child: Container(height: 1,color: Colors.grey[200])),
                                      SizedBox(
                                          child: Padding(
                                            padding: EdgeInsets.only(top: 5,bottom: 5),
                                            child: Row(
                                              children: <Widget>[
                                                CheckboxWidget(),
                                                Container(
                                                  height: 90,
                                                  width: 85,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(3.0),
                                                    image: DecorationImage(
                                                      image: NetworkImage(price),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.only(left: 5),
                                                  child: Container(
                                                      height: 100,
                                                      child: Column(
                                                        children: <Widget>[
                                                          Container(
                                                              height: 50,
                                                              child: Column(
                                                                children: <Widget>[
                                                                  Container(
                                                                    child: Text(key),
                                                                    width: 220,
                                                                  ),
                                                                  Container(
                                                                    width: 220,
                                                                    padding: EdgeInsets.only(top: 2),
                                                                    child: Text("\$"+data.price,style: TextStyle(color: Colors.orange)),
                                                                  ),
                                                                ],
                                                              )
                                                          ),
                                                          Container(
                                                            height: 50,
                                                            padding: EdgeInsets.only(top: 5),
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: <Widget>[
                                                                Container(
                                                                    height: 50,
                                                                    width: 110,
                                                                    child: Column(
                                                                      children: <Widget>[
                                                                        Container(
                                                                          width: 110,
                                                                          child: Text("Color: "+data.color),
                                                                        ),
                                                                        Container(
                                                                          padding: EdgeInsets.only(top: 2),
                                                                          width: 110,
                                                                          child: Text("Size: "+data.size),
                                                                        ),
                                                                      ],
                                                                    )
                                                                ),
                                                                Container(
                                                                  height: 40,
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: <Widget>[
                                                                      CountItem(),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                      ),
                                      SizedBox(child: Container(height: 1,color: Colors.grey[200])),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                      }),
                ),
//                SizedBox(child: Container(height: 7,color: Colors.grey[300])),
//                Container(
//                  height: 70,
//                  padding: EdgeInsets.only(left: 10,right: 10),
//                  child: new Row(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Padding(
//                            padding: EdgeInsets.only(left: 10),
//                            child: new Icon(Icons.credit_card),
//                          ),
//                          Padding(
//                            padding: EdgeInsets.only(top: 20,left: 15),
//                            child: Column(
//                              crossAxisAlignment: CrossAxisAlignment.start,
//                              children: <Widget>[
//                                Container(
//                                  margin: EdgeInsets.only(right: 37),
//                                  child: new Text("Cash on Delivery",style: TextStyle(color: Color(0xFF0000b3),fontSize: 12)),
//                                ),
//                                Container(
//                                  margin: EdgeInsets.only(top: 2),
//                                  child: new Text("Pay with cash when you receive your products",style: TextStyle(color: Colors.black87,fontSize: 10)),
//                                ),
//                              ],
//                            ),
//                          ),
//                        ],
//                      ),
//                      new Text("CHANGE",style: TextStyle(color: Colors.redAccent,fontSize: 14),)
//                    ],
//                  ),
//                ),
//                SizedBox(child: Container(height: 7,color: Colors.grey[300])),
//                Container(
//                  height: MediaQuery.of(context).size.height,
//                  padding: EdgeInsets.only(top: 10),
//                  color: Colors.white,
//                  child: Column(
//                    children: <Widget>[
//
//                    ],
//                  ),
//                ),
              ],
            ),
          ),
          bottomNavigationBar: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Container(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              color: Color(0xFFFF5757),
              child: Container(
                  child: LoginButton(
                    label: "CHECK OUT",
                    background: Colors.transparent,
                    borderColor: Colors.transparent,
                    fontColor: Colors.white,
                    onTap: () async{
                      Navigator.of(context).pushReplacement(new MaterialPageRoute(
                        builder: (BuildContext context)=>new ConfirmOrder(),
                        settings: RouteSettings(arguments: _item),
                        ),
                      );
                    },
                  )
              ),
            ),
          ),
        );
      },
    );
  }
}
class CheckboxWidget extends StatefulWidget {
  @override
  CheckboxWidgetClass createState() => new CheckboxWidgetClass();
}
class CheckboxWidgetClass extends State {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Checkbox(
      value: isChecked,
      activeColor: Colors.redAccent,
      onChanged: (value) {
        setState(() {
          isChecked = value;
        });
      },
    );
  }
}
class CountItem extends StatefulWidget {
  @override
  CountItemClass createState() => new CountItemClass();
}
class CountItemClass extends State {
  int _counter = 0;
  int _defaultValue = 0;

  @override
  Widget build(BuildContext context) {
    return Counter(
      initialValue: _defaultValue,
      minValue: 0,
      maxValue: 10,
      color: Colors.grey,
      step: 1,
      decimalPlaces: 0,
      onChanged: (value) {
        setState(() {
          _defaultValue = value;
          _counter = value;
        });
      },
    );
  }
}
