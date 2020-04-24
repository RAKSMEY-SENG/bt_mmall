import 'package:btmmall/models/data.dart';
import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:btmmall/widgets/new_product_detail.dart';
import 'package:btmmall/widgets/orderdetail.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view/shape_of_view.dart';

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
              builder: (BuildContext context)=>new NewProductDetail(),
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
                    elevation: 4,
                    height: 20,
                    shape: DiagonalShape(
                        position: DiagonalPosition.Bottom,
                        direction: DiagonalDirection.Left,
                        angle: DiagonalAngle.deg(angle: 15)
                    ),
                    child:  Container(
                      color: Colors.lime,
                      child: Text(
                        "\$"+"50.00",
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
          )
          ),
        );
      },
    );
  }
}
