
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
class GetColor {
  final int id;
  final String colorname;

  GetColor({
    this.id,
    this.colorname
  });

}

class GetSize {
  final int id;
  final String prosize;

  GetSize({
    this.id,
    this.prosize
  });

}