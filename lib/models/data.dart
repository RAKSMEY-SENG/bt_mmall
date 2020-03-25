
import 'package:btmmall/models/category.dart';
import 'package:btmmall/models/product.dart';


final Category babies = Category(id: 1, name: 'Babies & Toys', imageUrl: 'assets/images/babie.png');
final Category foods = Category(id: 2, name: 'Foods', imageUrl: 'assets/images/5.png');
final Category electronic = Category(id: 3, name: 'Electronic Accessories', imageUrl: 'assets/images/watch.png');
final Category beauty = Category(id: 4, name: 'Health & beauty', imageUrl: 'assets/images/11.png');
final Category lifeStye = Category(id: 5, name: 'Home & LifeStye', imageUrl: 'assets/images/6.png');
final Category travels = Category(id: 6, name: 'Sports & Travels', imageUrl: 'assets/images/7.png');
final Category man_care = Category(id: 7, name: 'Man Care', imageUrl: 'assets/images/8.png');
final Category man_fashion = Category(id: 7, name: 'Man Fashion', imageUrl: 'assets/images/9.png');
final Category women_fashion = Category(id: 7, name: 'Women Fashion', imageUrl: 'assets/images/10.png');
final Category pets = Category(id: 7, name: 'Pets', imageUrl: 'assets/images/pets.png');

List<Category> cate = [
  babies,
  foods,
  electronic,
  beauty,
  lifeStye,
  travels,
  man_care,
  man_fashion,
  women_fashion,
  pets,
];

final Product ipad = Product(id: 1, name: 'iPad pro 2020', imageUrl: 'assets/images/computer.png');
final Product beat_studio = Product(id: 2, name: 'Beat Studio3', imageUrl: 'assets/images/handsets.png');
final Product apple = Product(id: 3, name: 'Apple Watch Megnetic', imageUrl: 'assets/images/ice_watch.png');
final Product powerbeat = Product(id: 4, name: 'Powerbeats Pro', imageUrl: 'assets/images/12.png');

List<Product> product = [
  ipad,
  beat_studio,
  apple,
  powerbeat,
];

final NewProduct usb = NewProduct(id: 1, name: 'Danjeaner Spring 2019 Women Long Metallic', imageUrl: 'assets/images/3.png', price: '9.00');
final NewProduct phone = NewProduct(id: 2, name: 'Danjeaner Spring 2019 Women Long Metallic', imageUrl: 'assets/images/phone.png',price: '14.00');
final NewProduct shirt = NewProduct(id: 3, name: 'Danjeaner Spring 2019 Women Long Metallic', imageUrl: 'assets/images/skirt.png', price: '19.00');
final NewProduct flash = NewProduct(id: 4, name: 'Danjeaner Spring 2019 Women Long Metallic', imageUrl: 'assets/images/1.png', price: '12.00');
final NewProduct hot = NewProduct(id: 4, name: 'Danjeaner Spring 2019 Women Long Metallic', imageUrl: 'assets/images/2.png', price: '99.00');

List<NewProduct> newproduct = [
  usb,
  phone,
  shirt,
  flash,
  hot,
];

final ProductDiscount ipad_dis = ProductDiscount(id: 1, name: 'iPad pro 2020', imageUrl: 'assets/images/computer.png', price: '30.00');
final ProductDiscount beat_studio_dis = ProductDiscount(id: 2, name: 'Beat Studio3', imageUrl: 'assets/images/handsets.png', price: '29.00');
final ProductDiscount apple_dis = ProductDiscount(id: 3, name: 'Apple Watch Megnetic', imageUrl: 'assets/images/ice_watch.png', price: '50.00');
final ProductDiscount powerbeat_dis = ProductDiscount(id: 4, name: 'Powerbeats Pro', imageUrl: 'assets/images/12.png', price: '25.00');

List<ProductDiscount> disproduct = [
  ipad_dis,
  beat_studio_dis,
  apple_dis,
  powerbeat_dis,
];