import 'package:json_annotation/json_annotation.dart';
part 'special_offers.g.dart';

@JsonSerializable()
class SpecialOffers {
  List<Offer>? specialOffers;

  SpecialOffers({this.specialOffers});

  factory SpecialOffers.fromJson(Map<String, dynamic> json) =>
      _$SpecialOffersFromJson(json);
  Map<String, dynamic> toJson() => _$SpecialOffersToJson(this);
}

@JsonSerializable()
class Offer {
  int? id;
  String? name;
  double? rating;
  String? image;
  int? originalPrice;
  int? discountPrice;
  String? currency;

  Offer(
      {this.id,
      this.name,
      this.rating,
      this.image,
      this.originalPrice,
      this.discountPrice,
      this.currency});

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
  Map<String, dynamic> toJson() => _$OfferToJson(this);
}
