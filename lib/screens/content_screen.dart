import 'package:btmmall/screens/account_screen.dart';
import 'package:btmmall/screens/cart_screen.dart';
import 'package:btmmall/screens/category_screen.dart';
import 'package:btmmall/screens/home_screen.dart';
import 'package:custom_progress_dialog/custom_progress_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class ContentScreen extends StatefulWidget {
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {

  ProgressDialog _progressDialog = ProgressDialog();
  int _selectIndex = 0;
  Widget CallPage(int index){
    switch(index){
      case 0: return HomeScreen();
      case 1: return CategoryScreen();
      case 2: return CartScreen();
      case 3: return AccountSceen();
        break;
        default: return HomeScreen();
    }
  }
  @override
  void initState(){
    super.initState();
    _progressDialog.showProgressDialog(context,dismissAfter: Duration(milliseconds: 1500),textToBeDisplayed:'Loading...',onDismiss:(){
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CallPage(_selectIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        currentIndex: _selectIndex,
        onTap: (value){
          _selectIndex = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        items:[
          new BottomNavigationBarItem(
            icon:  _selectIndex == 0?new Icon(Icons.home,color:  Colors.redAccent): new Icon(Icons.home,color:  Colors.black),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            icon: _selectIndex == 1?new Icon(Icons.dashboard,color:  Colors.redAccent): new Icon(Icons.dashboard,color:  Colors.black),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            icon:  _selectIndex == 2?new Icon(Icons.shopping_cart,color:  Colors.redAccent): new Icon(Icons.shopping_cart,color:  Colors.black),
            title: Text(''),
          ),
          new BottomNavigationBarItem(
            icon:  _selectIndex == 3?new Icon(Icons.person,color:  Colors.redAccent): new Icon(Icons.person,color:  Colors.black),
            title: Text(''),
          ),
        ],
      ),
    );
  }
}
