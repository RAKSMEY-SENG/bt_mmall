import 'dart:convert';
import 'package:btmmall/models/user.dart';
import 'package:btmmall/models/user_insert.dart';
import 'package:btmmall/services/api_response.dart';
import 'package:chopper/chopper.dart';
import 'package:http/http.dart' as http;

class Service {
  static const API = 'https://markarianmall.com';
  static const headers = {
//    'apiKey': '08d771e2-7c49-1789-0eaa-32aff09f1471',
    'Content-Type': 'application/json'
  };

  Future<APIResponse<User>> getuser(String noteID) {
    return http.get(API + '/web-service/functions2.php/' + noteID, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        print("response:"+data.body);
        return APIResponse<User>(data: User.fromJson(jsonData));
      }
      return APIResponse<User>(error: true, errorMessage: 'An error occured');
    })
        .catchError((_) => APIResponse<User>(error: true, errorMessage: 'An error occured'));
  }

  Future<APIResponse<bool>> putuser(UserInsert item) {
    return http.post(API + '/web-service/functions2.php', headers: headers, body: json.encode(item.toJson())).then((data) {
      print("Request : "+json.encode(item.toJson()));
      print("code status :"+data.statusCode.toString());
      if (data.statusCode == 201) {
        return APIResponse<bool>(data: true);
      }
      return APIResponse<bool>(error: true, errorMessage: 'An error occured');
    })
    .catchError((_) => APIResponse<bool>(error: true, errorMessage: 'An error occured'));
  }

}
