import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/material.dart';

class OrderDetail extends StatefulWidget {
  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  custom() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Colors.redAccent,
          expandedHeight: 200.0,
          floating: false,
          pinned: true,
          actions: <Widget>[
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
            IconButton(
              icon: Icon(Icons.border_all),
              iconSize: 24.0,
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
            background: Image.asset(
              "assets/images/slidedetail.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
                (context, index) => JustForYou()
          ),
        ),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: custom(),
    );
  }
}
