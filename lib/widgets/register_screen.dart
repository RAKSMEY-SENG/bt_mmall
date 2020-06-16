import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:btmmall/components/customTextfieldChange.dart';
import 'package:btmmall/components/trackingButton.dart';
import 'package:btmmall/screens/content_screen.dart';
import 'package:btmmall/services/api_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenScreenState createState() => _RegisterScreenScreenState();
}

class _RegisterScreenScreenState extends State<RegisterScreen> {
  String username,password;
  bool isChecked = false;
  TextEditingController etPhone = new TextEditingController();
  TextEditingController etPassword = new TextEditingController();
  SharedPreferences prefs;
  ProgressDialog pr;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              color: Colors.redAccent
          ),
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(top: 50,left: 20,right: 20),
          child: Center(
            child: Column(
              children: <Widget>[
                CircleAvatar(
                  radius: 40,
                  backgroundImage: new NetworkImage("https://www.dlf.pt/png/big/26/269839_cell-phone-icon-png.png"),
                  backgroundColor: Colors.black12,
                ),
                SizedBox(height: 10),
                Text("Phone Number",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                CustomTextFieldChange(
                  controller: etPhone,
                  label: "Enter your phone number",
                  isPassword: true,
                  icon: Icon(Icons.phone, size: 20),
                ),
                SizedBox(height: 20),
                CustomTextFieldChange(
                  controller: etPassword,
                  label: "Enter your password",
                  isPassword: true,
                  icon: Icon(Icons.remove_red_eye, size: 20),
                ),
                SizedBox(height: 20),
                Container(
                  height: 50,
                  child: TrackingButton(
                    label: "Submit",
                    background: Colors.redAccent,
                    borderColor: Colors.white,
                    fontColor: Colors.white,
                    onTap: () async {
                      pr = new ProgressDialog(context,isDismissible: false);
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
                      await Provider.of<ApiService>(context, listen: false).Register(etPhone.text.toString(), etPassword.text.toString()).then((it) async {
                        prefs = await SharedPreferences.getInstance();
                        await prefs.setString('username', it.display_name);
                        await prefs.setString('photo', it.user_url);
                        await prefs.setString('token', it.toString());
                        _navigateToHome(it.id);
                      }).catchError((onError){
                        pr.hide();
                        AwesomeDialog(
                          context: context,
                          dismissOnTouchOutside: false,
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
                )
              ],
            )
          ),
        ),
      ),
    );
  }
  void _navigateToHome(String id){
    pr.hide();
    Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => ContentScreen()), (Route<dynamic> route) => false);
  }
}