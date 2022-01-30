import 'package:get_it/get_it.dart';
import 'package:wp_clone_provider/core/services/auth_service.dart';
import 'package:wp_clone_provider/core/services/chat_service.dart';
import 'package:wp_clone_provider/core/services/navigator_service.dart';
import 'package:wp_clone_provider/viewmodels/chats_model.dart';
import 'package:wp_clone_provider/viewmodels/sign_in_model.dart';

GetIt getIt = GetIt.instance;

setupLocators() {
  getIt.registerLazySingleton(() => NavigatorService());
  getIt.registerLazySingleton(() => ChatService());
  getIt.registerLazySingleton(() => AuthService());

  getIt.registerFactory(() => ChatsModel());
  getIt.registerFactory(() => SignInModel());
}
