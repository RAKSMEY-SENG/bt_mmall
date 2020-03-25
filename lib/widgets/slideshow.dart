import 'package:flutter/material.dart';

class SlideShow extends StatefulWidget {
  @override
  _SlideShowState createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/sl_background.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.0),
            image: DecorationImage(
              image: AssetImage('assets/images/slide.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
