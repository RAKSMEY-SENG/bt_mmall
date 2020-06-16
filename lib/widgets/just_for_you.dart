import 'package:btmmall/components/loginButton.dart';
import 'package:btmmall/homebloc/bloc.dart';
import 'package:btmmall/homebloc/homebloc_bloc.dart';
import 'package:btmmall/models/add_cart_model.dart';
import 'package:btmmall/models/data.dart';
import 'package:btmmall/models/addproduct_model.dart';
import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/screens/login_screen.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:btmmall/widgets/orderdetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'checkout_screen.dart';

class JustForYou extends StatefulWidget {
  @override
  _JustForYouState createState() => _JustForYouState();
}

class _JustForYouState extends State<JustForYou> {

  String username,password;
  SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    HomeblocBloc homeblocBloc = BlocProvider.of<HomeblocBloc>(context);
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Just For You',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.0,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: _listFutureTasks(context,homeblocBloc),
          )
        ],
      ),
    );
  }
  FutureBuilder _listFutureTasks(BuildContext context,HomeblocBloc homeblocBloc) {
    return FutureBuilder<List<ProductModel>>(
      future: Provider.of<ApiService>(context, listen: false).getProduct(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductModel>> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError) {
            return Container(
              child: Center(
                child: Text("No Result"),
              ),
            );
          }
          final tasks = snapshot.data;
          return _listTasks(context: context, tasks: tasks,homeblocBloc: homeblocBloc);

        } else {
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }

  GridView _listTasks({BuildContext context, List<ProductModel> tasks, HomeblocBloc homeblocBloc}) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      padding: EdgeInsets.all(10.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.all(2.0),
          child: GridTile(
            child: Image.network(tasks[index].image),
            footer: GridTileBar(
              backgroundColor: Colors.black38,
              title: Center(child: Text(tasks[index].name)),
              leading: Text("\$245",style: TextStyle(color: Colors.white),),
              trailing: IconButton(
                icon: Image.asset(
                  "assets/images/cart.png",
                  width: 20,
                ),
                iconSize: 20.0,
                onPressed: () {
                  _AddToCartBottomSheet(context: context, tasks: AddCartModel(name:tasks[index].name, price: 245,image: tasks[index].image), homeblocBloc: homeblocBloc);
                  },
              ),
            ),
          ),
//          child: Card(
//            child: new InkWell(
//              onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
//                builder: (BuildContext context)=>new OrderDetail(),
//                settings: RouteSettings(
//                arguments: tasks[index]),
//              ),
//              ),
//              child: new Column(
//                children: <Widget>[
//                  Container(
//                      height: 80,
//                      width: 60,
//                      child: Image.network(
//                        tasks[index].image,
//                        fit: BoxFit.cover,
//                      )
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(left: 7),
//                    child: Container(
//                      height: 27,
//                      child: Text(
//                        tasks[index].name,
//                        textAlign: TextAlign.left,
//                        style: GoogleFonts.openSans(
//                            textStyle: TextStyle(
//                                color: Colors.black,
//                                fontSize: 10,
//                                fontWeight: FontWeight.w600)),
//                      ),
//                    ),
//                  ),
//                  Padding(
//                    padding: EdgeInsets.only(left: 10,right: 10),
//                    child: Container(
//                      child: Row(
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          Container(
//                            child: Stack(
//                              children: <Widget>[
//                                Text(
//                                  "\$"+"35.00",
//                                  style: GoogleFonts.openSans(
//                                      textStyle: TextStyle(
//                                          color: Colors.black,
//                                          fontSize: 10,
//                                          fontWeight: FontWeight.w600)),
//                                ),
//                              ],
//                            ),
//                          ),
//                          Container(
//                            child: IconButton(
//                              icon: Image.asset(
//                                "assets/images/ic_cart.png",
//                                width: 20,
//                              ),
//                              iconSize: 20.0,
//                              color: Colors.white,
//                              onPressed: () {
//                                _AddToCartBottomSheet(context: context, tasks: tasks[index]);
//                              },
//                            ),
//                          )
//                        ],
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            ),
//          )
        );
      },
    );
  }
  Widget _AddToCartBottomSheet({BuildContext context, AddCartModel tasks,HomeblocBloc homeblocBloc}){
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext bc){
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: new Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topRight: Radius.circular(20), topLeft: Radius.circular(20)),
                color: Colors.white,
              ),
              child: new Wrap(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                        alignment: Alignment.center,
                        child: Icon(Icons.linear_scale,color: Colors.grey,)
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                        height: 60,
                        child: ListTile(
                          leading: Image.network(tasks.image),
                          title: Text(tasks.name),
                        )
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: <Widget>[
                        Container(
                            padding: EdgeInsets.only(left: 15,right: 5),
                            width: MediaQuery.of(context).size.width/2,
                            child: Column(
                              children: <Widget>[
                                Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text("Color")
                                ),
                                TextField(
                                  readOnly: true,
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.left,
                                  keyboardType: TextInputType.text,
                                  controller: null,
                                  decoration: InputDecoration(
                                    hintText: "Please Select",
                                    hintStyle: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        )
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.keyboard_arrow_up,size: 25,),
                                      iconSize: 14,
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
                              ],
                            )
                        ),
                        Container(
                            padding: EdgeInsets.only(left: 15,right: 5),
                            width: MediaQuery.of(context).size.width/2,
                            child: Column(
                              children: <Widget>[
                                Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("Size"),
                                ),
                                TextField(
                                  readOnly: true,
                                  style: TextStyle(color: Colors.white),
                                  textAlign: TextAlign.left,
                                  keyboardType: TextInputType.text,
                                  controller: null,
                                  decoration: InputDecoration(
                                    hintText: "Please Select",
                                    hintStyle: GoogleFonts.openSans(
                                        textStyle: TextStyle(
                                          fontSize: 10,
                                          color: Colors.black,
                                        )
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    contentPadding: EdgeInsets.all(10),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.keyboard_arrow_up,size: 25,),
                                      iconSize: 14,
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
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 0.2,child: Container(color: Colors.grey,padding: EdgeInsets.all(15))),
                  Container(
                      padding: EdgeInsets.only(left: 15,right: 5),
                      alignment: Alignment.centerLeft,
                      child: Text("Quanity")
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15,right: 5),
                    width: MediaQuery.of(context).size.width/2,
                    child: TextField(
                      readOnly: true,
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.left,
                      keyboardType: TextInputType.text,
                      controller: null,
                      decoration: InputDecoration(
                        hintText: "Please Select",
                        hintStyle: GoogleFonts.openSans(
                            textStyle: TextStyle(
                              fontSize: 10,
                              color: Colors.black,
                            )
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        contentPadding: EdgeInsets.all(10),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.keyboard_arrow_up,size: 25,),
                          iconSize: 14,
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
                      },
                    ),
                  ),
                  SizedBox(height: 0.1,child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(color: Colors.grey,),
                  ),),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              height: 45,
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
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (BuildContext context) => new LoginScreen()));
                      }else{
                        homeblocBloc.add(HomeBlocAddEvent(
                            AddCartModel(
                                name:tasks.name,
                                price: tasks.price,
                                image: tasks.image
                            )));
                          Navigator.of(context).pushReplacement(new MaterialPageRoute(
                          builder: (BuildContext context)=>new CheckOutScreen(),
                          settings: RouteSettings(arguments: CardModel(price: tasks.price.toString(), color: "blue", size: "10m", qty: 1)),
                        ),
                        );
                      }
                    },
                  )
              ),
            ),
          );
        }
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
