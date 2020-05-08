import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class AddCartModel extends Equatable {
  final String name;
  final String image;
  final int price;

  AddCartModel({this.name, this.price, this.image}) : super([name, price,image]);

  @override
  String toString() {
    return 'AddCartModel { name: $name, price: $price, image: $image }';
  }

}