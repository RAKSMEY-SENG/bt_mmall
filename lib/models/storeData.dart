import 'dart:core';

import 'package:flutter/material.dart';

class StoreData {
//  Acts as a db to store the  name and price

  StoreData._privateConstructor();
  static final StoreData _instance = StoreData._privateConstructor();

  factory StoreData()
  {
    return _instance;
  }

  Map<String, dynamic> _ItemCart = Map<String, dynamic>();

  void storeItemCartDetails(String name, int price, String image)
  {
    print(name);
    print(price);
    print(image);
//    Store it as a key value pair
    _ItemCart[name] = price;
  print(_ItemCart);
  }

  void removeItemCartDetails(String name)
  {
    print("Remove Item Cart");
    _ItemCart.remove(name);
    print(_ItemCart);
  }

  Map<String, dynamic> retrieveItemCartDetails()
  {
    print(_ItemCart);
    return _ItemCart;
  }
}