
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:btmmall/components/buttonLoginAnimation.dart';
import 'package:btmmall/components/customTextfield.dart';
import 'package:btmmall/screens/account_screen.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'content_screen.dart';

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  SharedPreferences prefs;
  ProgressDialog pr;
  TextEditingController etEmail = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/login.png"),
                fit: BoxFit.contain,
                alignment: Alignment.topCenter
              )
            ),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 20),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white,size:32),
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Icon(Icons.slow_motion_video, color: Colors.white,size: 32),
                              Text("32°", style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                              )),
                              Text("Sat, 3 Aug", style: TextStyle(
                                color: Colors.white,
                                fontSize: 12
                              ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 50),
                    height: MediaQuery.of(context).size.height * 0.70,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Welcome",style: TextStyle(
                          color: Color(0xFFF032f42),
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                        )),
                        Text("Sign to continue",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25
                        )),
                        SizedBox(height: 30),
                        CustomTextField(
                          controller: etEmail,
                          label: "Email",
                          icon: Icon(Icons.person, size: 27,color: Color(0xFFF032f41),),
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: etPassword,
                          label: "Password",
                          isPassword: true,
                          icon: Icon(Icons.https, size: 27,color: Color(0xFFF032f41),),
                        ),
                        SizedBox(height: 25),
                        ButtonLoginAnimation(
                          label: "Login",
                          background: Colors.cyan,
                          fontColor: Colors.white,
                          borderColor: Colors.white,
                          onTap: () async {
                            pr = new ProgressDialog(context);
                            pr.update(
                              progress: 40.0,
                              message: "Please wait...",
                              progressWidget: Container(
                                  padding: EdgeInsets.all(8.0), child: CircularProgressIndicator()),
                              maxProgress: 100.0,
                              progressTextStyle: TextStyle(
                                  color: Colors.black, fontSize: 9.0, fontWeight: FontWeight.w400),
                              messageTextStyle: TextStyle(
                                  color: Colors.black, fontSize: 14.0, fontWeight: FontWeight.w600),
                            );
                            await pr.show();
                            await Provider.of<ApiService>(context, listen: false).putUser(etEmail.text.toString(), etPassword.text.toString()).then((it) async {
                              prefs = await SharedPreferences.getInstance();
                              await prefs.setString('username', it.user_email);
                              await prefs.setString('password', etPassword.text.toString());
                              await prefs.setString('token', it.toString());
                              _navigateToHome(it.id);
                            }).catchError((onError){
                              pr.hide();
                              AwesomeDialog(
                                context: context,
                                animType: AnimType.SCALE,
                                dialogType: DialogType.INFO,
                                body: Center(child: Text(
                                  'Please try again!!',
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),),
                                tittle: 'This is Ignored',
                                desc:   'This is also Ignored',
                                btnOkOnPress: () async{},
                              ).show();
                            });
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  void _navigateToHome(String id){
    pr.hide();
    Navigator.pop(context,true);// close button arrow back
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => ContentScreen(),
          settings: RouteSettings(name: id)),
    );
  }
}