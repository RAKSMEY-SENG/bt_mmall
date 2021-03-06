import 'package:btmmall/models/category_model.dart';
import 'package:btmmall/models/top_category.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:btmmall/widgets/category_detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
            height: 300,
            child: _listFutureTasks(context)
          )
        ],
      ),
    );
  }
  FutureBuilder _listFutureTasks(BuildContext context) {
    return FutureBuilder<List<TopCategory>>(
      future: Provider.of<ApiService>(context, listen: false).getTopCategory(),
      builder: (BuildContext context, AsyncSnapshot<List<TopCategory>> snapshot) {
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

  GridView _listTasks({BuildContext context, List<TopCategory> tasks}) {
    return  GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: tasks.length,
      padding: EdgeInsets.all(8.0),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 1.0,
        mainAxisSpacing: 1.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        return new Container(
          child: new Column(
            children: <Widget>[
              new Hero(
                tag: tasks[index].name,
                child: new Material(
                  child: new InkWell(
                    onTap: ()=>Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context)=>new CategoryDetail(),
                    ),
                    ),
                    child: new Column(
                      children: <Widget>[
                        new Image.network(tasks[index].img, width: 50, height: 60,),
                        new Text(
                          tasks[index].name,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.0,
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
    );
  }
}
