part of 'add_cart_model.dart';

AddCardModel _$AddCardModelFromJson(Map<String, dynamic> json) {
  return AddCardModel(

    pro_id: json['product_id'] as String,
    user_id: json['user_id'] as String,
    username: json['username'] as String,
    qty: json['quantity'] as int,
  );
}

Map<String, dynamic> _$AddCardModelToJson(AddCardModel instance) => <String, dynamic>{

      'product_id': instance.pro_id,
      'user_id': instance.user_id,
      'username': instance.username,
      'quantity': instance.qty,

    };
