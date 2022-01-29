import 'package:get_it/get_it.dart';
import 'package:wp_clone_provider/core/services/firestore_db.dart';
import 'package:wp_clone_provider/viewmodels/chats_model.dart';

GetIt getIt = GetIt.instance;

setupLocators() {
  getIt.registerLazySingleton(() => FirestoreDb());
  getIt.registerFactory(() => ChatsModel());
}
