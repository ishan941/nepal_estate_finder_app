import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:provider_with_clean_architecture/features/login/presentation/pages/login_page.dart';
import 'package:provider_with_clean_architecture/features/resturent/presentation/pages/resturent_form.dart';
import 'package:provider_with_clean_architecture/features/resturent/presentation/provider/resturent_provider.dart';
import 'package:provider_with_clean_architecture/features/student/presentation/pages/student_form.dart';
import 'package:provider_with_clean_architecture/features/student/presentation/provider/student_provider.dart';
import 'package:provider_with_clean_architecture/firebase_options.dart';
import 'package:provider_with_clean_architecture/injection_container.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  @override
  void initState() {
    deepLink();
    super.initState();
  }

  deepLink() async {
    final PendingDynamicLinkData? initialLink =
        await FirebaseDynamicLinks.instance.getInitialLink();

    if (initialLink != null) {
      final Uri deepLink = initialLink.link;
    }

    FirebaseDynamicLinks.instance.onLink.listen(
      (pendingDynamicLinkData) {
        if (pendingDynamicLinkData != null) {
          final Uri deepLink = pendingDynamicLinkData.link;
          _navigatorKey.currentState?.pushNamed(deepLink.path);
        }
      },
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                StudentProvider(studentUseCase: sl(), getStudentUseCase: sl())),
        ChangeNotifierProvider(
            create: (_) => ResturentProvider(
                resturentUseCase: sl(),
                getResturentUseCase: sl(),
                deleteResturentUseCase: sl(),
                editResturentUseCase: sl()))
      ],
      child: MaterialApp(
          navigatorKey: _navigatorKey,
          routes: {'/studentform': (context) => StudentForm()},
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginPage()),
    );
  }
}
