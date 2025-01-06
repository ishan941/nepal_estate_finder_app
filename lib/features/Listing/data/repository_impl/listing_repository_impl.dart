import 'dart:math';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:provider_with_clean_architecture/core/error/failure.dart';
import 'package:provider_with_clean_architecture/core/networkinfo/network_info.dart';
import 'package:provider_with_clean_architecture/core/token_service/repository/base_repository.dart';
import 'package:provider_with_clean_architecture/core/token_service/services/token_service.dart';
import 'package:provider_with_clean_architecture/core/utils/string_util.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/datasource/listing_data_source.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/model/listing_model.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/repository/listing_repository.dart';

class ListingRepositoryImpl extends BaseRepository
    implements ListingRepository {
  final NetworkInfo networkInfo;
  final ListingDataSource listingDataSource;
  final TokenService tService;

  ListingRepositoryImpl(
      {required this.listingDataSource,
      required this.networkInfo,
      required this.tService})
      : super(tokenService: tService);

  @override
  Future<Either<Failure, List<ListingModel>>> getListings(
      {String? offer, String? type}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await listingDataSource.fetchListings(offer: offer);
        return Right(result);
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure(
              (e.response?.data == null) ? e.message : e.response?.data,
              e.response?.statusCode));
        } else {
          return const Left(ServerFailure(somethingWentWrongStr, 0));
        }
      }
    } else {
      return const Left(NetworkFailure(noInternetConnection, 0));
    }
  }

  @override
  Future<Either<Failure, List<ListingModel>>> fetchUserListings(
      {String? token, String? userRef}) async {
    if (await networkInfo.isConnected) {
      try {
        final result = await listingDataSource.fetchUserListings(
            token: accessToken, userRef: userRef);
        return Right(result);
      } catch (e) {
        if (e is DioException) {
          return Left(ServerFailure(
              (e.response?.data == null) ? e.message : e.response?.data,
              e.response?.statusCode));
        } else {
          return const Left(ServerFailure(somethingWentWrongStr, 0));
        }
      }
    } else {
      return const Left(NetworkFailure(noInternetConnection, 0));
    }
  }
}
