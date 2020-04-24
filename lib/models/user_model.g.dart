part of 'user_model.dart';

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return UserModel(

    id: json['ID'] as String,
    user_login: json['user_login'] as String,
    user_nicename: json['user_nicename'] as String,
    user_registered: json['user_registered'] as String,
    user_url: json['user_url'] as String,
    user_email: json['user_email'] as String,
    user_activation_key: json['user_activation_key'] as String,
    user_status: json['user_status'] as String,
    description: json['description'] as String,
    display_name: json['display_name'] as String,
    hide_in_members: json['hide_in_members'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    user_pass: json['user_pass'] as String,
  );
}

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{

      'ID': instance.id,
      'user_login': instance.user_login,
      'user_pass': instance.user_pass,
      'user_nicename': instance.user_nicename,
      'user_registered': instance.user_registered,
      'user_url': instance.user_url,
      'user_email': instance.user_email,
      'user_activation_key': instance.user_activation_key,
      'user_status': instance.user_status,
      'display_name': instance.display_name,
      'description': instance.description,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'hide_in_members': instance.hide_in_members,
    };
