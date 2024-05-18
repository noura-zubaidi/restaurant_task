import 'package:dio/dio.dart';
import 'package:resturant_task/model/special_offers.dart';
import 'package:retrofit/retrofit.dart';
part 'special_offers_services.g.dart';

@RestApi(baseUrl: 'https://mocki.io/v1')
abstract class WebServices {
  factory WebServices(Dio dio, {String baseUrl}) = _WebServices;

  @GET('/e1c0b794-d5e2-46d2-9809-57edd70bdeb4')
  Future<SpecialOffers> getOffers();
}
