import '../services/token_service.dart';

abstract class BaseRepository {
  final TokenService tokenService;

  BaseRepository({required this.tokenService});

  String get accessToken => tokenService.accessToken;
}
