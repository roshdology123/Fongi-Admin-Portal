
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fongi_admin_portal/api_service/product_api_service.dart';
import 'package:meta/meta.dart';

import '../models/product.dart';
import '../repository/products_repository.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {

  final ProductsRepository productsRepository;
  late List<Product> products;
  ProductsCubit(this.productsRepository) : super(ProductsInitial());

  List<Product> getProducts(){
    productsRepository.getProducts().then((products){
      emit(ProductsLoaded(products));
      this.products = products;
    });
    return products;
  }

  Future<void> addProduct(Product product)async {
      dynamic jsonProduct = product.toJson();
      await APIService().addProduct(jsonProduct);
  }


}
