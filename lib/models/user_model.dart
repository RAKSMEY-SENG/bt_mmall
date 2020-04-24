import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {

  String id;
  String user_login;
  String user_pass;
  String user_nicename;
  String user_email;
  String user_url;
  String user_registered;
  String user_activation_key;
  String user_status;
  String display_name;
  String description;
  String first_name;
  String last_name;
  String hide_in_members;

  UserModel({
    this.id,
    this.user_login,
    this.user_nicename,
    this.user_email,
    this.user_url,
    this.user_registered,
    this.user_activation_key,
    this.user_status,
    this.display_name,
    this.description,
    this.first_name,
    this.last_name,
    this.hide_in_members,
    this.user_pass,

  });
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}