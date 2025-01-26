class ListingDetailsModel {
  final String? id;
  final String name;
  final String description;
  final String address;
  final double? regularPrice;
  final double? discountPrice;
  final int? bathrooms;
  final int? bedrooms;
  final bool? furnished;
  final bool? parking;
  final String type;
  final bool? offer;
  final List<String>? imageUrls;
  final String? userRef;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  ListingDetailsModel({
    this.id,
    required this.name,
    required this.description,
    required this.address,
    this.regularPrice,
    this.discountPrice,
    this.bathrooms,
    this.bedrooms,
    this.furnished,
    this.parking,
    required this.type,
    this.offer,
    this.imageUrls,
    this.userRef,
    this.createdAt,
    this.updatedAt,
  });
}
