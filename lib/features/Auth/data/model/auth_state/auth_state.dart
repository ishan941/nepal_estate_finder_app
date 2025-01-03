import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/model/auth_model/auth_model.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.idle() = Idle;
  const factory AuthState.loading() = Loading;
  const factory AuthState.authenticated(AuthModel user) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.error(String message) = Error;
}
