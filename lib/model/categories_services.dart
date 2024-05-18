import 'package:dio/dio.dart';
import 'package:resturant_task/model/categories.dart';
import 'package:retrofit/retrofit.dart';
part 'categories_services.g.dart';

@RestApi(baseUrl: 'https://mocki.io/v1')
abstract class CategoriesServices {
  factory CategoriesServices(Dio dio, {String baseUrl}) = _CategoriesServices;

  @GET('/aa955cd0-853d-4c5e-91ba-7e55428baced')
  Future<TheCategories> getCategories();
}
