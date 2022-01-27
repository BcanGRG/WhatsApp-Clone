import 'package:flutter/material.dart';
import 'package:wp_clone_provider/whatsapp_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Clone',
      theme: ThemeData(
        primaryColor: const Color(0xff075E54),
      ),
      home: WhatsAppMain(),
    );
  }
}
