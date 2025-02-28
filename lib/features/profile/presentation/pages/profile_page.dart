import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_card.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/utils/color_util.dart';
import 'package:provider_with_clean_architecture/core/utils/custom_simmer.dart';
import 'package:provider_with_clean_architecture/features/Auth/presentation/pages/login_page.dart';

import 'package:provider_with_clean_architecture/features/Auth/presentation/provider/user_notifier.dart';
import 'package:provider_with_clean_architecture/features/HomePage/model/listingModel/listing_details.dart';
import 'package:provider_with_clean_architecture/features/Listing/presentation/notifier/listing_notifier.dart';
import 'package:provider_with_clean_architecture/features/Listing/presentation/pages/listingDetails.dart';
import 'package:provider_with_clean_architecture/features/profile/data/model/model/user_model.dart';
import 'package:provider_with_clean_architecture/features/profile/presentation/notifier/user_notifier.dart';
import 'package:provider_with_clean_architecture/features/profile/presentation/pages/edit_profile.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  late String userId;
  late UserModel editedUser;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await _initializeUserData();
    });
  }

  Future<void> _initializeUserData() async {
    await ref.read(userProvider.notifier).fetchUserData();
    userId = ref.read(userProvider)?.id ?? '';
    if (userId.isNotEmpty) {
      await ref.read(userState.notifier).getUserData(userId);
      await ref.read(listingState.notifier).getUserListings(userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userState);
    final userListing = ref.watch(listingState);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text('Edit Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                  (Route<dynamic> route) => false,
                );
                // await ref
                //     .read(userState.notifier)
                //     .clearUserData(); // Clear user data
              },
            ),
          ],
        ),
        body: userData.maybeWhen(
          loading: () => const NefPadding(
            child: CustomShimmer(isProfile: true, height: 200, width: 100),
          ),
          error: (message) => Scaffold(
            body: Center(child: Text(message ?? 'An error occurred')),
          ), // Error state
          success: (user) {
            editedUser = user;
            final avatar = user.avatar.isEmpty
                ? 'https://default-avatar-url.com'
                : user.avatar;
            final bio = user.bio.isEmpty ? 'No bio available' : user.bio;
            final email = user.email.isEmpty ? 'No email provided' : user.email;
            final username =
                user.username.isEmpty ? 'Anonymous' : user.username;
            final userId = user.id.isEmpty ? 'Anonymous' : user.id;

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 250,
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    EditProfile(userId: userId)));
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          color: primaryColor, // Set your border color here
                          width: 1, // Set the border width
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              12), // Optional: Add rounded corners
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10), // Adjust padding as needed
                      ),
                      child: Column(
                        children: [
                          Center(
                            child: ClipOval(
                              child: SizedBox(
                                height: 100,
                                width: 100,
                                child: user.avatar.isNotEmpty
                                    ? Image.network(user.avatar,
                                        fit: BoxFit.cover)
                                    : const Icon(Icons.account_circle,
                                        size: 100),
                              ),
                            ),
                          ),
                          Text(username),
                          Text(email),
                          Text(bio),
                          const SizedBox(height: 10),
                          SizedBox(
                            height: 40,
                            width: 100,
                            child: OutlinedButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditProfile(userId: userId)));
                              },
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color:
                                      primaryColor, // Set your border color here
                                  width: 1, // Set the border width
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      12), // Optional: Add rounded corners
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10), // Adjust padding as needed
                              ),
                              child: const Text(
                                "Edit Profile",
                                style: TextStyle(
                                  color:
                                      primaryColor, // Set your text color to match the border
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Text("My Listings"),
                  const SizedBox(height: 8),
                  userListing.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    userListings: (listings) {
                      return SizedBox(
                        height: 230,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: listings!.length,
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
                                              listingDetailsModel:
                                                  listingDetailsModel,
                                            )));
                              },
                              child: NefCard(
                                imageUrl: listing.imageUrls![0],
                                listingDetailsModel: listingDetailsModel,
                              ),
                            );
                          },
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },

          orElse: () =>
              const SizedBox.shrink(), // Fallback if state is not recognized
        ));
  }
}
