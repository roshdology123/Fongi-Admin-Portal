import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fongi_admin_portal/widgets/product_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

import '../core/constants.dart';
import '../cubit/products_cubit.dart';
import '../models/product.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  static const String routeName = '/products';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const ProductsScreen(),
    );
  }

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  late List<Product> products;

  @override
  void initState() {
    products = BlocProvider.of<ProductsCubit>(context).getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'Products',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ),
            backgroundColor: kMainColor,
          ),
          body: Container(
            color: kBackgroundColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    width: 92.w,
                    height: 15.h,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/newProduct');
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Add new product',
                            style: Theme.of(context).textTheme.headline3,
                          ),
                          const Icon(FontAwesomeIcons.plus),
                        ],
                      ),
                    ),
                  ),
                  BlocBuilder<ProductsCubit, ProductsState>(
                    builder: (context, state) {
                      if(state is ProductsInitial){
                        return const CircularProgressIndicator();
                      }
                      if(state is ProductsLoaded){
                        return ProductCard(
                          products: products,
                        );
                      }else{
                        return const Text('Something went wrong');
                      }

                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
