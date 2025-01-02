import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_app_bar.dart';

class CreateListing extends ConsumerStatefulWidget {
  const CreateListing({super.key});

  @override
  ConsumerState<CreateListing> createState() => _CreateListingState();
}

class _CreateListingState extends ConsumerState<CreateListing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NefAppBar(title: "Create Listing"),
    ); // Your UI here
  }
}
