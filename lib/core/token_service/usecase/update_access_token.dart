import '../services/token_service.dart';
class UpdateAccessTokenUseCase {
  final TokenService tokenService;
  UpdateAccessTokenUseCase({required this.tokenService});
  Future<void> call(String newAccessToken) async {
    tokenService.updateAccessToken(newAccessToken);
  }
}