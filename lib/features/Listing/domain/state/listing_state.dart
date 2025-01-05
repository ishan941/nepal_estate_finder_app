import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/model/listing_model.dart';

part 'listing_state.freezed.dart';

@freezed
class ListingState with _$ListingState {
  const factory ListingState.idle() = _Idle;
  const factory ListingState.loading() = _Loading;
  const factory ListingState.success(List<ListingModel> listings) = _Success;
  const factory ListingState.error(String message) = _Error;
}
