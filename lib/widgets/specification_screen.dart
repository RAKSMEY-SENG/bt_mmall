import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/material.dart';

class SpecificationScreen extends StatefulWidget {
  @override
  _SpecificationScreenState createState() => _SpecificationScreenState();
}

class _SpecificationScreenState extends State<SpecificationScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 700,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img3.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        )
    );
  }
}
