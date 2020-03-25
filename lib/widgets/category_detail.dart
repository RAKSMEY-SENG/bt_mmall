import 'package:btmmall/widgets/just_for_you.dart';
import 'package:flutter/material.dart';

class CategoryDetail extends StatefulWidget {
  @override
  _CategoryDetailState createState() => _CategoryDetailState();
}

class _CategoryDetailState extends State<CategoryDetail> {
  static const _imageheiht = 220.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              left: 0,
              child: new Container(
                height: _imageheiht,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/slidedetail.png'),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Row(
                children: <Widget>[
                  FlatButton(
                    onPressed: () {},
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      child: Icon(
                        Icons.keyboard_backspace,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Spacer(),
                  FlatButton(
                    onPressed: () {},
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      child: Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Container(
                      width: 50.0,
                      height: 50.0,
                      child: Icon(
                        Icons.border_all,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  padding: EdgeInsets.only(top: _imageheiht),
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: new JustForYou(),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
