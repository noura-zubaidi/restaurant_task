
import 'package:json_annotation/json_annotation.dart';

part 'category.g.dart';
@JsonSerializable()
class Category{
  const Category({required this.categoryName, required this.categoryId, required this.categoryImg});
  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);

  final int categoryId;
  final String categoryName;
  final String categoryImg;
  Map<String, dynamic> toJson() => _$CategoryToJson(this);
}


