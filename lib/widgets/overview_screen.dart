import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/material.dart';

class OverviewScreen extends StatefulWidget {
  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img1.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img2.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img5.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          Container(
            height: 500,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/img4.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
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
