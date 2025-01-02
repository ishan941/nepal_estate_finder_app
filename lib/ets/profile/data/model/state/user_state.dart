import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_with_clean_architecture/features/ets/profile/data/model/model/user_model.dart';

part 'user_state.freezed.dart';

// user_state.dart
@freezed
class UserState with _$UserState {
  const factory UserState.idle() = _Idle;
  const factory UserState.loading() = _Loading;
  const factory UserState.success(UserModel? user) = _Success;
  const factory UserState.error(String? error) = _Error;
}
