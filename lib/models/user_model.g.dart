part of 'user_model.dart';

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(

    username: json['username'] as String,
    password: json['pwd'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{

      'username': instance.username,
      'pwd': instance.password,

    };
