import 'dart:ui';
import 'package:btmmall/models/data.dart';
import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:btmmall/widgets/category_detail.dart';
import 'package:btmmall/widgets/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';


class CategoryScreen extends StatefulWidget {
  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.white
          ),
        ),
        title: Container(
          child: Container(
            height: 45.0,
            child: TextField(
              readOnly: true,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
              keyboardType: TextInputType.text,
              controller: null,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: GoogleFonts.openSans(
                    textStyle: TextStyle(
                      fontSize: 16,
                      color: Colors.black26,
                    )
                ),
                contentPadding: EdgeInsets.all(16),
                prefixIcon: IconButton(
                  icon: Image.asset(
                    "assets/images/black_search.png",
                    width: 20,
                  ),
                  iconSize: 20,
                  color: Colors.black,
                  onPressed: () {},
                ),
                filled: true,
                fillColor: Color.fromARGB(219,219, 219, 219 ),
                enabledBorder: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)),
                  borderSide: BorderSide(
                      width: 0,
                      color: Colors.white
                  ),
                ),
                suffixIcon: IconButton(
                  icon: Image.asset(
                    "assets/images/black_camera.png",
                    width: 20,
                  ),
                  iconSize: 20.0,
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=>new SearchScreen(),
                  settings: RouteSettings(),
                ));
              },
            ),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Image.asset(
              "assets/images/language.png",
              width: 24,
            ),
            iconSize: 24.0,
            color: Colors.white,
            onPressed: (){

            },
          ),
        ],
      ),
      body: _listFutureTasks(context),
//      body: Container(
//        child: Row(
//          children: <Widget>[
//            new Container(
//              width: 100,
//              color: Color.fromARGB(219,219, 219, 219 ),
//              child: ListView.builder(
//                primary: false,
//                itemCount: cate.length,
//                padding: EdgeInsets.only(right: 5),
//                itemBuilder: (BuildContext context, int index) {
//                  return new Container(
//                    child: new Column(
//                      children: <Widget>[
//                        new Hero(
//                          tag: cate[index].name,
//                          child: new Material(
//                            child: new InkWell(
//                              onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
//                                builder: (BuildContext context)=>new CategoryDetail(),
//                              ),
//                              ),
//                              child: new Column(
//                                children: <Widget>[
//                                  new Image.asset(cate[index].imageUrl),
//                                  new Text(
//                                    cate[index].name,
//                                    style: TextStyle(
//                                      color: Colors.black,
//                                      fontSize: 7.0,
//                                      fontWeight: FontWeight.w600,
//                                    ),
//                                  ),
//                                  SizedBox(height: 0.5,child: Container(color: Colors.black12,),),
//                                ],
//                              ),
//                            ),
//                          ),
//                        ),
//                      ],
//                    ),
//                  );
//                },
//              ),
//            ),
//            new Container(
//              width: MediaQuery.of(context).size.width-120,
//            ),
//          ],
//        ),
//      ),
    );
  }
  FutureBuilder _listFutureTasks(BuildContext context) {
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
          return _listTasks(context: context, tasks: tasks);

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

  ListView _listTasks({BuildContext context, List<ProductModel> tasks}) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: ListTile(
                leading: Image.network(tasks[index].image),
                title: Text(tasks[index].name),
              ),
            ),
          );
        });
  }
}
