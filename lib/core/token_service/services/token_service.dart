import 'package:provider_with_clean_architecture/core/utils/shared_preference.dart';

class TokenService {
  String _accessToken = '';
  String get accessToken => _accessToken;
  final SharedPref sharedPref;
  TokenService({required this.sharedPref}) {
    _init();
  }

  Future<void> _init() async {
    _accessToken = sharedPref.readStringValFrmPreference(accessTokenKey);
  }

  void updateAccessToken(String newAccessToken) {
    _accessToken = newAccessToken;
  }
}
