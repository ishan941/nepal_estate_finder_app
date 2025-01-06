import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/state/listing_state.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/usecase/get_listing_use_case.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/usecase/get_user_listings_use_case.dart';
import 'package:provider_with_clean_architecture/injection_container.dart';

class ListingNotifier extends StateNotifier<ListingState> {
  final GetListingUseCase getListingUseCase;
  final GetUserListingsUseCase getUserListingsUseCase;

  ListingNotifier({
    required this.getListingUseCase,
    required this.getUserListingsUseCase,
  }) : super(const ListingState.idle());

  Future<void> getListings({
    String? userId,
    String? offer,
    String? type,
  }) async {
    state = const ListingState.loading();
    final result =
        await getListingUseCase(ListingParams(offer: offer, type: type));
    result.fold(
      (failure) {
        state = ListingState.error(failure.message);
      },
      (listings) {
        final offerList =
            listings.where((listing) => listing.offer == true).toList();
        final rentList =
            listings.where((listing) => listing.type == "rent").toList();
        final saleList =
            listings.where((listing) => listing.type == "sale").toList();
        final hotDealsList =
            listings.where((listing) => listing.type == "hot_deals").toList();

        state = ListingState.success(
          listings,
          offerList,
          rentList,
          saleList,
          hotDealsList,
        );
      },
    );
  }

  Future<void> getUserListings(String? userId) async {
    state = const ListingState.loading();
    final result = await getUserListingsUseCase(userId);
    result.fold(
      (failure) {
        state = ListingState.error(failure.message);
      },
      (listings) {
        state = ListingState.userListings(
          listings,
        );
      },
    );
  }
}

final listingState = StateNotifierProvider<ListingNotifier, ListingState>(
  (ref) => ListingNotifier(
    getListingUseCase: sl(),
    getUserListingsUseCase: sl(),
  ),
);
