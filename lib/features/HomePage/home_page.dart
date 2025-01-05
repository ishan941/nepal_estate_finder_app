import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_app_bar.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_typography.dart';
import 'package:provider_with_clean_architecture/features/Listing/presentation/notifier/listing_notifier.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

TextEditingController _searchController = TextEditingController();

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    Future.delayed(Duration.zero, () async {
      await ref.watch(listingState.notifier).getListings();
    });
  }

  @override
  Widget build(BuildContext context) {
    final listingProvider = ref.watch(listingState);
    return Scaffold(
      appBar: NefAppBar(
        title: "Home page",
      ),
      body: Column(
        children: [
          NefPadding(child: NefSearchTextForm(controller: _searchController)),
          SizedBox(
              height: 120,
              child: Image.asset(
                "assets/images/discover_your_home.png",
                fit: BoxFit.cover,
              )),
          Expanded(
            child: SingleChildScrollView(
              child: NefPadding(
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          "Features Properties",
                          style: NefTypography.bodyText1,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    listingProvider.maybeWhen(
                      success: (listings) => SizedBox(
                        height: 150,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listings.length,
                          itemBuilder: (context, index) {
                            final listing = listings[index];
                            return NefPadding(
                              padding: const EdgeInsets.only(
                                  right: 10, top: 16, bottom: 16),
                              child: Container(
                                width: 120,
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Image.network(
                                        listing.imageUrls!.isNotEmpty
                                            ? listing.imageUrls![0]
                                            : '',
                                        fit: BoxFit.cover,
                                        errorBuilder: (_, __, ___) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    Text(
                                      listing.name!,
                                      style: NefTypography.bodyText2,
                                    ),
                                    Text(
                                      "\$${listing.regularPrice}",
                                      style: NefTypography.caption,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      orElse: () =>
                          const Center(child: CircularProgressIndicator()),
                    ),
                    const Row(
                      children: [
                        Text(
                          "Hot deals",
                          style: NefTypography.bodyText1,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Hot deals",
                          style: NefTypography.bodyText1,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                    const SizedBox(
                      height: 150,
                    ),
                    const Row(
                      children: [
                        Text(
                          "Hot deals",
                          style: NefTypography.bodyText1,
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
