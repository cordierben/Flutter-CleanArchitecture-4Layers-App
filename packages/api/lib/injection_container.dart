import 'package:api/get_concrete_number_trivia_usecase.dart';
import 'package:api/get_random_number_trivia_usecase.dart';
import 'package:api/number_trivia_local_datasource.dart';
import 'package:api/number_trivia_remote_datasource.dart';
import 'package:api/number_trivia_repository.dart';
import 'package:app/trivia_viewmodel.dart';
import 'package:data/datasources/number_trivia_local_datasource_impl.dart';
import 'package:data/datasources/number_trivia_remote_datasource_impl.dart';
import 'package:data/repositories/number_trivia_repository_impl.dart';
import 'package:data/utils/network_info.dart';
import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:domain/usecases/get_concrete_number_trivia_usecase_impl.dart';
import 'package:domain/usecases/get_random_number_trivia_usecase_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt locator = GetIt.instance;

Future<void> init() async {

  //ViewModel
  locator.registerFactory<TriviaViewModel>(() => TriviaViewModel(locator(), locator()));
  // Use cases
  locator.registerLazySingleton<GetConcreteNumberTriviaUseCase>(() => GetConcreteNumberTriviaUseCaseImpl(locator()));
  locator.registerLazySingleton<GetRandomNumberTriviaUseCase>(() => GetRandomNumberTriviaUseCaseImpl(locator()));

  // Repository
  locator.registerLazySingleton<NumberTriviaRepository>(
    () => NumberTriviaRepositoryImpl(
      localDatasource: locator(),
      networkInfo: locator(),
      remoteDatasource: locator(),
    ),
  );

  // Data sources
  locator.registerLazySingleton<NumberTriviaRemoteDatasource>(
    () => NumberTriviaRemoteDataSourceImpl(),
  );

  locator.registerLazySingleton<NumberTriviaLocalDatasource>(
    () => NumberTriviaLocalDataSourceImpl(sharedPreferences: locator()),
  );

  //! Core
  locator.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(locator()));

  final spref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => spref);
  locator.registerLazySingleton(() => DataConnectionChecker());
}