import 'package:flutter/material.dart';
import 'package:provider_with_clean_architecture/core/nef_custom/nef_padding.dart';
import 'package:provider_with_clean_architecture/core/utils/nef_spacing.dart';
import 'package:provider_with_clean_architecture/features/HomePage/model/listingModel/listing_details.dart';

class NefCard extends StatelessWidget {
  final ListingDetailsModel listingDetailsModel;
  final String? imageUrl;

  const NefCard({Key? key, required this.listingDetailsModel, this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NefPadding(
      padding: const EdgeInsets.only(right: 10, top: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              BorderRadius.circular(NefRadius.radius2), // Rounded corners
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 8,
              offset: const Offset(0, 4), // Shadow direction
            ),
          ],
        ),
        width: MediaQuery.of(context).size.width * .29,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image section with rounded corners
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(NefRadius.radius2)),
              child: SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  listingDetailsModel.imageUrls![0],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.error, color: Colors.red),
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Title Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                listingDetailsModel.name ?? 'Unnamed Item',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 15,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .19,
                    child: Text(
                      listingDetailsModel.address ?? "",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  const Text(
                    "RS.",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .17,
                    child: Text(
                      listingDetailsModel.regularPrice.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      overflow:
                          TextOverflow.ellipsis, // To handle text overflow
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
