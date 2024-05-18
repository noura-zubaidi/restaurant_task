// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'special_offers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpecialOffers _$SpecialOffersFromJson(Map<String, dynamic> json) =>
    SpecialOffers(
      specialOffers: (json['specialOffers'] as List<dynamic>?)
          ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecialOffersToJson(SpecialOffers instance) =>
    <String, dynamic>{
      'specialOffers': instance.specialOffers,
    };

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      image: json['image'] as String?,
      originalPrice: (json['originalPrice'] as num?)?.toInt(),
      discountPrice: (json['discountPrice'] as num?)?.toInt(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rating': instance.rating,
      'image': instance.image,
      'originalPrice': instance.originalPrice,
      'discountPrice': instance.discountPrice,
      'currency': instance.currency,
    };
