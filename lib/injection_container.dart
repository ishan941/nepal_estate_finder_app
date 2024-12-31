import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:provider_with_clean_architecture/core/dio_helper.dart';
import 'package:provider_with_clean_architecture/core/networkinfo/network_info.dart';
import 'package:provider_with_clean_architecture/core/token_service/services/token_service.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
import 'package:provider_with_clean_architecture/core/utils/shared_preference.dart';
import 'package:provider_with_clean_architecture/features/login/data/datasource/auth_data_source.dart';
import 'package:provider_with_clean_architecture/features/login/data/repository_impl/auth_repository_impl.dart';
import 'package:provider_with_clean_architecture/features/login/domain/repository/auth_repository.dart';
import 'package:provider_with_clean_architecture/features/login/domain/usecase/login_use_case.dart';
import 'package:provider_with_clean_architecture/features/login/presentation/provider/auth_notifier.dart';
import 'package:provider_with_clean_architecture/features/resturent/data/data%20source/resturent_datasource.dart';
import 'package:provider_with_clean_architecture/features/resturent/data/repositoryImpl/resturent_repositoryimpl.dart';
import 'package:provider_with_clean_architecture/features/resturent/domain/repository/resturent_repository.dart';
import 'package:provider_with_clean_architecture/features/resturent/domain/use_cases/add_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/features/resturent/domain/use_cases/delete_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/features/resturent/domain/use_cases/edit_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/features/resturent/domain/use_cases/get_resturent_usecase.dart';
import 'package:provider_with_clean_architecture/features/resturent/presentation/provider/resturent_provider.dart';
import 'package:provider_with_clean_architecture/features/student/data/datasource/student_datasource.dart';
import 'package:provider_with_clean_architecture/features/student/data/repositories/student_repository_impl.dart';
import 'package:provider_with_clean_architecture/features/student/domain/repositories/student_repository.dart';
import 'package:provider_with_clean_architecture/features/student/domain/usecase/get_student_usecase.dart';
import 'package:provider_with_clean_architecture/features/student/domain/usecase/student_usecase.dart';
import 'package:provider_with_clean_architecture/features/student/presentation/provider/student_provider.dart';
import 'package:provider_with_clean_architecture/features/user/data/repositories_impl/post_repositories_impl.dart';
import 'package:provider_with_clean_architecture/features/user/domain/repositories/user_repositories.dart';
import 'package:provider_with_clean_architecture/features/user/domain/usecase/post_usecase.dart';
import 'package:provider_with_clean_architecture/features/user/presentation/provider/post_page_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);
  sl.registerLazySingleton<Dio>(() => Dio());
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  // Core
  sl.registerLazySingleton<DioHttp>(() => DioHttp(
        dio: sl(),
      ));
  sl.registerLazySingleton<SharedPref>(() => SharedPref(sp: sl()));
  sl.registerLazySingleton<TokenService>(() => TokenService(sharedPref: sl()));
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //Data source
  sl.registerLazySingleton<AuthDataSource>(
      () => AuthDataSourceImpl(dioHttp: sl()));

  //Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authDataSource: sl(), networkInfo: sl()));
//GetUsecase

//Postusecase
  sl.registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(authRepository: sl()));
//Notifier
  sl.registerFactory(() => AuthNotifier(
        loginUseCase: sl(),
      ));

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
