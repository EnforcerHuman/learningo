import 'package:get_it/get_it.dart';
import 'package:learningo/features/chapters/data/datasource/chapters_local_datasource.dart';
import 'package:learningo/features/chapters/data/repositories/chapters_repository_impl.dart';
import 'package:learningo/features/chapters/domain/repositories/chapters_repository.dart';
import 'package:learningo/features/chapters/domain/usecases/get_questions_usecase.dart';
import 'package:learningo/features/chapters/domain/usecases/get_unit_detail_usecase.dart';
import 'package:learningo/features/chapters/presentation/bloc/question_bloc.dart';
import 'package:learningo/features/chapters/presentation/bloc/unit_detail_bloc.dart';
import 'package:learningo/features/home/data/datasource/home_local_datasource.dart';
import 'package:learningo/features/home/data/repositories/home_repository_impl.dart';
import 'package:learningo/features/home/domain/repositories/home_repository.dart';
import 'package:learningo/features/home/domain/usecases/get_chapters_usecase.dart';
import 'package:learningo/features/home/presentation/bloc/home_bloc.dart';

/// Global service locator instance using `get_it`.
final GetIt sl = GetIt.instance;

/// Initializes all dependency injection registrations for the application.
Future<void> initInjectionContainer() async {
  // ---------------------------------------------------------------------------
  // BLoCs / State Management
  // ---------------------------------------------------------------------------
  sl.registerFactory(() => HomeBloc(getChaptersUseCase: sl()));
  sl.registerFactory(() => UnitDetailBloc(getUnitDetailUseCase: sl()));
  sl.registerFactory(() => QuestionBloc(getQuestionsUseCase: sl()));

  // ---------------------------------------------------------------------------
  // Use Cases
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton(() => GetChaptersUseCase(sl()));
  sl.registerLazySingleton(() => GetUnitDetailUseCase(sl()));
  sl.registerLazySingleton(() => GetQuestionsUseCase(sl()));

  // ---------------------------------------------------------------------------
  // Repositories
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(localDataSource: sl()),
  );
  sl.registerLazySingleton<ChaptersRepository>(
    () => ChaptersRepositoryImpl(localDataSource: sl()),
  );

  // ---------------------------------------------------------------------------
  // Data Sources
  // ---------------------------------------------------------------------------
  sl.registerLazySingleton<HomeLocalDataSource>(
    () => HomeLocalDataSourceImpl(),
  );
  sl.registerLazySingleton<ChaptersLocalDataSource>(
    () => ChaptersLocalDataSourceImpl(),
  );
}
