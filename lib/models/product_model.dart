import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ProductModel {
  int id;
  String name;
  String type;
  String url;
  CreatedDate createdDate;
  String slug;
  String image;

  ProductModel({this.id, this.name, this.type, this.url, this.createdDate, this.slug, this.image});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    url = json['url'];
    createdDate = json['created_date'] != null ? new CreatedDate.fromJson(json['created_date']) : null;
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['url'] = this.url;
    if (this.createdDate != null) {
    data['created_date'] = this.createdDate.toJson();
    }
    data['slug'] = this.slug;
    data['image'] = this.image;
    return data;
  }
}

class CreatedDate {
  String date;
  int timezoneType;
  String timezone;

  CreatedDate({this.date, this.timezoneType, this.timezone});

  CreatedDate.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['timezone_type'] = this.timezoneType;
    data['timezone'] = this.timezone;
    return data;
  }
}