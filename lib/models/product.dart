
class Product {
  final int id;
  final String name;
  final String imageUrl;

  Product({
    this.id,
    this.name,
    this.imageUrl,
  });
}

class NewProduct {
  final int id;
  final String name;
  final String imageUrl;
  final String price;

  NewProduct({
    this.id,
    this.name,
    this.imageUrl,
    this.price,
  });
}

class ProductDiscount {
  final int id;
  final String name;
  final String imageUrl;
  final String price;
  final String discount;

  ProductDiscount({
    this.id,
    this.name,
    this.imageUrl,
    this.price,
    this.discount,
  });
}
