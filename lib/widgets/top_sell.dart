import 'package:btmmall/models/data.dart';
import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:btmmall/widgets/category_detail.dart';
import 'package:btmmall/widgets/orderdetail.dart';
import 'package:btmmall/widgets/top_sell_detail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view/shape_of_view.dart';


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
            child: _listFutureTasks(context),
          )
        ],
      ),
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
      padding: EdgeInsets.all(10.0),
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index){
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ShapeOfView(
              shape: RoundRectShape(
                borderRadius: BorderRadius.circular(5),
                borderColor: Colors.white, //optional
                borderWidth: 2, //optional
              ),
              child: new InkWell(
                onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=>new TopSellDetail(),
                  settings: RouteSettings(
                      arguments: tasks[index]),
                ),
                ),
                child: new Stack(
                  children: <Widget>[
                    Image.network(
                      tasks[index].image,
                      fit: BoxFit.cover,
                    ),
                    ShapeOfView(
                      shape: ArcShape(
                          direction: ArcDirection.Outside,
                          height: 10,
                          position: ArcPosition.Bottom
                      ),
                      child: Container(
                        width: 100,
                        height: 25,
                        color: Color.fromARGB(255,255, 204, 153),
                        child: Padding(
                          padding: EdgeInsets.only(top: 0),
                          child: Text(
                            tasks[index].name,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ),
        );
      },
    );
  }
}
