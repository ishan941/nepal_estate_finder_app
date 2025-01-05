import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/model/listing_model.dart';
import 'package:provider_with_clean_architecture/features/profile/data/model/model/user_model.dart';

abstract class ListingRepository {
  Future<Either<Failure, List<ListingModel>>> getListings(
      {String? offer, String? type});
}
