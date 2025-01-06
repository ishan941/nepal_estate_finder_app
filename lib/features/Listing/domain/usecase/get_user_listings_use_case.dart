import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/model/listing_model.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/repository/listing_repository.dart';

class GetUserListingsUseCase extends UseCase<List<ListingModel>, String?> {
  final ListingRepository listingRepository;

  GetUserListingsUseCase({required this.listingRepository});

  @override
  Future<Either<Failure, List<ListingModel>>> call(String? userId) {
    return listingRepository.fetchUserListings(userRef: userId);
  }
}
