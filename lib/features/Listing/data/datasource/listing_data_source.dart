import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/api_const.dart';
import 'package:provider_with_clean_architecture/core/error/exception_error.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/model/listing_model.dart';

abstract class ListingDataSource {
  Future<List<ListingModel>> fetchListings({
    int limit = 9,
    int startIndex = 0,
    String? offer,
    String? furnished,
    String? parking,
    String? type,
    String? searchTerm,
    String sort = "createdAt",
    String order = "desc",
  });
  Future<List<ListingModel>> fetchUserListings(
      {String? token, String? userRef});
}

class ListingDataSourceImpl extends ListingDataSource {
  final DioHttp dioHttp;

  ListingDataSourceImpl({required this.dioHttp});

  @override
  Future<List<ListingModel>> fetchListings({
    int limit = 9,
    int startIndex = 0,
    String? offer,
    String? furnished,
    String? parking,
    String? type,
    String? searchTerm,
    String sort = "createdAt",
    String order = "desc",
  }) async {
    try {
      Map<String, dynamic> queryParams = {
        'limit': limit,
        'startIndex': startIndex,
        'offer': offer ?? 'false',
        'furnished': furnished ?? 'false',
        'parking': parking ?? 'false',
        'type': type ?? 'all',
        'searchTerm': searchTerm ?? '',
        'sort': sort,
        'order': order,
      };

      Response response = await dioHttp.get(
          url: Api.baseUrl + Api.getListings + "", query: queryParams);

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

  @override
  Future<List<ListingModel>> fetchUserListings(
      {String? token, String? userRef}) async {
    try {
      Response response = await dioHttp.get(
          url: Api.baseUrl + Api.getUserListings + "${userRef}", token: token);

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
}
