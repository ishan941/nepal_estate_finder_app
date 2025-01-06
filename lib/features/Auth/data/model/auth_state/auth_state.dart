import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/model/auth_model/auth_model.dart';
part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.idle({
    @Default(false) bool? rememberMe,
  }) = Idle;

  const factory AuthState.loading({
    @Default(false) bool? rememberMe,
  }) = Loading;

  const factory AuthState.authenticated(
    AuthModel user, {
    @Default(false) bool? rememberMe,
  }) = Authenticated;

  const factory AuthState.unauthenticated({
    @Default(false) bool? rememberMe,
  }) = Unauthenticated;

  const factory AuthState.error(
    String message, {
    @Default(false) bool? rememberMe,
  }) = Error;
}
