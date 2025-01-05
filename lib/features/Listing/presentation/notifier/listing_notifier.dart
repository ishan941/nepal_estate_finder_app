import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/usecase/usecase.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/state/listing_state.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/usecase/get_listing_use_case.dart';
import 'package:provider_with_clean_architecture/injection_container.dart';

class ListingNotifier extends StateNotifier<ListingState> {
  final GetListingUseCase getListingUseCase;
  ListingNotifier({required this.getListingUseCase})
      : super(const ListingState.idle());

  Future<void> getListings() async {
    state = const ListingState.loading();
    final result = await getListingUseCase(NoParams());
    result.fold((failure) {
      state = ListingState.error(failure.message);
    }, (listings) {
      state = ListingState.success(listings);
    });
  }
}

final listingState = StateNotifierProvider<ListingNotifier, ListingState>(
    (ref) => ListingNotifier(getListingUseCase: sl()));
