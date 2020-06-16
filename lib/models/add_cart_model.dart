import 'package:json_annotation/json_annotation.dart';

part 'add_cart_model.g.dart';

@JsonSerializable()
class CardModel {
  final String price;
  final String color;
  final String size;
  final int qty;

  CardModel({
    this.price,
    this.color,
    this.size,
    this.qty,
  });
}

class AddCardModel {
  final String pro_id;
  final String user_id;
  final String username;
  final int qty;

  AddCardModel({
    this.pro_id,
    this.user_id,
    this.username,
    this.qty,
  });
  factory AddCardModel.fromJson(Map<String, dynamic> json) => _$AddCardModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddCardModelToJson(this);
}