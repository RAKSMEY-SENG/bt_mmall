import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  @override
  _ReviewScreenState createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/img4.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ],
        )
    );
  }
}
