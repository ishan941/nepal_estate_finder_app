// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ListingModelImpl _$$ListingModelImplFromJson(Map<String, dynamic> json) =>
    _$ListingModelImpl(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      address: json['address'] as String?,
      regularPrice: (json['regularPrice'] as num?)?.toDouble(),
      discountPrice: (json['discountPrice'] as num?)?.toDouble(),
      bathrooms: (json['bathrooms'] as num?)?.toInt(),
      bedrooms: (json['bedrooms'] as num?)?.toInt(),
      furnished: json['furnished'] as bool?,
      parking: json['parking'] as bool?,
      type: json['type'] as String?,
      offer: json['offer'] as bool?,
      imageUrls: (json['imageUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      userRef: json['userRef'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$ListingModelImplToJson(_$ListingModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'address': instance.address,
      'regularPrice': instance.regularPrice,
      'discountPrice': instance.discountPrice,
      'bathrooms': instance.bathrooms,
      'bedrooms': instance.bedrooms,
      'furnished': instance.furnished,
      'parking': instance.parking,
      'type': instance.type,
      'offer': instance.offer,
      'imageUrls': instance.imageUrls,
      'userRef': instance.userRef,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
