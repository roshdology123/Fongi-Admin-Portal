import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fongi_admin_portal/Screens/home_screen.dart';
import 'package:fongi_admin_portal/api_service/product_api_service.dart';
import 'package:fongi_admin_portal/core/app_router.dart';
import 'package:fongi_admin_portal/core/theme.dart';
import 'package:fongi_admin_portal/cubit/products_cubit.dart';
import 'package:fongi_admin_portal/repository/products_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductsCubit(ProductsRepository(APIService()),),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fongi Admin Portal',
        theme: themeData(),

        home: const HomeScreen(),
        onGenerateRoute: AppRouter.onGeneratedRoute,
        initialRoute: HomeScreen.routeName,
      ),
    );
  }
}
