import 'package:fashion_app/core/services/auth/auth_service.dart';
import 'package:fashion_app/core/services/auth/auth_service_impl.dart';
import 'package:get_it/get_it.dart';

import 'services/database/db_service.dart';
import 'services/database/db_service_impl.dart';

GetIt serviceLocator = GetIt.instance;

setupLocator(){
  serviceLocator.registerLazySingleton<AuthService>(() => AuthServiceImpl());
  serviceLocator.registerLazySingleton<DBService>(() => DBServiceImpl());
}