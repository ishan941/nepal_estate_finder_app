import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:provider_with_clean_architecture/core/networkinfo/network_info.dart';
import 'package:provider_with_clean_architecture/core/token_service/services/token_service.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
import 'package:provider_with_clean_architecture/core/utils/shared_preference.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/datasource/auth_data_source.dart';
import 'package:provider_with_clean_architecture/features/Auth/data/repository_impl/auth_repository_impl.dart';
import 'package:provider_with_clean_architecture/features/Auth/domain/repository/auth_repository.dart';
import 'package:provider_with_clean_architecture/features/Auth/domain/service/user_hive_service.dart';
import 'package:provider_with_clean_architecture/features/Auth/domain/usecase/login_use_case.dart';
import 'package:provider_with_clean_architecture/features/Auth/presentation/provider/auth_notifier.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/datasource/listing_data_source.dart';
import 'package:provider_with_clean_architecture/features/Listing/data/repository_impl/listing_repository_impl.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/repository/listing_repository.dart';
import 'package:provider_with_clean_architecture/features/Listing/domain/usecase/get_listing_use_case.dart';
import 'package:provider_with_clean_architecture/features/Listing/presentation/notifier/listing_notifier.dart';
import 'package:provider_with_clean_architecture/features/profile/data/datasource/user_data_source.dart';
import 'package:provider_with_clean_architecture/features/profile/data/repository_impl/user_repository_impl.dart';
import 'package:provider_with_clean_architecture/features/profile/domain/repository/user_repository.dart';
import 'package:provider_with_clean_architecture/features/profile/domain/usecase/get_user_use_case.dart';
import 'package:provider_with_clean_architecture/features/profile/presentation/notifier/user_notifier.dart';
import 'package:provider_with_clean_architecture/ets/resturent/data/data%20source/resturent_datasource.dart';
import 'package:provider_with_clean_architecture/ets/resturent/data/repositoryImpl/resturent_repositoryimpl.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/repository/resturent_repository.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/use_cases/add_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/use_cases/delete_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/use_cases/edit_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/ets/resturent/domain/use_cases/get_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/ets/resturent/presentation/provider/resturent_provider.dart';
import 'package:provider_with_clean_architecture/ets/student/data/datasource/student_datasource.dart';
import 'package:provider_with_clean_architecture/ets/student/data/repositories/student_repository_impl.dart';
import 'package:provider_with_clean_architecture/ets/student/domain/repositories/student_repository.dart';
import 'package:provider_with_clean_architecture/ets/student/domain/usecase/get_student_usecase.dart';
import 'package:provider_with_clean_architecture/ets/student/domain/usecase/student_usecase.dart';
import 'package:provider_with_clean_architecture/ets/student/presentation/provider/student_provider.dart';
import 'package:provider_with_clean_architecture/ets/user/data/repositories_impl/post_repositories_impl.dart';
import 'package:provider_with_clean_architecture/ets/user/domain/repositories/user_repositories.dart';
import 'package:provider_with_clean_architecture/ets/user/domain/usecase/post_usecase.dart';
import 'package:provider_with_clean_architecture/ets/user/presentation/provider/post_page_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
//Enternal
void registerExternal() async {
  try {
    final sharedPreferences = await SharedPreferences.getInstance();
    sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  } catch (e) {
    throw Exception("Failed to initialize SharedPreferences: $e");
  }
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}

//core
void registerCore() {
  sl.registerLazySingleton<DioHttp>(() => DioHttp(
        dio: sl(),
      ));
  sl.registerLazySingleton<SharedPref>(() => SharedPref(sp: sl()));
  sl.registerLazySingleton<TokenService>(() => TokenService(sharedPref: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

//Data source
void registerDataSource() {
  sl.registerLazySingleton<UserHiveService>(() => UserHiveService());

  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(dioHttp: sl(), userHiveService: sl()));
  sl.registerLazySingleton<UserDataSource>(
      () => UserDataSourceImpl(dioHttp: sl()));
  sl.registerLazySingleton<ListingDataSource>(
      () => ListingDataSourceImpl(dioHttp: sl()));
}

// Repository
void registerRepository() {
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
        authDataSource: sl(),
        networkInfo: sl(),
      ));

  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
        userDataSource: sl(),
        networkInfo: sl(),
        tService: sl(),
      ));
  sl.registerLazySingleton<ListingRepository>(() => ListingRepositoryImpl(
        listingDataSource: sl(),
        networkInfo: sl(),
        tService: sl(),
      ));
}

// Usecase
void registerUseCases() {
  //GetuseCase
  sl.registerLazySingleton<GetUserUseCase>(
      () => GetUserUseCase(userRepository: sl()));
  sl.registerLazySingleton<GetListingUseCase>(
      () => GetListingUseCase(listingRepository: sl()));

  //Post usecase
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: sl()));
  sl.registerLazySingleton<SignUpUserUseCase>(
      () => SignUpUserUseCase(authRepository: sl()));
  sl.registerLazySingleton<UpdateUserUseCase>(
      () => UpdateUserUseCase(userRepository: sl()));

  //Delete Usecase
  sl.registerLazySingleton<DeleteUserUseCase>(
      () => DeleteUserUseCase(userRepository: sl()));
}

// Notifier
void registerNotifier() {
  sl.registerFactory(() => AuthNotifier(
        loginUseCase: sl(),
        signUpUserUseCase: sl(),
        sharedPref: sl(),
      ));
  sl.registerFactory(() => UserNotifier(
      getUserUseCase: sl(), updateUserUseCase: sl(), deleteUserCase: sl()));
  sl.registerFactory(() => ListingNotifier(
        getListingUseCase: sl(),
      ));
}

Future<void> init() async {
  registerExternal();
  registerCore();
  registerDataSource();
  registerRepository();
  registerUseCases();

  registerNotifier();

//>>>>>>
//
//
//
//>>>>>>
//
//
//
//>>>>>>
  //Resturent
  //Register repository
  sl.registerLazySingleton<StudentRepository>(
    () => StudentRepositoryImpl(
      studentDataSource: sl(),
      networkInfo: sl(),
    ),
  );
  sl.registerLazySingleton<ResturentRepository>(
    () => ResturentRepositoryImpl(
      resturentDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  sl.registerLazySingleton<PostRepositories>(
    () => PostRepositoriesImpl(
      postDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  //Register provider

  sl.registerLazySingleton<StudentProvider>(
      () => StudentProvider(studentUseCase: sl(), getStudentUseCase: sl()));

  sl.registerLazySingleton<ResturentProvider>(
    () => ResturentProvider(
        resturentUseCase: sl(),
        getResturentUseCase: sl(),
        deleteResturentUseCase: sl(),
        editResturentUseCase: sl()),
  );

  sl.registerLazySingleton<PostPageProvider>(
      () => PostPageProvider(postUseCase: sl()));

  // Register useCases

  sl.registerLazySingleton<StudentUseCase>(
      () => StudentUseCase(studentRepository: sl()));

  sl.registerLazySingleton<ResturentUseCase>(
      () => ResturentUseCase(resturentRepository: sl()));

  sl.registerLazySingleton<GetResturentUseCase>(
      () => GetResturentUseCase(resturentRepository: sl()));

  sl.registerLazySingleton<DeleteResturentUseCase>(
      () => DeleteResturentUseCase(resturentRepository: sl()));

  sl.registerLazySingleton<EditResturentUseCase>(
      () => EditResturentUseCase(resturentRepository: sl()));

  sl.registerLazySingleton<PostUseCase>(
      () => PostUseCase(postRepositories: sl()));

  sl.registerLazySingleton<GetStudentUseCase>(
      () => GetStudentUseCase(studentRepository: sl()));

  /// Register data source
  sl.registerLazySingleton<StudentDataSource>(
    () => StudentDataSourceImpl(dioHttp: sl()),
  );

  sl.registerLazySingleton<ResturentDataSource>(
    () => ResturentDataSourceImpl(dioHttp: sl()),
  );
}
