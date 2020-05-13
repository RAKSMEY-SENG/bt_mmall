import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:btmmall/models/user_model.dart';
import 'package:btmmall/screens/login_screen.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:btmmall/widgets/change_address_screen.dart';
import 'package:btmmall/widgets/change_password_screen.dart';
import 'package:btmmall/widgets/order_screen.dart';
import 'package:btmmall/widgets/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AccountSceen extends StatefulWidget {

  @override
  _AccountSceenState createState() => _AccountSceenState();
}

class _AccountSceenState extends State<AccountSceen> {

  String username,password;
  SharedPreferences sharedPreferences;
  ProgressDialog progressDialog;

  @override
  void initState() {
    super.initState();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if(sharedPreferences.getString("token") == null) {
//      Navigator.pop(context,true);
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => new LoginScreen()));
    }else{
      setState(() {
        username = sharedPreferences.getString("username");
        password = sharedPreferences.getString("password");
        print("TOKEN : "+ username+password);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                color: Colors.white
            ),
          ),
          title: Container(
            child: Container(
              height: 45.0,
              child: TextField(
                readOnly: true,
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
                    borderRadius: BorderRadius.all(Radius.circular(0)),
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
                onTap: (){
                  Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context)=>new SearchScreen(),
                    settings: RouteSettings(),
                  ));
                },
              ),
            ),
          ),
          elevation: 0.0,
          actions: <Widget>[
            IconButton(
              icon: Image.asset(
                "assets/images/language.png",
                width: 24,
              ),
              iconSize: 24.0,
              color: Colors.white,
              onPressed: (){

              },
            ),
          ],
        ),
        body: _futureUser(context)
    );
  }
  FutureBuilder _futureUser(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: Provider.of<ApiService>(context, listen: false).putUser(username,password),
      builder: (BuildContext context, AsyncSnapshot<UserModel> snapshot) {
        if(snapshot.connectionState == ConnectionState.done) {
          if(snapshot.hasError) {
            return Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
          final tasks = snapshot.data;
          return _userInfo(context: context, user: tasks);

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

  Widget _userInfo({BuildContext context, UserModel user}) {
    String url;
    if (user.user_url.isEmpty || user.user_url == null){
      url = "https://www.kindpng.com/picc/m/173-1731325_person-icon-png-transparent-png.png";
    }else{
      url = user.user_url;
    }
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25.0),
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
                    user.display_name,
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: new NetworkImage(url),
                    backgroundColor: Colors.black12,
                  ),
                ],
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
                    user.user_email,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Text(
                    '\$30.00',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(top: 50.0),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: <Widget>[
                    new ListTile(
                      title: Text("My Order",style: TextStyle(fontSize: 16,color: Colors.black),),
                      trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                      onTap: (){
                        Navigator.push(context, PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: OrderScreen()
                        ));
                      },
                    ),
                    SizedBox(height: 0.5,child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Container(color: Colors.black12,),
                    ),),
                    new ListTile(
                      title: Text("Change My Password",style: TextStyle(fontSize: 16,color: Colors.black),),
                      trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                      onTap: (){
                        Navigator.push(context, PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: CurrentPasswordScreen()
                        ));
                      },
                    ),
                    SizedBox(height: 0.5,child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Container(color: Colors.black12,),
                    ),),
                    new ListTile(
                      title: Text("Change My Address",style: TextStyle(fontSize: 16,color: Colors.black),),
                      trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                      onTap: (){
                        Navigator.push(context, PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: ChangeAddressScreen()
                        ));
                      },
                    ),
                    SizedBox(height: 0.5,child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Container(color: Colors.black12,),
                    ),),
                    new ListTile(
                      title: Text("Change My Profile",style: TextStyle(fontSize: 16,color: Colors.black),),
                      trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 20,),
                      onTap: (){

                      },
                    ),
                    SizedBox(height: 0.5,child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Container(color: Colors.black12,),
                    ),),
                    new ListTile(
                      title: Text("Log Out",style: TextStyle(fontSize: 16,color: Colors.black),),
                      onTap: (){
                        AwesomeDialog(
                          context: context,
                          animType: AnimType.SCALE,
                          dialogType: DialogType.INFO,
                          body: Center(child: Text(
                            'Are you sure want to logout?',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),),
                          tittle: 'This is Ignored',
                          desc:   'This is also Ignored',
                          btnCancelOnPress: (){},
                          btnOkOnPress: () async{
                            SharedPreferences mySPrefs = await SharedPreferences.getInstance();
                            mySPrefs.remove("token");
                            mySPrefs.clear();
                            _navigateToLogin();
                          },
                        ).show();
                      },
                    ),
                    SizedBox(height: 0.5,child: Padding(
                      padding: EdgeInsets.only(left: 10,right: 10),
                      child: Container(color: Colors.black12,),
                    ),),
                  ],
                )
            ),
          ],
        ),
      ),
    );
  }
  void _navigateToLogin(){
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => LoginScreen()
        )
    );
  }
}

