import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wp_clone_provider/core/locator.dart';
import 'package:wp_clone_provider/core/services/navigator_service.dart';
import 'package:wp_clone_provider/screens/sign_in_page.dart';
import 'package:wp_clone_provider/viewmodels/sign_in_model.dart';
import 'package:wp_clone_provider/whatsapp_main.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocators();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignInModel>(
      create: (context) => getIt<SignInModel>(),
      child: MaterialApp(
        title: 'WhatsApp Clone',
        navigatorKey: getIt<NavigatorService>().navigatorKey,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: Consumer<SignInModel>(
            builder: (context, SignInModel user, Widget? child) =>
                user.currentUser == null ? SignInPage() : WhatsAppMain()),
      ),
    );
  }
}
