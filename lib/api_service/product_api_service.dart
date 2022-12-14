import 'package:dio/dio.dart';
import 'package:fongi_admin_portal/core/constants.dart';
import 'package:fongi_admin_portal/models/product.dart';

class APIService{
  static Dio? dio;

  APIService(){
    BaseOptions options = BaseOptions(
      baseUrl: 'http://10.0.2.2:3000/products/',
      receiveDataWhenStatusError: true,
      connectTimeout: 20 * 1000,
      receiveTimeout: 20 *1000,
    );
    dio = Dio(options);
  }

  Future<List<dynamic>> getProducts() async{
    try {
      Response response = await dio!.get('');
      print(response.data.toList());
      return response.data;
    } on Exception catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<dynamic> addProduct(dynamic product) async{
    try{
      Response response = await dio!.post(
        '/addproduct',
        data: product,

      );
      print(response);
      return response;
    }catch (e){
      return print(e);
    }
  }

}