
import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/models/data.dart';
import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/screens/login_screen.dart';
import 'package:btmmall/widgets/overview_screen.dart';
import 'package:btmmall/widgets/review_screen.dart';
import 'package:btmmall/widgets/specification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'checkout_screen.dart';

class NewProductDetail extends StatefulWidget {
  @override
  _NewProductDetailState createState() => _NewProductDetailState();
}

class _NewProductDetailState extends State<NewProductDetail> {
  String username,password;
  SharedPreferences sharedPreferences;
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
    final ProductModel data = ModalRoute.of(context).settings.arguments;
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
            background: Image.network(data.image,fit: BoxFit.cover,)
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
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        data.name,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Container(
                              width: 160,
                              height: 50,
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
                                    icon: Icon(Icons.keyboard_arrow_up,size: 25,),
                                    iconSize: 20,
                                    color: Colors.black,
                                    onPressed: () {},
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
                                onTap: (){
                                  _ColorModalBottomSheet(context);
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Container(
                              width: 160,
                              height: 50,
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
                                    icon: Icon(Icons.keyboard_arrow_up,size: 25,),
                                    iconSize: 20,
                                    color: Colors.black,
                                    onPressed: () {},
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
                                onTap: (){
                                  _SizeModalBottomSheet(context);
                                },
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
                                  icon:  _selectIndex == 0?new Icon(Icons.image,color:  Colors.deepOrange): new Icon(Icons.image,color:  Colors.grey),
                                  title: Text('Overview'),
                                ),
                                new BottomNavigationBarItem(
                                  icon: _selectIndex == 1?new Icon(Icons.dashboard,color:  Colors.deepOrange): new Icon(Icons.dashboard,color:  Colors.grey),
                                  title: Text('Review'),
                                ),
                                new BottomNavigationBarItem(
                                  icon:  _selectIndex == 2?new Icon(Icons.insert_drive_file,color:  Colors.deepOrange): new Icon(Icons.insert_drive_file,color:  Colors.grey),
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
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Row(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              color: Colors.orangeAccent,
              child: Container(
                  child: LoginButton(
                    label: "Add To Cart",
                    background: Colors.transparent,
                    borderColor: Colors.transparent,
                    fontColor: Colors.white,
                    onTap: () async{
                      sharedPreferences = await SharedPreferences.getInstance();
                      if(sharedPreferences.getString("token") == null) {
                        //  Navigator.pop(context,true);
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => new LoginScreen()));
                      }else{
                        username = sharedPreferences.getString("username");
                        password = sharedPreferences.getString("password");
                        print("TOKEN : "+ username+password);
                      }
                    },
                  )
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/2,
              height: 50,
              color: Colors.redAccent,
              child: Container(
                child: LoginButton(
                  label: "Buy Now",
                  background: Colors.transparent,
                  borderColor: Colors.transparent,
                  fontColor: Colors.white,
                  onTap: () async{
                    sharedPreferences = await SharedPreferences.getInstance();
                    if(sharedPreferences.getString("token") == null) {
                      //  Navigator.pop(context,true);
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => new LoginScreen()));
                    }else{
                      username = sharedPreferences.getString("username");
                      password = sharedPreferences.getString("password");
                      print("TOKEN : "+ username+password);
                      Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context)=>new CheckOutScreen(),
                        settings: RouteSettings(),
                      ));
                    }
                  },
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
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc){
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: new Wrap(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Choose Color", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                    ),
                  ),
                  SizedBox(height: 0.5,child: Container(color: Colors.grey,),),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: getcolor.length,
                        itemBuilder: (BuildContext context, int index){
                          return Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: (){},
                              child: new Column(
                                children: <Widget>[
                                  Padding(
                                    padding: EdgeInsets.only(left: 30,top: 10,bottom: 10),
                                    child: Container(
                                      alignment: Alignment.centerLeft,
                                      child: Text(getcolor[index].colorname, style: TextStyle(fontSize: 18, color: Colors.black),),
                                    ),
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
            ),
          );
        }
    );
  }
  void _SizeModalBottomSheet(context){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc){
          return Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.white,
              ),
              child: new Wrap(
                children: <Widget>[

                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text("Choose Size", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),),
                    ),
                  ),
                  SizedBox(height: 0.5,child: Container(color: Colors.grey,),),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      itemCount: getsize.length,
                      itemBuilder: (BuildContext context, int index){
                        return Material(
                          color: Colors.white,
                          child: InkWell(
                            onTap: (){},
                            child: new Column(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 30,top: 10,bottom: 10),
                                  child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(getsize[index].prosize, style: TextStyle(fontSize: 18, color: Colors.black),),
                                  ),
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
            ),
          );
        }
    );
  }
}
