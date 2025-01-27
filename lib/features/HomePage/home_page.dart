import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_app_bar.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_card.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_text_form_field.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_typography.dart';
import 'package:provider_with_clean_architecture/core/utils/custom_simmer.dart';
import 'package:provider_with_clean_architecture/features/HomePage/model/listingModel/listing_details.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/model/listing_model.dart';
import 'package:provider_with_clean_architecture/features/Listing/presentation/notifier/listing_notifier.dart';
import 'package:provider_with_clean_architecture/features/Listing/presentation/pages/listingDetails.dart';

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
        showBackButton: false,
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
                  orElse: () => Container(
                      height: 500,
                      child: const Center(
                          child: (CustomShimmer(height: 150, width: 100)))),
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
      return const SizedBox
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
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
        SizedBox(
          height: 230,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listings.length,
            itemBuilder: (context, index) {
              final listing = listings[index];

              final listingDetailsModel = ListingDetailsModel(
                id: listing.id,
                name: listing.name!,
                description: listing.description!,
                address: listing.address!,
                regularPrice: listing.regularPrice,
                discountPrice: listing.discountPrice,
                bathrooms: listing.bathrooms,
                bedrooms: listing.bedrooms,
                furnished: listing.furnished,
                parking: listing.parking,
                type: listing.type!,
                offer: listing.offer,
                imageUrls: listing.imageUrls,
                userRef: listing.userRef,
                createdAt: listing.createdAt,
                updatedAt: listing.updatedAt,
              );

              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ListingDetails(
                                listingDetailsModel: listingDetailsModel,
                              )));
                },
                child: NefCard(
                  imageUrl: listing.imageUrls![0],
                  listingDetailsModel: listingDetailsModel,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
