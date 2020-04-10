import 'dart:convert';

import 'package:btmmall/components/buttonLoginAnimation.dart';
import 'package:btmmall/components/customTextfield.dart';
import 'package:btmmall/models/user_insert.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/screens/home_screen.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:btmmall/services/service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:btmmall/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SignUpScreen extends StatefulWidget {

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  Service service;

  bool _isLoading = false;

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
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        )),
                        Text("Sign to continue",style: TextStyle(
                          color: Colors.grey,
                          fontSize: 25
                        )),
                        SizedBox(height: 40),
                        CustomTextField(
                          controller: etEmail,
                          label: "Email",
                        ),
                        SizedBox(height: 10),
                        CustomTextField(
                          controller: etPassword,
                          label: "Password",
                          isPassword: true,
                          icon: Icon(Icons.https, size: 27,color: Color(0xFFF032f41),),
                        ),
                        SizedBox(height: 40),
                        RaisedButton(
                          child: Text('Login', style: TextStyle(color: Colors.white)),
                          onPressed: () async {
//                            await Provider.of<ApiService>(context, listen : false)
//                                .putUser(etEmail.text.toString(),etPassword.text.toString());

//                          _signIn(etEmail.text.toString(), etPassword.text.toString());

                            final user = UserInsert(
                                username: etEmail.text.toString(),
                                password: etPassword.text.toString()
                            );
                            service = new Service();
                            final result = await service.putuser(user);

                            final title = 'Done';
                            final text = result.error ? (result.errorMessage ?? 'An error occurred') : 'Your note was created';

                            showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  title: Text(title),
                                  content: Text(text),
                                  actions: <Widget>[
                                    FlatButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                )
                            )
                                .then((data) {
                              if (result.data) {
                                setState(() {
                                  print("Respones : "+ result.data.toString());
                                });
                                Navigator.of(context).pop();
                              }
                            });
                          },
                        )
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
  _signIn(String email, String password) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'username': email,
      'psw': password
    };
    var jsonResponse = null;
    var response = await http.post("https://markarianmall.com/web-service/ws-login.php", body: data);
    print(data);
    if(response.statusCode == 201) {
      jsonResponse = json.encode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => ContentScreen()), (Route<dynamic> route) => false);
      }
    } else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}