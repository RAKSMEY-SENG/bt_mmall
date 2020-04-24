import 'package:btmmall/models/data.dart';
import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:btmmall/widgets/greate_discount_detail.dart';
import 'package:btmmall/widgets/orderdetail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shape_of_view/shape_of_view.dart';

class GreateDiscount extends StatefulWidget {
  @override
  _GreateDiscountState createState() => _GreateDiscountState();
}

class _GreateDiscountState extends State<GreateDiscount> {
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
                  'Greate Discount',
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
            height: 300,
            child: _listFutureTasks(context),
          ),
//          Padding(
//            padding: EdgeInsets.only(left: 8.0,right: 8.0),
//            child: Container(
//              height: 105.0,
//              color: Colors.grey[50],
//              child: Container(
//                child: Stack(
//                  children: <Widget>[
//                    Container(
//                      decoration: BoxDecoration(
//                        image: DecorationImage(
//                          image: AssetImage('assets/images/4.png'),
//                          fit: BoxFit.cover,
//                        ),
//                      ),
//                    )
//                  ],
//                ),
//              ),
//            ),
//          ),
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

  GridView _listTasks({BuildContext context, List<ProductModel> tasks}) {
    return  GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      padding: EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(5.0),
          child: ShapeOfView(
              shape: RoundRectShape(
                borderRadius: BorderRadius.circular(3),
                borderColor: Colors.white, //optional
                borderWidth: 2, //optional
              ),
              child: new InkWell(
                onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                  builder: (BuildContext context)=>new GreateDiscountDetail(),
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
                    shape: RoundRectShape(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(0),bottomRight: Radius.circular(20)),
                      borderWidth: 0, //optional
                      borderColor: Colors.transparent
                    ),
                    child: Container(
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                      ),
                      child: Text(
                        "-15"+'%',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                ),
                    Padding(
                      padding: EdgeInsets.only(top: 60,left: 55),
                      child: Text(
                        "\$"+"35",
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: Colors.orange,
                                fontSize: 10,
                                fontWeight: FontWeight.w600)),
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
