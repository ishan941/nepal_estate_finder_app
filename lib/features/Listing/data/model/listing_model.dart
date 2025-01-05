import 'package:freezed_annotation/freezed_annotation.dart';

part 'listing_model.freezed.dart';
part 'listing_model.g.dart';

@freezed
class ListingModel with _$ListingModel {
  const factory ListingModel({
    @JsonKey(name: '_id') String? id,
    String? name,
    String? description,
    String? address,
    double? regularPrice,
    double? discountPrice,
    int? bathrooms,
    int? bedrooms,
    bool? furnished,
    bool? parking,
    String? type,
    bool? offer,
    List<String>? imageUrls,
    String? userRef,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _ListingModel;

  factory ListingModel.fromJson(Map<String, dynamic> json) =>
      _$ListingModelFromJson(json);
}
