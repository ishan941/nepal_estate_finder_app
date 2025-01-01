import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class homePage extends ConsumerStatefulWidget {
  const homePage({super.key});

  @override
  ConsumerState<homePage> createState() => _homePageState();
}

class _homePageState extends ConsumerState<homePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(); // Your UI here
  }
}
