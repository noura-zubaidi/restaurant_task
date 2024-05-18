import 'package:json_annotation/json_annotation.dart';
part 'categories.g.dart';

@JsonSerializable()
class TheCategories {
  List<Categories>? categories;

  TheCategories({this.categories});

  factory TheCategories.fromJson(Map<String, dynamic> json) =>
      _$TheCategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$TheCategoriesToJson(this);
}

@JsonSerializable()
class Categories {
  int? id;
  String? name;
  String? image;

  Categories({this.id, this.name, this.image});
  factory Categories.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFromJson(json);
  Map<String, dynamic> toJson() => _$CategoriesToJson(this);
}
