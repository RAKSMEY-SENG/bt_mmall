import 'package:btmmall/animations/fadeAnimation.dart';
import 'package:btmmall/checkout/checkout_bloc.dart';
import 'package:btmmall/checkout/checkout_event.dart';
import 'package:btmmall/checkout/checkout_state.dart';
import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:btmmall/widgets/sucess_order_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ConfirmOrder extends StatelessWidget {

  ConfirmOrder({Key key}) : super(key: key);

  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider<CheckoutBloc>(
      create: (context)=> CheckoutBloc(),
      child: _ConfirmOrderState(),
    );
  }
}

class _ConfirmOrderState extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = ModalRoute.of(context).settings.arguments;
    int total = 0;
    data.forEach((k,v)=>total=total+v);
        return Scaffold(
          backgroundColor: Color(0xFF7014B71),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0.0,
          ),
          body: Column(
            children: <Widget>[
              Text("ORDER SUMMARY",style: TextStyle(color: Colors.white,fontSize: 18)),
              Container(
                padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                height: MediaQuery.of(context).size.height-200,
                child: ListView.builder(
                    itemCount: data.keys.length,
                    itemBuilder: (BuildContext context, int count) {
                      String key = data.keys.elementAt(count);
                      return Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.only(top: 10,bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(key,style: TextStyle(color: Colors.white)),
                                Text("QTY1",style: TextStyle(color: Colors.white)),
                                Text("\$"+data[key].toString(),style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ),
                          SizedBox(child: Container(height: 1, color: Colors.white,)),
                        ],
                      );
                    }),
              ),
              Container(
                padding: EdgeInsets.only(top: 10,right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("",style: TextStyle(color: Colors.white)),
                    Text("TOTAL",style: TextStyle(color: Colors.white)),
                    Text("\$"+total.toString(),style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
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
                    label: "CONFIRM ORDER",
                    background: Colors.transparent,
                    borderColor: Colors.transparent,
                    fontColor: Colors.white,
                    onTap: () async{
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context)=>new SuccessOrderScreen(),
                        settings: RouteSettings(),
                      ),
                      );
                    },
                  )
              ),
            ),
          ),
        );
      }
  }
