import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/utils/shared_preference.dart';
import 'package:provider_with_clean_architecture/features/Auth/presentation/pages/login_page.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_nav_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NefSplashScreen extends ConsumerStatefulWidget {
  const NefSplashScreen({super.key});

  @override
  ConsumerState<NefSplashScreen> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<NefSplashScreen> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    final sharedPref = SharedPref(sp: await SharedPreferences.getInstance());
    final rememberMe =
        sharedPref.readBoolValFrmPreference('remember_me') ?? false;

    final accessToken = sharedPref.readStringValFrmPreference(accessTokenKey);

    if (rememberMe && accessToken.isNotEmpty) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const NefNavBar()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // Splash screen loader
      ),
    );
  }
}
