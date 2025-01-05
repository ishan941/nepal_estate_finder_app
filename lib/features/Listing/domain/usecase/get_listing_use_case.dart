import 'package:dartz/dartz.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/datasource/listing_data_source.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/model/listing_model.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/repository/listing_repository.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';

class GetListingUseCase extends UseCase<List<ListingModel>, ListingParams> {
  final ListingRepository listingRepository;

  GetListingUseCase({required this.listingRepository});

  @override
  Future<Either<Failure, List<ListingModel>>> call(ListingParams params) {
    return listingRepository.getListings(
        offer: params.offer, type: params.type);
  }
}

class ListingParams {
  final String? offer;
  final String? type;

  ListingParams({this.offer, this.type});
}
