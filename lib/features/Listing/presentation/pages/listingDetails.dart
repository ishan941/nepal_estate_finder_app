import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart'; // For Swiper-like functionality
import 'package:provider_with_clean_architecture/features/HomePage/model/listingModel/listing_details.dart';
// import 'contact.dart'; // Assuming you have a Contact widget

class ListingDetails extends ConsumerStatefulWidget {
  final ListingDetailsModel listingDetailsModel;
  const ListingDetails({super.key, required this.listingDetailsModel});

  @override
  ConsumerState<ListingDetails> createState() => _ListingDetailsState();
}

class _ListingDetailsState extends ConsumerState<ListingDetails> {
  bool contact = false;
  bool copied = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.listingDetailsModel.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Image Carousel
            CarouselSlider(
              options: CarouselOptions(autoPlay: true, enlargeCenterPage: true),
              items: widget.listingDetailsModel.imageUrls!
                  .map((url) => ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          url,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ))
                  .toList(),
            ),

            // Copy Link Button
            Positioned(
              top: 16,
              right: 8,
              child: IconButton(
                icon: const Icon(Icons.share),
                onPressed: () {
                  // Clipboard.setData(
                  // ClipboardData(text: widget.listingDetailsModel.link!));
                  setState(() {
                    copied = true;
                  });
                  Future.delayed(const Duration(seconds: 2), () {
                    setState(() {
                      copied = false;
                    });
                  });
                },
              ),
            ),

            // User Info Section
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     padding: const EdgeInsets.all(16),
            //     color: Colors.white,
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         CircleAvatar(
            //           radius: 50,
            //           backgroundImage: NetworkImage(
            //               widget.listingDetailsModel.userProfilePic ?? ''),
            //         ),
            //         SizedBox(height: 8),
            //         // Text(
            //         //   widget.listingDetailsModel.userName!,
            //         //   style:
            //         //       TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //         // ),
            //         Text(
            //           widget.listingDetailsModel.userEmail!,
            //           style: TextStyle(fontSize: 16, color: Colors.grey),
            //         ),
            //         if (!contact)
            //           ElevatedButton(
            //             onPressed: () {
            //               setState(() {
            //                 contact = true;
            //               });
            //             },
            //             child: Text("Contact Landlord"),
            //           ),
            //         if (contact)
            //           Contact(listingDetails: widget.listingDetailsModel),
            //       ],
            //     ),
            //   ),
            // ),

            // Listing Details Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                // color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.listingDetailsModel.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      widget.listingDetailsModel.address,
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          if (widget.listingDetailsModel.discountPrice != null)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Display the discount amount
                                Text(
                                  "Rs. ${widget.listingDetailsModel.regularPrice ?? 0}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.grey,
                                    decoration: TextDecoration
                                        .lineThrough, // Strikethrough for regular price
                                  ),
                                ),
                                if (widget.listingDetailsModel.discountPrice !=
                                        null &&
                                    widget.listingDetailsModel.discountPrice! >
                                        0)
                                  Text(
                                    "Rs. ${(widget.listingDetailsModel.regularPrice ?? 0) - (widget.listingDetailsModel.discountPrice ?? 0)}",
                                    style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors
                                          .green, // Display the final price in red
                                    ),
                                  ),
                                if (widget.listingDetailsModel.discountPrice !=
                                        null &&
                                    widget.listingDetailsModel.discountPrice! >
                                        0)
                                  Text(
                                    "Save Rs. ${widget.listingDetailsModel.discountPrice ?? 0} OFF",
                                    style: const TextStyle(
                                        fontSize: 18, color: Colors.red),
                                  ),
                              ],
                            )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.bed, color: Colors.blue),
                        const SizedBox(width: 20),
                        Text('${widget.listingDetailsModel.bedrooms} Beds'),
                        const SizedBox(width: 20),
                        const Icon(FontAwesomeIcons.bath, color: Colors.blue),
                        const SizedBox(width: 20),
                        Text('${widget.listingDetailsModel.bathrooms} Baths'),
                        const SizedBox(width: 20),
                      ],
                    ),
                    Row(
                      children: [
                        const Icon(FontAwesomeIcons.car, color: Colors.blue),
                        const SizedBox(width: 20),
                        Text(
                          (widget.listingDetailsModel.parking ?? false)
                              ? 'Parking Available'
                              : 'No Parking',
                        ),
                        const SizedBox(width: 20),
                        const Icon(FontAwesomeIcons.couch, color: Colors.blue),
                        const SizedBox(width: 20),
                        Text(
                          (widget.listingDetailsModel.furnished ?? false)
                              ? 'Furnished'
                              : 'Unfurnished',
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Description: ${widget.listingDetailsModel.description}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    if (copied)
                      const Text("Link copied!",
                          style: TextStyle(color: Colors.green)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
