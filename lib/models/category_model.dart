import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CategoryModel {
  int termId;
  String name;
  String slug;
  int termGroup;
  int termTaxonomyId;
  String taxonomy;
  String description;
  int parent;
  int count;
  String filter;
  String image;

  CategoryModel(
      {this.termId,
        this.name,
        this.slug,
        this.termGroup,
        this.termTaxonomyId,
        this.taxonomy,
        this.description,
        this.parent,
        this.count,
        this.filter,
        this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    termId = json['term_id'];
    name = json['name'];
    slug = json['slug'];
    termGroup = json['term_group'];
    termTaxonomyId = json['term_taxonomy_id'];
    taxonomy = json['taxonomy'];
    description = json['description'];
    parent = json['parent'];
    count = json['count'];
    filter = json['filter'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['term_id'] = this.termId;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['term_group'] = this.termGroup;
    data['term_taxonomy_id'] = this.termTaxonomyId;
    data['taxonomy'] = this.taxonomy;
    data['description'] = this.description;
    data['parent'] = this.parent;
    data['count'] = this.count;
    data['filter'] = this.filter;
    data['image'] = this.image;
    return data;
  }
}