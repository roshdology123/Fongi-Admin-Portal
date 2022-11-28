import 'package:flutter/material.dart';
import 'package:fongi_admin_portal/Screens/home_screen.dart';
import 'package:fongi_admin_portal/core/app_router.dart';
import 'package:fongi_admin_portal/core/theme.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fongi Admin Portal',
      theme: themeData(),
      home: const HomeScreen(),
      onGenerateRoute: AppRouter.onGeneratedRoute,
      initialRoute: HomeScreen.routeName,
    );
  }
}
