import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AccountSceen extends StatefulWidget {
  @override
  _AccountSceenState createState() => _AccountSceenState();
}

class _AccountSceenState extends State<AccountSceen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            color: Colors.white
          ),
        ),
        title: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: Container(
              height: 40.0,
              child: TextField(
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.left,
                keyboardType: TextInputType.text,
                controller: null,
                decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black26,
                      )
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  contentPadding: EdgeInsets.all(16),
                  prefixIcon: IconButton(
                    icon: Image.asset(
                      "assets/images/black_search.png",
                      width: 20,
                    ),
                    iconSize: 20,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                  filled: true,
                  fillColor: Color.fromARGB(219,219, 219, 219 ),
                  enabledBorder: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(
                        width: 0,
                        color: Colors.white
                    ),
                  ),
                  suffixIcon: IconButton(
                    icon: Image.asset(
                      "assets/images/black_camera.png",
                      width: 20,
                    ),
                    iconSize: 20.0,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
              ),
            ),
          ),
        ),
        elevation: 0.0,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0),
            child: IconButton(
              icon: Image.asset(
                "assets/images/language.png",
                width: 24,
              ),
              iconSize: 24.0,
              color: Colors.white,
              onPressed: (){

              },
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 245.0, bottom: 10.0),
              child: Text(
                'Vireak',
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    '+(855) 78998755',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    '\$30.00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 60.0),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'My Order',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    IconButton(
                      icon: new Icon(Icons.arrow_forward_ios),
                      iconSize: 20.0,
                      color: Colors.black,
                      onPressed: (){

                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Change My Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    IconButton(
                      icon: new Icon(Icons.arrow_forward_ios),
                      iconSize: 20.0,
                      color: Colors.black,
                      onPressed: (){

                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Change My Address',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    IconButton(
                      icon: new Icon(Icons.arrow_forward_ios),
                      iconSize: 20.0,
                      color: Colors.black,
                      onPressed: (){

                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Change My Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    IconButton(
                      icon: new Icon(Icons.arrow_forward_ios),
                      iconSize: 20.0,
                      color: Colors.black,
                      onPressed: (){

                      },
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10.0),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                      ),
                    ),
                    IconButton(
                      icon: new Icon(Icons.arrow_forward_ios),
                      iconSize: 20.0,
                      color: Colors.black,
                      onPressed: (){

                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
