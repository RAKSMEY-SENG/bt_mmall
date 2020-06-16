class TopCategory {
  String id;
  String name;
  String img;
  String link;
  String datetime;

  TopCategory({this.id, this.name, this.img, this.link, this.datetime});

  TopCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    img = json['img'];
    link = json['link'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['img'] = this.img;
    data['link'] = this.link;
    data['datetime'] = this.datetime;
    return data;
  }
}