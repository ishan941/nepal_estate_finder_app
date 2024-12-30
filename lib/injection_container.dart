import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:provider_with_clean_architecture/core/dio_helper.dart';
import 'package:provider_with_clean_architecture/core/networkinfo/network_info.dart';
import 'package:provider_with_clean_architecture/core/utils/dio_http.dart';
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

final sl = GetIt.instance;

Future<void> init() async {
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
        deleteResturentUseCase: sl(), editResturentUseCase: sl()),
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

  /// core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  /// external

  sl.registerSingleton<Dio>(dio);
  sl.registerLazySingleton<DioHttp>(() => DioHttp(dio: sl()));
  sl.registerLazySingleton<Connectivity>(() => Connectivity());
}
