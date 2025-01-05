import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/error/exception_error.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/model/listing_model.dart';

abstract class ListingDataSource {
  Future<List<ListingModel>> fetchListings();
}

class ListingDataSourceImpl extends ListingDataSource {
  final DioHttp dioHttp;

  ListingDataSourceImpl({required this.dioHttp});

  @override
  Future<List<ListingModel>> fetchListings() async {
    try {
      Response response = await dioHttp.get(url: Api.baseUrl + Api.getListings);

      print('Response status code: ${response.statusCode}');
      print('Response data: ${response.data}');

      if (response.statusCode == 200 || response.statusCode == 201) {
        final List<dynamic> listingData = response.data;
        print('Listing data: $listingData');

        if (listingData.isEmpty) {
          throw ServerException('No listings found', 404);
        }

        return listingData.map((json) => ListingModel.fromJson(json)).toList();
      } else {
        throw ServerException(
            response.statusMessage ?? 'Unknown error', response.statusCode);
      }
    } catch (e) {
      throw ServerException(e.toString(), 500);
    }
  }

  // Future<List<ListingModel>> fetchListings() async {
  //   // Simulated response for testing
  //   final responseData = {
  //     'data': [
  //       {
  //         '_id': '123',
  //         'name': 'Test Listing',
  //         'description': 'Description here',
  //         'address': 'Address here',
  //         'regularPrice': 200.0,
  //         'discountPrice': 180.0,
  //         'bathrooms': 2,
  //         'bedrooms': 3,
  //         'furnished': true,
  //         'parking': true,
  //         'type': 'Sale',
  //         'offer': true,
  //         'imageUrls': ['url1', 'url2'],
  //         'userRef': 'userRef',
  //         'createdAt': '2025-01-01T12:00:00.000Z',
  //         'updatedAt': '2025-01-01T12:00:00.000Z',
  //         '__v': 0,
  //       }
  //     ]
  //   };

  //   final List<dynamic> listingData = responseData['data']!;
  //   if (listingData.isEmpty) {
  //     throw ServerException('No listings found', 404);
  //   }
  //   return listingData.map((json) => ListingModel.fromJson(json)).toList();
  // }
}
