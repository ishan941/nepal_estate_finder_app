import 'package:shared_preferences/shared_preferences.dart';

const String accessTokenKey = "access_token";
const String refreshTokenKey = "refresh_token";

class SharedPref {
  final SharedPreferences sp;

  SharedPref({
    required this.sp,
  });

  saveDataToPreference(String key, dynamic value) async {
    if (value is String) {
      await sp.setString(key, value);
    } else if (value is bool) {
      await sp.setBool(key, value);
    } else if (value is int) {
      await sp.setInt(key, value);
    }
  }

  String readStringValFrmPreference(String key) {
    return sp.getString(key) ?? "";
  }

  bool readBoolValFrmPreference(String key) {
    return sp.getBool(key) ?? false;
  }

  int readIntValFrmPreference(String key) {
    return sp.getInt(key) ?? 0;
  }

  clearPreferenceData() async {
    await sp.clear();
  }
}
