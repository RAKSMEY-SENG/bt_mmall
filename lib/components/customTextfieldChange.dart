import 'package:flutter/material.dart';

class CustomTextFieldChange extends StatelessWidget {

  final String label;
  final Widget icon;
  final bool isPassword;
  final TextEditingController controller;

  const CustomTextFieldChange({Key key, this.label, this.icon, this.isPassword = false, this.controller}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
        style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold,fontSize: 16),
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: label,
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent)
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.redAccent)
            ),
          labelStyle: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold),
          suffixIcon: icon
        ),
        
    );
  }
}