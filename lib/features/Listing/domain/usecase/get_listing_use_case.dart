import 'package:dartz/dartz.dart';

import 'package:provider_with_clean_architecture/features/Listing/data/model/listing_model.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/repository/listing_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';

class GetListingUseCase extends UseCase<List<ListingModel>, NoParams> {
  final ListingRepository listingRepository;

  GetListingUseCase({required this.listingRepository});

  @override
  Future<Either<Failure, List<ListingModel>>> call(NoParams params) {
    return listingRepository.getListings();
  }
}
