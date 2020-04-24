import 'package:btmmall/models/product_model.dart';
import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {

  @override
  Widget build(BuildContext context) {
    final ProductModel data = ModalRoute.of(context).settings.arguments;
    return Container(
      child: Image.network(data.image,fit: BoxFit.cover,),
    );
  }
}
