import 'package:get_it/get_it.dart';
import 'package:junkiri/services/firestore_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => FirestoreService());
}