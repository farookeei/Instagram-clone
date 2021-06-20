import 'package:get_it/get_it.dart';
import 'package:test/core/database/feedDatabase.dart';
import 'package:test/core/models/feedModel.dart';
import 'dio_serices_API.dart';

GetIt locator = GetIt.instance;

void serviceLocators() {
  locator.registerLazySingleton<DioServicesAPI>(() => DioServicesAPI());
  locator.registerLazySingleton<FeedModelAdapter>(() => FeedModelAdapter());
  locator.registerLazySingleton<Feeddatabase>(() => Feeddatabase());
}
