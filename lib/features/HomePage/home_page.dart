import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_app_bar.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_typography.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/model/listing_model.dart';
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
                child: listingProvider.maybeWhen(
                  success:
                      (listings, offerList, rentList, saleList, hotDealsList) {
                    return Column(
                      children: [
                        // Featured listings (horizontal list)
                        SizedBox(
                          height: 150,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: listings!.length,
                            itemBuilder: (context, index) {
                              final listing = listings[index];
                              return NefPadding(
                                padding: const EdgeInsets.only(
                                    right: 10, top: 16, bottom: 16),
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .29,
                                  height: 100,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        // Rent listings
                        buildCategoryRow("Hot Deals", offerList ?? []),
                        buildCategoryRow("Sale", saleList ?? []),
                        buildCategoryRow("Rent", rentList ?? []),
                        // Sale listings

                        // Hot Deals listings
                      ],
                    );
                  },
                  orElse: () =>
                      const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper method to build the category row (Rent, Sale, etc.)
  Widget buildCategoryRow(String category, List<ListingModel> listings) {
    if (listings.isEmpty) {
      return SizedBox
          .shrink(); // Return an empty widget if no listings match the type
    }
    return Column(
      children: [
        Row(
          children: [
            Text(
              category,
              style: NefTypography.bodyText1,
            ),
            Spacer(),
            Icon(Icons.arrow_forward_ios)
          ],
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listings.length,
            itemBuilder: (context, index) {
              final listing = listings[index];
              return NefPadding(
                padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16),
                child: Container(
                  width: MediaQuery.of(context).size.width * .29,
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
                          errorBuilder: (_, __, ___) => Icon(Icons.error),
                        ),
                      ),
                      Text(listing.name!)
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
