import 'package:flutter/foundation.dart';

class UserInsert {
  String username;
  String password;

  UserInsert(
    {
      @required this.username,
      @required this.password,
    }
  );

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "pwd": password
    };
  }
}