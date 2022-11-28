import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fongi_admin_portal/core/constants.dart';
import 'package:fongi_admin_portal/screens/screens.dart';

class AppRouter {
  static Route onGeneratedRoute(RouteSettings settings){
    if (kDebugMode) {
      print('Routing to : ${settings.name}');
    }

    switch(settings.name){
      case '/':
        return HomeScreen.route();
      case '/products':
        return ProductsScreen.route();
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
  return MaterialPageRoute(
  settings: const RouteSettings(name: '/error'),
   builder: (_) => Scaffold(
     appBar: AppBar(
       title: const Text('Error'),
       centerTitle: true,
       backgroundColor: kMainColor,
     ),
     body: const Center(
       child: Text('Something went Wrong'),
     ) ,
   )
  );
  }
}
