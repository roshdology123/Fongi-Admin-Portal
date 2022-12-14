import 'package:cloudinary/cloudinary.dart';
import 'package:fongi_admin_portal/api_service/product_api_service.dart';
import 'package:image_picker/image_picker.dart';

import '../models/product.dart';

class ProductsRepository{
  final APIService apiService;

  ProductsRepository(this.apiService);


  Future<List<Product>> getProducts() async{
    final products = await apiService.getProducts();
    return products.map((product) => Product.fromJson(product)).toList();
  }
  Future<String> uploadImage(XFile? image) async{
    final cloudinary = Cloudinary.signedConfig(
      apiKey: '585771339728211',
      apiSecret: 'NSsh1Jb8H7tSAv_KNZUfyHdaRJI',
      cloudName: 'drmviwtea',
    );
    final response = await cloudinary.upload(
        file: image!.path,
        resourceType: CloudinaryResourceType.image,
        folder: 'Admin',
        fileName: image.name + " " + image.path,
        progressCallback: (count, total) {
          print(
              'Uploading image from file with progress: $count/$total');
        }

    );
    if(response.isSuccessful) {
      print('Get your image from with ${response.secureUrl}');
    }
    return response.secureUrl.toString();
}
}